#include <stdio.h>
#include <altera_up_sd_card_avalon_interface.h>
#include <altera_up_avalon_audio.h>
#include <system.h>
#include <io.h>
#include <unistd.h>
#include <stdlib.h>
#define UINT16  unsigned int
#define BYTE    unsigned char


#define BUF_THRESHOLD 96		// 75% of 128 word buffer
#define NUM_OF_FILES 16			//Total number of files present to be played

const char *fileNames[NUM_OF_FILES]; //creates an array of sound names

void playSound(int sound);			//protoype of the playing functions

//these are varibles that are needed across the program by different functions
alt_up_sd_card_dev *device_reference = NULL;
alt_up_audio_dev *audio_dev_reference = NULL;
unsigned int size_array[NUM_OF_FILES];
UINT16* left_buffer;
int buffer_index=0;
UINT16 **buffers;
int sound = -1;
volatile int * audio_ptr = (int *) AUDIO_BASE;
unsigned int fifospace;


int main() {

	// these are the varibles that are used in the main loop
	short int file_handle = 1;
	BYTE file_data1;
	BYTE file_data2;
	BYTE file_data3;
	unsigned int  file_data =0;
	volatile int * sound_id_ptr = (int *) SOUNDS_IDS_BASE;
	volatile int * sound_start_ptr = (int *) START_SOUND_BASE;
	buffers = malloc(NUM_OF_FILES * sizeof(UINT16 *));
	int i;

	//set the file names up so that they can be referenced
	fileNames[0]="notokens.raw";
	fileNames[1]="COLLECT.raw";
	fileNames[2]="error.raw";
	fileNames[3]="insert.raw";
	fileNames[4]="niceday.raw";
	fileNames[5]="outofsrv.raw";
	fileNames[6]="thnkyou.raw";
	fileNames[7]="wait.raw";
	fileNames[8]="wait.raw";
	fileNames[9]="COLLECT.raw";
	fileNames[10]="error.raw";
	fileNames[11]="collect.raw";
	fileNames[12]="wait.raw";
	fileNames[13]="wait.raw";
	fileNames[14]="wait.raw";
	fileNames[15]="wait.raw";
	//printf("hi there sexy.\n");

	//set up the device references to the audio and the sdcard names as defined in the SOPC
	device_reference = alt_up_sd_card_open_dev("/dev/SDCARD");
	audio_dev_reference = alt_up_audio_open_dev("/dev/audio");

	if (device_reference != NULL) {			//if the sdcard reference has not failed go into the loop
		if (alt_up_sd_card_is_Present()) {	//check a card is present before trying to load it
			//printf("Card connected.\n");
			if (alt_up_sd_card_is_FAT16()) { //check the file format is fat16 as this is what we can read
				//printf("FAT16 file system detected.\n");
				for (i =0; i < NUM_OF_FILES;i++)	//load the number of files as defined earlier
				{
					file_handle = alt_up_sd_card_fopen(fileNames[i], false); //load the file as specifed depending on the iteration if not there do not create
					int size = alt_up_sd_card_get_size(file_handle);		//get the size in bytes of the file
					size_array[i]= (size/3);								//put the number samples needed into an array. to get sample mutiple the bytes to bits so times 8 then divide by 24 to get number of samples this simplfies to divide by 3
					//printf("size, %d.\n", size);
					printf("file handle= %d.\n",file_handle);
					fifospace = *(audio_ptr + 1);	 		// read the audio port fifospace register
					buffers[i] = malloc((size*2));			//set the buffer to point to memory location, doubled due to issue with malloc
					left_buffer = buffers[i];				//point left buffer to this location
					buffer_index = 0;						//reset buffer index
					while ((buffer_index < size_array[i]) ) //while the number of samples in buffer is less than total number of sample load a sample
					{
						file_data1 = alt_up_sd_card_read(file_handle); //load the 3 bytes indivually
						file_data2 = alt_up_sd_card_read(file_handle);
						file_data3 = alt_up_sd_card_read(file_handle);
						file_data = ((file_data3<<24 | file_data2<<16) | file_data1<<8);//contatiate the sample bytes back into a sigle sample
						left_buffer[buffer_index] = file_data; 			//puts this data in the buffer location
						buffer_index++;
					}
					alt_up_sd_card_fclose(file_handle);
				}
			}
			else {
				//printf("Unknown file system.\n");
			}
		} else if ((alt_up_sd_card_is_Present() == false)) {
			//printf("Card disconnected.\n");
		}
	}
	printf("sounds buffered and ready to play");
	while (1)
	{
		//sound = (*sound_id_ptr&0x07);	//get the input from the input port and bitmask to get number
		if ((*(sound_start_ptr)&0x01) ==1)			//if the start is high play the file
		{	sound = (*sound_id_ptr&0x0f);
			printf("sound is %d\n", sound);
			if (sound >=0 && sound < NUM_OF_FILES) //if the id is a valid number then you can play
			{
				playSound(sound);					//call the play functions
			}
		}
	}
	return 0;
}

void playSound (int n)
{
	left_buffer = buffers[n];				//set the buffer to the location of the requested sound file
	buffer_index=0;							//reset the buffer_index
	*(audio_ptr) = 0x8;						//clear the old fifo
	*(audio_ptr) = 0x0;						//stop clearing the fifo
	fifospace = *(audio_ptr + 1);	 		// read the audio port fifospace register
	if ( (fifospace & 0x00FF0000) > BUF_THRESHOLD ) 	// check WSRC
	{
		// output data until the buffer is empty or the audio-out FIFO is full
		while ( (buffer_index < size_array[n]) ){	//while the buffer index is less than size of samples
			fifospace = *(audio_ptr + 1);	// read the audio port fifospace register
			if((fifospace & 0x00FF0000) >BUF_THRESHOLD){	//if the fifo is not over 75% full
				*(audio_ptr + 2) = left_buffer[buffer_index];	//put data in the output fifos
				*(audio_ptr + 3) = left_buffer[buffer_index];
				++buffer_index;								//increment the buffer index
			}
		}
		fifospace = *(audio_ptr + 1);	// read the audio port fifospace register
	}
	//printf("file over.\n");
	sound = -1;							//set the sound invalid to prevent a repeated play

}