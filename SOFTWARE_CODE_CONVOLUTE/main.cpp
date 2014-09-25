// Greg Stitt
// University of Florida


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
#include "Convolve.h"

using namespace std;

#define BIG_KERNEL Convolve::MAX_KERNEL_SIZE
#define MEDIUM_KERNEL 40
#define SMALL_KERNEL 4

#define BIG_SIGNAL Convolve::MAX_SIGNAL_SIZE
#define MEDIUM_SIGNAL 100000
#define SMALL_SIGNAL 10


double timerval();

void convolveSW(const unsigned short* input, unsigned int inputSize,
                const unsigned short* kernel, unsigned int kernelSize,
                unsigned short *output) {

  unsigned int i,j;
  unsigned int outputSize = inputSize+kernelSize-1;
  memset(output, 0, sizeof(unsigned short)*outputSize);

  for (i=0; i < outputSize; i++) {
    for (j=0; j < kernelSize; j++) {

      unsigned int temp;
      unsigned int product;
      unsigned int sum;
      temp = (i>=j && i-j < inputSize) ? input[i-j] : 0;
      product = (unsigned int) kernel[j]*temp;      
      product = product > 0xffff ? 0xffff : product;
      sum = product + (unsigned int) output[i] > 0xffff ? 0xffff : product+output[i];
      output[i] = sum; 
    }
  }
}


bool convolveHW(Convolve &convolve,
                const unsigned short* input, unsigned int inputSize,
                const unsigned short* kernel, unsigned int kernelSize,
                unsigned short *output) {

  unsigned int outputSize = inputSize+kernelSize-1;

  try {
      
      convolve.start(input, inputSize, kernel, kernelSize);
      while(!convolve.isDone());
      convolve.getOutput(output, outputSize);  
  }
  catch(...) {
      
      fflush(stderr);   
      return false;
  }
  
  return true;  
}


bool checkOutput(const unsigned short* sw, const unsigned short *hw, 
                 unsigned int outputSize, float &percentCorrect) {

  unsigned errors = 0;
  bool isCorrect = true;
  
  for (unsigned i=0; i < outputSize; i++) {
      
      if (sw[i] != hw[i]) {
          printf("Error for output %d: HW = %d, SW = %d\n", i, hw[i], sw[i]);
          errors++;
          isCorrect = false;
      }
  }   

  percentCorrect = (outputSize-errors) / (float) outputSize;
  return isCorrect;
}


bool test(Convolve &convolve,
          const unsigned short* input, unsigned int inputSize,
          const unsigned short* kernel, unsigned int kernelSize,
          unsigned short *swOutput, unsigned short *hwOutput,
          float &percentCorrect, float &speedup) {
  
  unsigned int outputSize = inputSize+kernelSize-1;
  double swBefore, swAfter;
  double hwBefore, hwAfter;
  
  hwBefore = timerval();
  convolveHW(convolve, input, inputSize, kernel, kernelSize, hwOutput);
  hwAfter = timerval();
  
  swBefore = timerval();
  convolveSW(input, inputSize, kernel, kernelSize, swOutput);
  swAfter = timerval();
  
  speedup = (swAfter-swBefore)/(hwAfter-hwBefore);
  return checkOutput(swOutput, hwOutput, outputSize, percentCorrect);  
}


void testZeros(Convolve &convolve,
               unsigned short* input, unsigned int inputSize,
               unsigned short* kernel, unsigned int kernelSize,
               unsigned short *swOutput, unsigned short *hwOutput,
               float &percentCorrect, float &speedup) {

  for (unsigned i=0; i < inputSize; i++) {
      input[i] = 0;
  }

  for (unsigned i=0; i < kernelSize; i++) {
      kernel[i] = 0;
  }

  test(convolve,
       input, inputSize,
       kernel, kernelSize,
       swOutput, hwOutput,
       percentCorrect, speedup);
}


void testOnes(Convolve &convolve,
              unsigned short* input, unsigned int inputSize,
              unsigned short* kernel, unsigned int kernelSize,
              unsigned short *swOutput, unsigned short *hwOutput,
              float &percentCorrect, float &speedup) {

  for (unsigned i=0; i < inputSize; i++) {
      input[i] = 1;
  }

  for (unsigned i=0; i < kernelSize; i++) {
      kernel[i] = 1;
  }

  test(convolve,
       input, inputSize,
       kernel, kernelSize,
       swOutput, hwOutput,
       percentCorrect, speedup);
}


void testRandNoClip(Convolve &convolve,
                    unsigned short* input, unsigned int inputSize,
                    unsigned short* kernel, unsigned int kernelSize,
                    unsigned short *swOutput, unsigned short *hwOutput,
                    float &percentCorrect, float &speedup) {

  for (unsigned i=0; i < inputSize; i++) {
      input[i] = rand() % 0xf; // this should be small enough to not clip
  }

  for (unsigned i=0; i < kernelSize; i++) {
      kernel[i] = rand() % 0xf;
  }

  test(convolve,
       input, inputSize,
       kernel, kernelSize,
       swOutput, hwOutput,
       percentCorrect, speedup);
}


void testRand(Convolve &convolve,
              unsigned short* input, unsigned int inputSize,
              unsigned short* kernel, unsigned int kernelSize,
              unsigned short *swOutput, unsigned short *hwOutput,
              float &percentCorrect, float &speedup) {

  for (unsigned i=0; i < inputSize; i++) {
      input[i] = rand(); // this should produce values large enough to clip
  }

  for (unsigned i=0; i < kernelSize; i++) {
      kernel[i] = rand();
  }

  test(convolve,
       input, inputSize,
       kernel, kernelSize,
       swOutput, hwOutput,
       percentCorrect, speedup);
}


