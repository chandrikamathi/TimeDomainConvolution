// Greg Stitt
// University of Florida

#include <cassert>
#include <iostream>

#include "SRAM_Test.h"

using namespace std;

SRAM_Test::SRAM_Test(Board &board) : App(board) {
  
}

SRAM_Test::~SRAM_Test() {
  
}

void SRAM_Test::start(unsigned short *input, unsigned int inputSize, unsigned int addr) {

  assert(input != NULL);
  write(inputSize,RA_SIZE);  
  write(addr,RA_IN_START_ADDR);
  write(addr,RA_OUT_START_ADDR);
  write(input, inputSize, addr, MEM_SRAM_0);
  write(1,RA_GO); 
}


void SRAM_Test::getOutput(unsigned short *output, unsigned long outputSize, unsigned int addr) {
  
  assert(output != NULL);
  read(output, outputSize, addr, MEM_SRAM_1);
}


bool SRAM_Test::isDone() {
  
  bool done;
  read(done, RA_DONE);
  return done;
}


