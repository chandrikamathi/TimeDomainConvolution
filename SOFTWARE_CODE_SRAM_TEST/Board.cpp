// Greg Stitt
// University of Florida

#include <iostream>
#include <sstream>
#include <cassert>
#include <unistd.h>
#include <cstdio>
#include <stdlib.h>
#include "tsc.h"
#include "nalla_wrapper.h"
#include "Board.h"

Board::Board(double clk[3], const char *bitfile) {

  FPGA_init(clk[0], clk[1], clk[2]);
  FPGA_config(bitfile);
}

Board::~Board() {

  FPGA_release();
}

inline void Board::handleError(std::string str) {
	std::cerr << str << std::endl;
	throw 1;
}

inline void Board::assertFpgaMem(MemId mem) {
  std::stringstream s;
  
  if (mem < 0 || mem >= MEM_LAST) handleError("Invalid memory.");
}

inline void Board::assertWords(MemId mem, unsigned long words) {

  std::stringstream s;
  
  if (mem >= MEM_SRAM_0 && mem <= MEM_SRAM_3) {
      if (words > SRAM_ADDR_SPACE) {
          s << "Words (" << words << ") is more than the maximum amount of memory (" << SRAM_ADDR_SPACE << " 32-bit words).";
          handleError(s.str());
      }
  }
  else if (mem == MEM_SDRAM) {

      if (words > SDRAM_ADDR_SPACE) {
          s << "Words (" << words << ") is more than the maximum amount of memory (" << SDRAM_ADDR_SPACE << " 32-bit words).";
          handleError(s.str());
      }
  }
}


inline void Board::assertAddr(MemId mem, unsigned long addr) {
  std::stringstream s;

  if (mem != MEM_INT && (addr % 2) != 0) {

      s << "Addresses for external memories must be even.";
      handleError(s.str());
  }
}

inline bool Board::write(unsigned int *data, MemId mem, unsigned long addr, unsigned long words) {
  
  assertFpgaMem(mem);
  assertWords(mem, words);
  assertAddr(mem, addr); 
  FPGA_write((DWORD*) data, words, addr, mem, 1000);
  return true;
}

inline bool Board::read(unsigned int *data, MemId mem, unsigned long addr, unsigned long words) {

  assertFpgaMem(mem);
  assertWords(mem, words);
  assertAddr(mem, addr); 
  FPGA_read((DWORD*) data, words, addr, mem, 1000);
  return true;
}
