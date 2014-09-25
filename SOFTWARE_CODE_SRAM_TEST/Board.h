// Greg Stitt
// University of Florida

#ifndef _BOARD_
#define _BOARD_

#include <string>

#define TOTAL_MEMORIES 5

#define MEM_INT_ADDR_SPACE (1 << 32)
#define SRAM_ADDR_SPACE (1 << 20)
#define SRAM_SIZE (SRAM_ADDR_SPACE*4)
// fix this
#define SDRAM_ADDR_SPACE (1 << 21)

enum MemId {
  MEM_INT=1,
  MEM_SRAM_0,
  MEM_SRAM_1,
  MEM_SRAM_2,
  MEM_SRAM_3,
  MEM_SDRAM,
  MEM_LAST  // this is an invalid memory and is used for bounds checking only
};


class Board {
public:
  
  Board(double clk[3], const char *bitfile);
  virtual ~Board();
  
  virtual bool write(unsigned int *data, MemId mem, unsigned long addr, unsigned long words);
  virtual bool read(unsigned int *data, MemId mem, unsigned long addr, unsigned long words);
  
protected:
  void assertFpgaMem(MemId mem);
  void assertWords(MemId mem, unsigned long words);
  void assertAddr(MemId mem, unsigned long addr);
  void handleError(std::string str);     
};

#endif
