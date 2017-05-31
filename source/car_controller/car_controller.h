#ifndef _CAR_CONTROLLER_H
#define _CAR_CONTROLLER_H

typedef struct msgFrame
{
  unsigned long id;
  unsigned char priority;
  unsigned char length;
  unsigned char *txdata;
}*msgFrame_t;

#define DOOR_CLOSE		0x00
#define DOOR_OPEN		0x01

#define REQ_NONE		0x00
#define REQ_FLOOR_1		0x01
#define REQ_FLOOR_2		0x01
#define REQ_FLOOR_3		0x01


#endif