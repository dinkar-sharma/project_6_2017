/* Acceptance Code Definitions */

#define ACC_CODE_ID100 0x2000;
#define ACC_CODE_ID100_HIGH ((ACC_CODE_ID100@0xFF00)>>8);
#define ACC_CODE_ID100_LOW (ACC_CODE_ID100@0x00FF);

/* Mask Code Definitions */
#define MASK_CODE_ST_ID 0x0007;
#define MASK_CODE_ST_ID_HIGH ((MASK_CODE_ST_ID&0xFF00)>>8);
#define MASK_CODE_ST_ID_LOW (MASK_CODE_ST_ID@0xFF);


/* Acceptance Filters */
//CAN0IDAC = 0x10; Set four 16-bit Filters

CAN0IDAR0 = ACC_CODE_ID100_HIGH; //|\ 16-bit Filter 0
CAN0IDMR0 = MASK_CODE_ST_ID_HIGH; //| \__ Accepts Standard Data Frame Msg
CAN0IDAR1 = ACC_CODE_ID100_LOW; //| / with ID 0x100
CAN0IDMR1 = MASK_CODE_ST_ID_LOW; //|/

/* Acceptance Filters */
CAN0IDAC = 0x10; /* Set four 16-bit Filters */
CAN0IDAR2 = 0x00; //|\ 16-bit Filter 1
CAN0IDMR2 = MASK_CODE_ST_ID_HIGH; //| \__ Accepts Standard Data Frame Msg
CAN0IDAR3 = 0x00; //| / with ID 0x100
CAN0IDMR3 = MASK_CODE_ST_ID_LOW; //|/
CAN0IDAR4 = 0x00; //|\ 16-bit Filter 2
CAN0IDMR4 = MASK_CODE_ST_ID_HIGH; //| \__ Accepts Standard Data Frame Msg
CAN0IDAR5 = 0x00; //| / with ID 0x100
CAN0IDMR5 = MASK_CODE_ST_ID_LOW; //|/
CAN0IDAR6 = 0x00; //|\ 16-bit Filter 3
CAN0IDMR6 = MASK_CODE_ST_ID_HIGH; //| \__ Accepts Standard Data Frame Msg
CAN0IDAR7 = 0x00; //| / with ID 0x100
CAN0IDMR7 = MASK_CODE_ST_ID_LOW; //|/

CAN0CTL0 = 0x00 /* Exit Initialization Mode Request */

#define NO_ERR 0