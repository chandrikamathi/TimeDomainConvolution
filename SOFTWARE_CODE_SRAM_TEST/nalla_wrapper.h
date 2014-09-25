#ifndef __NALLA_WRAPPER_
#define __NALLA_WRAPPER_

#ifdef __cplusplus
extern "C" {
#endif 
  
#include <dimesdl.h> 
#include <dimetalk.h>

/* Function Prototypes */
int DPRINT(FILE* logfile, const char* Message);

int FPGA_release();
int FPGA_config(const char *ffile);
int FPGA_reset2();
int FPGA_reset();
int FPGA_gethandle();
int FPGA_setclocks(double CLKA, double CLKB, double CLKC);

/* Useful Functions */
void FPGA_init(double a, double b, double c);
void FPGA_write(DWORD *az, int size, int addr, int node, int timeout);
void FPGA_read(DWORD *az, int size, int addr, int node, int timeout);

#ifdef __cplusplus
}
#endif 

#endif
