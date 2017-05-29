#define ST_ID_100 0x20000000

#define NO_ERR 0 

#define ERR_BUFFER_FULL 1

#define SET_BITS(port,mask) (port)|=(mask)
#define CLR_BITS(port,mask) ((port)&=((~mask)&0xFF))