int main(int argc, char* argv[])
{
  double clk[3] = {100.0, 100.0, 100.0};
  Board board(clk, "h101_pcixm_0.bit");
  Convolve convolve(board);

  unsigned short *input;
  unsigned short *kernel;
  unsigned short *hwOutput;
  unsigned short *swOutput;
  unsigned int transferSize;
  float percentCorrect, speedup, score;

  transferSize = App::getSafeTransferSize(Convolve::MAX_SIGNAL_SIZE, sizeof(unsigned short));
  input = new unsigned short[transferSize];
  transferSize = App::getSafeTransferSize(Convolve::MAX_KERNEL_SIZE, sizeof(unsigned short));
  kernel = new unsigned short[transferSize];
  transferSize = App::getSafeTransferSize(Convolve::MAX_OUTPUT_SIZE, sizeof(unsigned short));
  hwOutput = new unsigned short[transferSize];
  swOutput = new unsigned short[Convolve::MAX_OUTPUT_SIZE];
  assert(input != NULL);
  assert(kernel != NULL);
  assert(swOutput != NULL);
  assert(hwOutput != NULL);

  score = 0.0;
  
  /////////////////////////////////////////////////////////////////////////////

  cout << "Testing small signal/kernel with all 0s..." << endl;

  testZeros(convolve, input, SMALL_SIGNAL, 
            kernel, SMALL_KERNEL, 
            swOutput, hwOutput, 
            percentCorrect, speedup);

  cout << "Percent correct = " << percentCorrect*100.0 << endl;
  cout << "Speedup = " << speedup << endl << endl;

  score += percentCorrect*.05;

  /////////////////////////////////////////////////////////////////////////////

  cout << "Testing small signal/kernel with all 1s..." << endl;

  testOnes(convolve, input, SMALL_SIGNAL, 
           kernel, SMALL_KERNEL, 
           swOutput, hwOutput, 
           percentCorrect, speedup);

  cout << "Percent correct = " << percentCorrect*100.0 << endl;
  cout << "Speedup = " << speedup << endl << endl;

  score += percentCorrect*.10;

  /////////////////////////////////////////////////////////////////////////////

  cout << "Testing small signal/kernel with random values (no clipping)..." << endl;

  testRandNoClip(convolve, input, SMALL_SIGNAL, 
                 kernel, SMALL_KERNEL, 
                 swOutput, hwOutput, 
                 percentCorrect, speedup);
  
  cout << "Percent correct = " << percentCorrect*100.0 << endl;
  cout << "Speedup = " << speedup << endl << endl;
  
  score += percentCorrect*.10;

  /////////////////////////////////////////////////////////////////////////////
  
  cout << "Testing medium signal/kernel with random values (no clipping)..." << endl;
  
  testRandNoClip(convolve, input, MEDIUM_SIGNAL, 
                 kernel, MEDIUM_KERNEL, 
                 swOutput, hwOutput, 
                 percentCorrect, speedup);
  
  cout << "Percent correct = " << percentCorrect*100.0 << endl;
  cout << "Speedup = " << speedup << endl << endl;

  score += percentCorrect*.15;
  
  /////////////////////////////////////////////////////////////////////////////
  
  cout << "Testing big signal/kernel with random values (no clipping)..." << endl;
  
  testRandNoClip(convolve, input, BIG_SIGNAL, 
                 kernel, BIG_KERNEL, 
                 swOutput, hwOutput, 
                 percentCorrect, speedup);
  
  cout << "Percent correct = " << percentCorrect*100.0 << endl;
  cout << "Speedup = " << speedup << endl << endl;
  
  score += percentCorrect*.15;

   /////////////////////////////////////////////////////////////////////////////

  cout << "Testing small signal/kernel with random values..." << endl;

  testRand(convolve, input, SMALL_SIGNAL, 
           kernel, SMALL_KERNEL, 
           swOutput, hwOutput, 
           percentCorrect, speedup);
  
  cout << "Percent correct = " << percentCorrect*100.0 << endl;
  cout << "Speedup = " << speedup << endl << endl;
  
  score += percentCorrect*.1;

  /////////////////////////////////////////////////////////////////////////////
  
  cout << "Testing medium signal/kernel with random values..." << endl;
  
  testRand(convolve, input, MEDIUM_SIGNAL, 
           kernel, MEDIUM_KERNEL, 
           swOutput, hwOutput, 
           percentCorrect, speedup);
  
  cout << "Percent correct = " << percentCorrect*100.0 << endl;
  cout << "Speedup = " << speedup << endl << endl;

  score += percentCorrect*.15;
  
  /////////////////////////////////////////////////////////////////////////////
  
  cout << "Testing big signal/kernel with random values..." << endl;
  
  testRand(convolve, input, BIG_SIGNAL, 
           kernel, BIG_KERNEL, 
           swOutput, hwOutput, 
           percentCorrect, speedup);
  
  score += percentCorrect*.20;

  cout << "Percent correct = " << percentCorrect*100.0 << endl;
  cout << "Speedup = " << speedup << endl << endl;
  cout << "TOTAL SCORE = " << score*100 << " out of " << 100 << endl;
  

  delete input;
  delete kernel;
  delete swOutput;
  delete hwOutput;
  return 0;
}

double timerval()
{
    struct timeval st;
    gettimeofday(&st,NULL);
    return st.tv_sec + st.tv_usec*1e-6;
}
