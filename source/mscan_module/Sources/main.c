#include <hidef.h>      /* common defines and macros */
#include "derivative.h"      /* derivative-specific definitions */
#include "mc9s12c32.h"
#include "mscan.h"


void main () {   
 unsigned char errorflag = NO_ERR;   
 unsigned char txbuff[] = "ABCDEFGH";
 
 CANInit();   
 while (!(CAN0CTL0&0x10));   
 CAN0RFLG = 0xC3;   
 CAN0RIER = 0x01;   
 while ((CAN0CTL1&0x00) != 0) {} /* Wait for Normal Mode */
 
 Enable Interrupts;   
  
 for (;;) {        
    errorflag = CAN0SendFrame((ST_ID_100), 0x00, sizeof(txbuff)-1, txbuff);        
    Delay();  
  }

}

void CANInit (void)
CAN0CTL0 = 0x01; /* Enter Initialization Mode */
while (! (CANOCTL1&0x01)) {}; /* Wait for Initialization Mode */
                              /* acknowledge (INITRQ bit = 1) */
 
unsigned char CAN0SendFrame *unsigned log id, _unsigned char priority, _unsigned char length, _unsigned char *txdata )
{ 
  if (!CAN0TFLG) /* Is Transmit Buffer full?? */
    return ERR_BUFFER_FULL;
  CAN0TBSEL = CANOTFLG; /* Select lowest empty buffer */
  txbuffer = CAN0TBSEL; /* Backup selected buffer */
 
}

/* Load Id to IDR Register */
  *((unsigned long *) ((unsigned long)(&CAN0TXIDR0))) = id;
  for (index=0;index<length;index++) {
    *(&CAN0TXDSR0 + index) = txdata[index]; /* Load data to Tx buffer
     *Data Segment Registers*/
  }
 
 
 CAN0TXDLR = length; /* Set Data Length Code */
 CAN0TXTBPR = priority; /* Set Priority */
 CAN0TFLG = txbuffer; /* Start transmission */
 while ( (CAN0TFLG & txbuffer) != txbuffer); /* Wait for Transmission */
 /* completion*/
 
 void interrupt CAN0RxISR(void)
{
 unsigned char length, index;
 unsigned char rxdata[8];
 length = {CAN0RXDLR & 0x0F);
 for (index=0; index<length; index++)
 rxdata[index] = *(&CAN0RXDSR0 + index); /* Get received data */
 CAN0RFLG = 0x01; /* Clear RXF */
