// Greg Stitt
// University of Florida

#include <cassert>
#include <iostream>

#include "Convolve.h"

using namespace std;

Kernel::Kernel(const unsigned short *kernel, unsigned int size) {
  
  allocated = false;

  if (size > Convolve::MAX_KERNEL_SIZE) {
      cerr << "Current FPGA implemenetation doesn't support kernels larger than " << Convolve::MAX_KERNEL_SIZE << endl;
      throw 1;
  }
  
  // kernel transferred to the FPGA needs to be 32 bits
  this->kernel = new unsigned int [Convolve::MAX_KERNEL_SIZE];
  this->size = Convolve::MAX_KERNEL_SIZE;

  for (unsigned i=0, j=0; i < Convolve::MAX_KERNEL_SIZE; i++) {

      if (i < size) {
          
          this->kernel[i] = kernel[j++];
      }
      else {

          this->kernel[i] = 0;
      }      
  }
  
  allocated = true;  
}

Kernel::~Kernel() {

  if (allocated)
     delete kernel;
}

unsigned int Kernel::getSize() const {
  return size;
}

unsigned int *Kernel::getKernel() const {
  return kernel;
}

ostream & operator<<(ostream& stream, const Kernel &k) {
  
  for (unsigned i=0; i < k.getSize(); i++) {   
    stream << k.kernel[i] << " ";
  }
  return stream;
}


Signal::Signal(const unsigned short *signal, unsigned int size) {

  this->unpaddedSize = size;
  this->size = size+2*(Convolve::MAX_KERNEL_SIZE-1);
  this->signal = new unsigned short [this->size];

  // pad the original signal based on the maximum kernel size that can
  // be handled by the FPGA
  
  for (unsigned i=0,j=0; i < this->size; i++) {
      
      if (i < Convolve::MAX_KERNEL_SIZE-1 || i >= size+Convolve::MAX_KERNEL_SIZE-1) {
          this->signal[i] = 0;
      }
      else {
          this->signal[i] = signal[j++];
      }      
  }
  
  allocated = true;  
}

Signal::~Signal() {

  if (allocated)
     delete signal;
}

unsigned int Signal::getSize() const {
  return size;
}

unsigned int Signal::getUnpaddedSize() const {
  return unpaddedSize;
}

unsigned short *Signal::getSignal() const {
  return signal;
}

ostream & operator<<(ostream& stream, const Signal &s) {
  
  for (unsigned i=0; i < s.getSize(); i++) {   
    stream << s.signal[i] << " ";
  }
  return stream;
}


Convolve::Convolve(Board &board) : App(board) {
  
}

Convolve::~Convolve() {
  
}

void Convolve::start(const unsigned short *signal, unsigned int signalSize, 
                     const unsigned short *kernel, unsigned int kernelSize) {

  assert(signal != NULL);
  assert(kernel != NULL);

  Signal paddedSignal(signal, signalSize);
  Kernel paddedKernel(kernel, kernelSize);

//  cout << "Signal = " << paddedSignal << endl;
//  cout << "Kernel = " << paddedKernel << endl;

  start(paddedSignal, paddedKernel);
}


void Convolve::getOutput(unsigned short *output, unsigned int outputSize) {
  
  assert(output != NULL);
  read(output, outputSize, 0, MEM_SRAM_1);
}


bool Convolve::isDone() {
  
  bool done;
  read(done, RA_DONE);
  return done;
}


void Convolve::start(Signal &signal, Kernel &kernel) {

  write(signal.getUnpaddedSize(),RA_SIZE);
  write(0,RA_IN_START_ADDR);
  write(0,RA_OUT_START_ADDR);

  write(signal.getSignal(), signal.getSize(), 0, MEM_SRAM_0);
  write(kernel.getKernel(), kernel.getSize(), RA_KERNEL);
  write(1,RA_GO); 
}

