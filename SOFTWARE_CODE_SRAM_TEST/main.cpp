
//------------------------------------------------------------------------------
//                                                                            --
//     USE OF SOFTWARE. This software contains elements of software code      --
//     which is the property of Nallatech Limited (the "Nallatech Software"). --
//     Use of the Nallatech Software by you is permitted only if you hold a   --
//     valid license from Nallatech Limited or a valid sub-license from a     --
//     licensee of Nallatech Limited. Use of such software shall be governed  --
//     by the terms of such license or sub-license agreement.                 --
//                                                                            --
//     This Nallatech Software is protected by copyright law, patent law and  --
//     international treaties. Unauthorized reproduction or distribution of   --
//     this software, or any portion of it, may result in severe civil and    --
//     criminal penalties, and will be prosecuted to the maximum extent       --
//     possible under law.                                                    --
//                                                                            --
//     (c) Copyright 2001 - 2005 Nallatech Limited.                           --
//     All rights reserved.                                                   --
//                                                                            --
//------------------------------------------------------------------------------
//
// Requires import libraries and headers.
// dimesdl.lib imports dimesdl functions from dimesdl.dll
// dimetalk.lib imports dimetalk functions from dimetalk.dll
// dimesdl.h contains prototypes for FUSE API functions.
// dimetalk.h contains prototypes for DIMETalk API functions.
// All of these files can both be found in the FUSE\include directory

#include <cstdio>
#include <ctime>
#include <stdlib.h>
#include <cassert>
#include "tsc.h"
#include "Board.h"
#include "SRAM_Test.h"

using namespace std;

#define NUM_TESTS 10

double timerval();
int main(int argc, char* argv[])
{
  unsigned short *input;
  unsigned short *hwOutput;
  unsigned int i;
  unsigned int test, size;
  unsigned long safeSize;

  // initialize the board and application
  
  double clk[3] = {100.0, 100.0, 100.0};
  Board board(clk, "h101_pcixm_0.bit");
  SRAM_Test sramTest(board);

  // create input and output arrays. Notice that getSafeTransferSize()
  // is used to ensure that the size of the array is a multiple of the
  // minimum transfer size for the board. For example, if you have an
  // array of 3 16-bit numbers and want to read 3 16-bit elements from
  // the board, you would have to read at least 2 32-bit elements, which
  // would overwrite whatever follows the array in memory.
  safeSize = App::getSafeTransferSize(SRAM_Test::MAX_SIZE, sizeof(unsigned short));
  input = new unsigned short[safeSize];
 
  safeSize = App::getSafeTransferSize(SRAM_Test::MAX_SIZE, sizeof(unsigned short));
  hwOutput = new unsigned short[safeSize];

  assert(input != NULL);
  assert(hwOutput != NULL);
  
  // initialize input and output arrays
  for (i=0; i < SRAM_Test::MAX_SIZE; i++) {
      
      input[i] = i & 0xffff;
      hwOutput[i] = 0;
  }

  for (test = 0; test < NUM_TESTS; test++) {      
      for (size=1; size <= SRAM_Test::MAX_SIZE; size*=2) {
          
          // only test even addresses
          int addr = rand();            
          if ((addr % 2) == 1)
            addr ++;
          
          printf("Test %d: Size %d, Start Addr %x\n", test, size, addr);
          fflush(stdout);
          
          // start the FPGA, wait until done, and then get the output
           
          sramTest.start(input, size, addr);
          while(!sramTest.isDone());
          sramTest.getOutput(hwOutput, size, addr);

          // check for any errors
          
          for (i=0; i < size; i++) {
              if ((i & 0xffff) != hwOutput[i]) {
                  printf("ERROR!\n");
                  printf("HW = %d does not equal %d\n", hwOutput[i], i&0xffff);
                  exit(-1);
              }
          }           
      }
  }

  cout << "SUCCESS!!" << endl;
  
  delete input;
  delete hwOutput;
  return 0;
}

double timerval()
{
    struct timeval st;
    gettimeofday(&st,NULL);
    return st.tv_sec + st.tv_usec*1e-6;
}
