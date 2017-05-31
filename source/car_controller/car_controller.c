#include <stdio.h>
#include <stdlib.h>

typedef struct msgFrame
{
  unsigned long id;
  unsigned char priority;
  unsigned char length;
  unsigned char *txdata;
}msgFrame_t;

