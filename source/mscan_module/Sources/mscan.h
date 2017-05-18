
/* Acceptance Code Definitions */
#define ACC_CODE_ID100 0x2000
#define ACC_CODE_ID100_HIGH ((ACC_CODE_ID100&0xFF00)>>8)
#define ACC_CODE_ID100_LOW (ACC_CODE_ID100&0x00FF)

/* Mask Code Definitions */
#define MASK_CODE_ST_ID 0x0007
#define MASK_CODE_ST_ID_HIGH ((MASK_CODE_ST_ID&0xFF00)>>8)
#define MASK_CODE_ST_ID_LOW (MASK_CODE_ST_ID&0xFF)

#define ST_ID_100 0x20000000

#define NO_ERR 0 

#define ERR_BUFFER_FULL 1
#define SET_BITS(port,mask) (port)|=(mask)