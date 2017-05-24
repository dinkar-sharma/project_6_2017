#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include <hidef.h>      /* common defines and macros */
#include "derivative.h"      /* derivative-specific definitions */
#include "mc9s12c32.h"
#include "mscan.h"


unsigned char CANSendFrame(unsigned long id, unsigned char priority, unsigned char length, unsigned char *txdata);
void CANInit(void);
void delay(int milliseconds);

void CANInit(void)
{
  //SET_BITS(CANCTL1, 0x80); // enable can module
  CANCTL1 = 0x80;
  CANCTL0 = 0x01;
  //SET_BITS(CANCTL0, 0x01); // enter initialization mode
  while(!(CANCTL1&0x01)){}; // initilization acknowledgment
  
  //SET_BITS(CANCTL1, 0x20);  // loopback mode
  SET_BITS(CANCTL1, 0x11);  // disable loopback mode 
  
  SET_BITS(CANCTL1, 0x40); // enable bus clock 8MHz
  //CANBTR0 = 0x07;
  SET_BITS(CANBTR0, 0x07); // set prescaler k = 8
  SET_BITS(CANBTR1, 0x23); // set N = 8, TEG1 = 4, TSEG2 = 3, TQ = 1
  //CANBTR1= 0x23;
  CLR_BITS(CANCTL0,0x01); // exit init mode
  while((CANCTL1&0x00) != 0) {}; // wait for normal mode
}

void main()
{
  unsigned char errorflag = NO_ERR;
  unsigned char txbuff[] = "ABCDEFGH";
  
  CANInit();
  while(!(CANCTL0&0x10)); 
  
  //SET_BITS(CANRFLG,0xC3);
  //SET_BITS(CANRIER,0x01);
  CANRFLG = 0xC3;
  CANRIER = 0x01;
  
  EnableInterrupts;
  
  for(;;)
  {
    errorflag = CANSendFrame(ST_ID_100, 0x00, (sizeof(txbuff)-1), txbuff);
    
    //delay(2);
  }          
}

unsigned char CANSendFrame(unsigned long id, unsigned char priority, unsigned char length, unsigned char *txdata)
{ 
  unsigned char txbuffer;
  int index=0;
   
  if (!CANTFLG)
  {
    return ERR_BUFFER_FULL;
  }/* Is Transmit Buffer full?? */
    
  
  CANTBSEL = CANTFLG; /* Select lowest empty buffer */
  txbuffer = CANTBSEL; /* Backup selected buffer */
  
  /* Load Id to IDR Register */
  *((unsigned long *) ((unsigned long)(&CANTXIDR0))) = id;
  
  for (index=0; index<length; index++) {
    *(&CANTXDSR0 + index) = txdata[index]; // Load data to Tx buffer
                                            // Data Segment Registers
  }
  
  CANTXDLR = length; // Set Data Length Code 
  CANTXTBPR = priority; // Set Priority 
  CANTFLG = txbuffer; // Start transmission 
  
  while ( (CANTFLG & txbuffer) != txbuffer); // Wait for Transmission completion

}


void delay(int milliseconds)
{
    long pause;
    clock_t now,then;

    pause = milliseconds*(CLOCKS_PER_SEC/1000);
    now = then = clock();
    while( (now-then) < pause )
        now = clock();
}

void interrupt CANRxISR(void)
{
  unsigned char length, index;
  unsigned char rxdata[8];
  
  length = (CANRXDLR&0x0F);
  for (index=0; index<length; index++) 
  {
    rxdata[index] = *(&CANRXDSR0 + index); // Get received data
  }

  CANRFLG = 0x01; // Clear RXF
}