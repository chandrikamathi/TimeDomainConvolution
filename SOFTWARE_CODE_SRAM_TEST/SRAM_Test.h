// Greg Stitt
// University of Florida

#ifndef _SRAM_TEST_H_
#define _SRAM_TEST_H_

#include "App.h"

#define RA_GO 0x00020000
#define RA_SIZE 0x00020001
#define RA_IN_START_ADDR 0x00020002
#define RA_OUT_START_ADDR 0x00020003
#define RA_DONE 0x00020004

class SRAM_Test : public App {

 public:  

  SRAM_Test(Board &board);
  ~SRAM_Test();

  bool isDone();  
  void start(unsigned short *input, unsigned int inputSize, unsigned int addr);
  void getOutput(unsigned short *output, unsigned long outputSize, unsigned int addr);

  static const unsigned int MAX_SIZE = SRAM_SIZE/sizeof(unsigned short);

};

#endif
