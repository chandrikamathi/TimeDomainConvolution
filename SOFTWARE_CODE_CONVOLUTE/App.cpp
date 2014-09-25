// Greg Stitt
// University of Florida

#include <stdlib.h>
#include <cmath>

#include "App.h"

using namespace std;

App::App(Board &board) : board(board) {
  
}

App::~App() {

}

void *App::malloc(unsigned long numBytes) {

  return malloc(getSafeTransferSize(numBytes,1));
}

unsigned long App::getSafeTransferSize(unsigned long elements,
                                       unsigned int bytesPerElement) {

  // TODO: Change 4 to a constant provided by Board class
  
  return (unsigned long) ceil(elements*bytesPerElement/4.0f)*4;
}
