// Greg Stitt
// University of Florida

#ifndef _CONVOLVE_H_
#define _CONVOLVE_H_

#include "App.h"

#define RA_GO 0x00020000
#define RA_SIZE 0x00020001
#define RA_IN_START_ADDR 0x00020002
#define RA_OUT_START_ADDR 0x00020003
#define RA_DONE 0x00020004
#define RA_KERNEL 0x00020005

class Kernel {
  
 public:   
  Kernel(const unsigned short *kernel, unsigned int size);
  ~Kernel();

  unsigned int getSize() const;
  unsigned int *getKernel() const;

  friend std::ostream & operator<<(std::ostream& stream, const Kernel &k );

 protected:
  unsigned int *kernel;
  unsigned int size;
  bool allocated;
};


class Signal {
  
 public:
  Signal(const unsigned short *signal, unsigned int size);
  ~Signal();

  unsigned int getSize() const;
  unsigned int getUnpaddedSize() const;
  unsigned short *getSignal() const;

  friend std::ostream & operator<<(std::ostream& stream, const Signal &s );

 protected:
  unsigned short *signal;
  unsigned int size;
  unsigned int unpaddedSize;
  bool allocated;
};




class Convolve : public App {

 public:  

  Convolve(Board &board);
  ~Convolve();

  bool isDone();  
  void start(const unsigned short *signal, unsigned int signalSize,
             const unsigned short *kernel, unsigned int kernelSize);
  void getOutput(unsigned short *output, unsigned int outputSize);

  static const unsigned int MAX_KERNEL_SIZE = 96;
  // make sure to leave enough room for pre- and post-padding
  static const unsigned int MAX_SIGNAL_SIZE = (SRAM_SIZE/sizeof(unsigned short))-2*(MAX_KERNEL_SIZE-1);
  static const unsigned int MAX_OUTPUT_SIZE = SRAM_SIZE/sizeof(unsigned short);
  
protected:
  void start(Signal &signal, Kernel &kernel);

};

#endif
