/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * Xilinx EDK 11.3 EDK_LS3.57
 *
 * This file is a sample test application
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * XPS project when you run the "Generate Libraries" menu item
 * in XPS.
 *
 * Your XPS project directory is at:
 *    /home/phartke/slink/group/xupv5-lx110t/bsb_mdio_ethernetlist/
 */


// Removes the printfs for simulation
// #define SIM 1

// Located in: microblaze_0/include/xparameters.h
#include "xparameters.h"
#include "xutil.h"

#include "xemaclite.h"
#include "xemaclite_l.h"

#include "xwdttb.h"

#include "xaui_status.h"

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define EMAC_DEVICE_ID		XPAR_EMACLITE_0_DEVICE_ID
#define TIMER_DEVICE_ID     XPAR_WDTTB_0_DEVICE_ID
XEmacLite EmacLiteInstance;	/* Instance of the EmacLite */

//====================================================
// Added by James Hongyi Zeng
//====================================================
enum {
	AEL_I2C_CTRL        = 0xc30a,
	AEL_I2C_DATA        = 0xc30b,
	AEL_I2C_STAT        = 0xc30c
};

/* PHY module I2C device address */
enum {
	MODULE_DEV_ADDR	= 0xa0,
	SFF_DEV_ADDR	= 0xa2,
};

    // software reset and magic registers
const u16 regs0[] = {
        0x0000, 0xa040,
        0xc001, 0x0428,
        0xc017, 0xfeb0,
        0xc013, 0xf341,
        0xc210, 0x8000,
        0xc210, 0x8100,
        0xc210, 0x8000,
        0xc210, 0x0000,
        0xc04a, 0x5a00
        };
    
    // unpause the microprocessor
const u16 regs1[] = {
        0xca00, 0x0080,
        0xca12, 0x0000
        };
                
    // main EDC program
const u16 twinax_edc[] = {
		0xcc00, 0x4009,
		0xcc01, 0x27ff,
		0xcc02, 0x300f,
		0xcc03, 0x40aa,
		0xcc04, 0x401c,
		0xcc05, 0x401e,
		0xcc06, 0x2ff4,
		0xcc07, 0x3cd4,
		0xcc08, 0x2035,
		0xcc09, 0x3145,
		0xcc0a, 0x6524,
		0xcc0b, 0x26a2,
		0xcc0c, 0x3012,
		0xcc0d, 0x1002,
		0xcc0e, 0x29c2,
		0xcc0f, 0x3002,
		0xcc10, 0x1002,
		0xcc11, 0x2072,
		0xcc12, 0x3012,
		0xcc13, 0x1002,
		0xcc14, 0x22cd,
		0xcc15, 0x301d,
		0xcc16, 0x2e52,
		0xcc17, 0x3012,
		0xcc18, 0x1002,
		0xcc19, 0x28e2,
		0xcc1a, 0x3002,
		0xcc1b, 0x1002,
		0xcc1c, 0x628f,
		0xcc1d, 0x2ac2,
		0xcc1e, 0x3012,
		0xcc1f, 0x1002,
		0xcc20, 0x5553,
		0xcc21, 0x2ae2,
		0xcc22, 0x3002,
		0xcc23, 0x1302,
		0xcc24, 0x401e,
		0xcc25, 0x2be2,
		0xcc26, 0x3012,
		0xcc27, 0x1002,
		0xcc28, 0x2da2,
		0xcc29, 0x3012,
		0xcc2a, 0x1002,
		0xcc2b, 0x2ba2,
		0xcc2c, 0x3002,
		0xcc2d, 0x1002,
		0xcc2e, 0x5ee3,
		0xcc2f, 0x305,
		0xcc30, 0x400e,
		0xcc31, 0x2bc2,
		0xcc32, 0x3002,
		0xcc33, 0x1002,
		0xcc34, 0x2b82,
		0xcc35, 0x3012,
		0xcc36, 0x1002,
		0xcc37, 0x5663,
		0xcc38, 0x302,
		0xcc39, 0x401e,
		0xcc3a, 0x6f72,
		0xcc3b, 0x1002,
		0xcc3c, 0x628f,
		0xcc3d, 0x2be2,
		0xcc3e, 0x3012,
		0xcc3f, 0x1002,
		0xcc40, 0x22cd,
		0xcc41, 0x301d,
		0xcc42, 0x2e52,
		0xcc43, 0x3012,
		0xcc44, 0x1002,
		0xcc45, 0x2522,
		0xcc46, 0x3012,
		0xcc47, 0x1002,
		0xcc48, 0x2da2,
		0xcc49, 0x3012,
		0xcc4a, 0x1002,
		0xcc4b, 0x2ca2,
		0xcc4c, 0x3012,
		0xcc4d, 0x1002,
		0xcc4e, 0x2fa4,
		0xcc4f, 0x3cd4,
		0xcc50, 0x6624,
		0xcc51, 0x410b,
		0xcc52, 0x56b3,
		0xcc53, 0x3c4,
		0xcc54, 0x2fb2,
		0xcc55, 0x3002,
		0xcc56, 0x1002,
		0xcc57, 0x220b,
		0xcc58, 0x303b,
		0xcc59, 0x56b3,
		0xcc5a, 0x3c3,
		0xcc5b, 0x866b,
		0xcc5c, 0x400c,
		0xcc5d, 0x23a2,
		0xcc5e, 0x3012,
		0xcc5f, 0x1002,
		0xcc60, 0x2da2,
		0xcc61, 0x3012,
		0xcc62, 0x1002,
		0xcc63, 0x2ca2,
		0xcc64, 0x3012,
		0xcc65, 0x1002,
		0xcc66, 0x2fb4,
		0xcc67, 0x3cd4,
		0xcc68, 0x6624,
		0xcc69, 0x56b3,
		0xcc6a, 0x3c3,
		0xcc6b, 0x866b,
		0xcc6c, 0x401c,
		0xcc6d, 0x2205,
		0xcc6e, 0x3035,
		0xcc6f, 0x5b53,
		0xcc70, 0x2c52,
		0xcc71, 0x3002,
		0xcc72, 0x13c2,
		0xcc73, 0x5cc3,
		0xcc74, 0x317,
		0xcc75, 0x2522,
		0xcc76, 0x3012,
		0xcc77, 0x1002,
		0xcc78, 0x2da2,
		0xcc79, 0x3012,
		0xcc7a, 0x1002,
		0xcc7b, 0x2b82,
		0xcc7c, 0x3012,
		0xcc7d, 0x1002,
		0xcc7e, 0x5663,
		0xcc7f, 0x303,
		0xcc80, 0x401e,
		0xcc81, 0x004,
		0xcc82, 0x2c42,
		0xcc83, 0x3012,
		0xcc84, 0x1002,
		0xcc85, 0x6f72,
		0xcc86, 0x1002,
		0xcc87, 0x628f,
		0xcc88, 0x2304,
		0xcc89, 0x3c84,
		0xcc8a, 0x6436,
		0xcc8b, 0xdff4,
		0xcc8c, 0x6436,
		0xcc8d, 0x2ff5,
		0xcc8e, 0x3005,
		0xcc8f, 0x8656,
		0xcc90, 0xdfba,
		0xcc91, 0x56a3,
		0xcc92, 0xd05a,
		0xcc93, 0x21c2,
		0xcc94, 0x3012,
		0xcc95, 0x1392,
		0xcc96, 0xd05a,
		0xcc97, 0x56a3,
		0xcc98, 0xdfba,
		0xcc99, 0x383,
		0xcc9a, 0x6f72,
		0xcc9b, 0x1002,
		0xcc9c, 0x28c5,
		0xcc9d, 0x3005,
		0xcc9e, 0x4178,
		0xcc9f, 0x5653,
		0xcca0, 0x384,
		0xcca1, 0x22b2,
		0xcca2, 0x3012,
		0xcca3, 0x1002,
		0xcca4, 0x2be5,
		0xcca5, 0x3005,
		0xcca6, 0x41e8,
		0xcca7, 0x5653,
		0xcca8, 0x382,
		0xcca9, 0x002,
		0xccaa, 0x4258,
		0xccab, 0x2474,
		0xccac, 0x3c84,
		0xccad, 0x6437,
		0xccae, 0xdff4,
		0xccaf, 0x6437,
		0xccb0, 0x2ff5,
		0xccb1, 0x3c05,
		0xccb2, 0x8757,
		0xccb3, 0xb888,
		0xccb4, 0x9787,
		0xccb5, 0xdff4,
		0xccb6, 0x6724,
		0xccb7, 0x866a,
		0xccb8, 0x6f72,
		0xccb9, 0x1002,
		0xccba, 0x2d01,
		0xccbb, 0x3011,
		0xccbc, 0x1001,
		0xccbd, 0xc620,
		0xccbe, 0x14e5,
		0xccbf, 0xc621,
		0xccc0, 0xc53d,
		0xccc1, 0xc622,
		0xccc2, 0x3cbe,
		0xccc3, 0xc623,
		0xccc4, 0x4452,
		0xccc5, 0xc624,
		0xccc6, 0xc5c5,
		0xccc7, 0xc625,
		0xccc8, 0xe01e,
		0xccc9, 0xc627,
		0xccca, 0x000,
		0xcccb, 0xc628,
		0xcccc, 0x000,
		0xcccd, 0xc62b,
		0xccce, 0x000,
		0xcccf, 0xc62c,
		0xccd0, 0x000,
		0xccd1, 0x000,
		0xccd2, 0x2d01,
		0xccd3, 0x3011,
		0xccd4, 0x1001,
		0xccd5, 0xc620,
		0xccd6, 0x000,
		0xccd7, 0xc621,
		0xccd8, 0x000,
		0xccd9, 0xc622,
		0xccda, 0x0ce,
		0xccdb, 0xc623,
		0xccdc, 0x07f,
		0xccdd, 0xc624,
		0xccde, 0x032,
		0xccdf, 0xc625,
		0xcce0, 0x000,
		0xcce1, 0xc627,
		0xcce2, 0x000,
		0xcce3, 0xc628,
		0xcce4, 0x000,
		0xcce5, 0xc62b,
		0xcce6, 0x000,
		0xcce7, 0xc62c,
		0xcce8, 0x000,
		0xcce9, 0x000,
		0xccea, 0x2d01,
		0xcceb, 0x3011,
		0xccec, 0x1001,
		0xcced, 0xc502,
		0xccee, 0x609f,
		0xccef, 0xc600,
		0xccf0, 0x2a6e,
		0xccf1, 0xc601,
		0xccf2, 0x2a2c,
		0xccf3, 0xc60c,
		0xccf4, 0x5400,
		0xccf5, 0xc710,
		0xccf6, 0x700,
		0xccf7, 0xc718,
		0xccf8, 0x700,
		0xccf9, 0xc720,
		0xccfa, 0x4700,
		0xccfb, 0xc728,
		0xccfc, 0x700,
		0xccfd, 0xc729,
		0xccfe, 0x1207,
		0xccff, 0xc801,
		0xcd00, 0x7f50,
		0xcd01, 0xc802,
		0xcd02, 0x7760,
		0xcd03, 0xc803,
		0xcd04, 0x7fce,
		0xcd05, 0xc804,
		0xcd06, 0x520e,
		0xcd07, 0xc805,
		0xcd08, 0x5c11,
		0xcd09, 0xc806,
		0xcd0a, 0x3c51,
		0xcd0b, 0xc807,
		0xcd0c, 0x4061,
		0xcd0d, 0xc808,
		0xcd0e, 0x49c1,
		0xcd0f, 0xc809,
		0xcd10, 0x3840,
		0xcd11, 0xc80a,
		0xcd12, 0x000,
		0xcd13, 0xc821,
		0xcd14, 0x002,
		0xcd15, 0xc822,
		0xcd16, 0x046,
		0xcd17, 0xc844,
		0xcd18, 0x182f,
		0xcd19, 0xc013,
		0xcd1a, 0xf341,
		0xcd1b, 0xc01a,
		0xcd1c, 0x446,
		0xcd1d, 0xc024,
		0xcd1e, 0x1000,
		0xcd1f, 0xc025,
		0xcd20, 0xa00,
		0xcd21, 0xc026,
		0xcd22, 0xc0c,
		0xcd23, 0xc027,
		0xcd24, 0xc0c,
		0xcd25, 0xc029,
		0xcd26, 0x0a0,
		0xcd27, 0xc030,
		0xcd28, 0xa00,
		0xcd29, 0xc03c,
		0xcd2a, 0x01c,
		0xcd2b, 0x000,
		0xcd2c, 0x2b84,
		0xcd2d, 0x3c74,
		0xcd2e, 0x6435,
		0xcd2f, 0xdff4,
		0xcd30, 0x6435,
		0xcd31, 0x2806,
		0xcd32, 0x3006,
		0xcd33, 0x8565,
		0xcd34, 0x2b24,
		0xcd35, 0x3c24,
		0xcd36, 0x6436,
		0xcd37, 0x1002,
		0xcd38, 0x2b24,
		0xcd39, 0x3c24,
		0xcd3a, 0x6436,
		0xcd3b, 0x4045,
		0xcd3c, 0x8656,
		0xcd3d, 0x1002,
		0xcd3e, 0x2807,
		0xcd3f, 0x31a7,
		0xcd40, 0x20c4,
		0xcd41, 0x3c24,
		0xcd42, 0x6724,
		0xcd43, 0x1002,
		0xcd44, 0x2807,
		0xcd45, 0x3187,
		0xcd46, 0x20c4,
		0xcd47, 0x3c24,
		0xcd48, 0x6724,
		0xcd49, 0x1002,
		0xcd4a, 0x2514,
		0xcd4b, 0x3c64,
		0xcd4c, 0x6436,
		0xcd4d, 0xdff4,
		0xcd4e, 0x6436,
		0xcd4f, 0x1002,
		0xcd50, 0x2806,
		0xcd51, 0x3cb6,
		0xcd52, 0xc161,
		0xcd53, 0x6134,
		0xcd54, 0x6135,
		0xcd55, 0x5443,
		0xcd56, 0x303,
		0xcd57, 0x6524,
		0xcd58, 0x00b,
		0xcd59, 0x1002,
		0xcd5a, 0xd019,
		0xcd5b, 0x2104,
		0xcd5c, 0x3c24,
		0xcd5d, 0x2105,
		0xcd5e, 0x3805,
		0xcd5f, 0x6524,
		0xcd60, 0xdff4,
		0xcd61, 0x4005,
		0xcd62, 0x6524,
		0xcd63, 0x2e8d,
		0xcd64, 0x303d,
		0xcd65, 0x5dd3,
		0xcd66, 0x306,
		0xcd67, 0x2ff7,
		0xcd68, 0x38f7,
		0xcd69, 0x60b7,
		0xcd6a, 0xdffd,
		0xcd6b, 0x00a,
		0xcd6c, 0x1002,
		0xcd6d, 0    
                };

int ael2005_read (XEmacLite *InstancePtr, u32 PhyAddress, u32 PhyDev, u16 address, u16 *data);
int ael2005_write(XEmacLite *InstancePtr, u32 PhyAddress, u32 PhyDev, u16 address, u16 data);
// The following functions are commented out to minimize executable size
//int ael2005_i2c_write(XEmacLite *InstancePtr, u32 PhyAddress, u16 dev_addr, u16 word_addr, u16 data);
//int ael2005_i2c_read (XEmacLite *InstancePtr, u32 PhyAddress, u16 dev_addr, u16 word_addr, u16 *data);
int ael2005_sleep(int ms);

int ael2005_initialize(XEmacLite *InstancePtr);
int test_initialize(XEmacLite *InstancePtr, u32 xaui_status_base_address);
int test_status(XEmacLite *InstancePtr, u32 xaui_status_base_address);

int main (void) {

   /*
    * Enable and initialize cache
    */
   #if XPAR_MICROBLAZE_0_USE_ICACHE
      microblaze_invalidate_icache();
      microblaze_enable_icache();
   #endif

   #if XPAR_MICROBLAZE_0_USE_DCACHE
      microblaze_invalidate_dcache();
      microblaze_enable_dcache();
   #endif

   int i;
   XEmacLite *EmacLiteInstPtr = &EmacLiteInstance;
   XEmacLite_Config *ConfigPtr;

   ConfigPtr = XEmacLite_LookupConfig(EMAC_DEVICE_ID);
   XEmacLite_CfgInitialize(EmacLiteInstPtr, ConfigPtr, ConfigPtr->BaseAddress); 
   // Run it at least once
	test_initialize(EmacLiteInstPtr, XPAR_STATUS_BASEADDR);
	//test_status(EmacLiteInstPtr, XPAR_STATUS_BASEADDR);
	
   char s;
	    
		 print("\f===\033[1;34mNetFPGA-10G\033[m FPT 2010 Demo===\r\n");
       /*print("Press i to initialize, s to start\r\n");
       
       s = inbyte();
       if(s == 'i') 
           test_initialize(EmacLiteInstPtr, XPAR_STATUS_BASEADDR);
       else if (s == 's')
           test_status(EmacLiteInstPtr, XPAR_STATUS_BASEADDR);
       else
           continue;*/
	    test_status(EmacLiteInstPtr, XPAR_STATUS_BASEADDR);

   /*
    * Disable cache and reinitialize it so that other
    * applications can be run with no problems
    */
   #if XPAR_MICROBLAZE_0_USE_DCACHE
      microblaze_disable_dcache();
      microblaze_invalidate_dcache();
   #endif

   #if XPAR_MICROBLAZE_0_USE_ICACHE
      microblaze_disable_icache();
      microblaze_invalidate_icache();
   #endif
   return 0;
}

int ael2005_read (XEmacLite *EmacLiteInstPtr, u32 PhyAddr, u32 PhyDev, u16 address, u16 *data){
    XEmacLite_PhyWrite(EmacLiteInstPtr, PhyAddr, PhyDev, XEL_MDIO_OP_45_ADDRESS, XEL_MDIO_CLAUSE_45, address);
    XEmacLite_PhyRead(EmacLiteInstPtr, PhyAddr, PhyDev, XEL_MDIO_OP_45_READ, XEL_MDIO_CLAUSE_45, data);
    ael2005_sleep(20);
	 
	 XEmacLite_PhyWrite(EmacLiteInstPtr, PhyAddr, PhyDev, XEL_MDIO_OP_45_ADDRESS, XEL_MDIO_CLAUSE_45, address);
    XEmacLite_PhyRead(EmacLiteInstPtr, PhyAddr, PhyDev, XEL_MDIO_OP_45_READ, XEL_MDIO_CLAUSE_45, data);
    ael2005_sleep(20);
    return XST_SUCCESS;
}

int ael2005_write (XEmacLite *EmacLiteInstPtr, u32 PhyAddr, u32 PhyDev, u16 address, u16 data){
    XEmacLite_PhyWrite(EmacLiteInstPtr, PhyAddr, PhyDev, XEL_MDIO_OP_45_ADDRESS, XEL_MDIO_CLAUSE_45, address);
    XEmacLite_PhyWrite(EmacLiteInstPtr, PhyAddr, PhyDev, XEL_MDIO_OP_45_WRITE, XEL_MDIO_CLAUSE_45, data);
    ael2005_sleep(2);
    return XST_SUCCESS;
}

// The following functions are commented out to minimize executable size
/*int ael2005_i2c_write (XEmacLite *InstancePtr, u32 PhyAddress, u16 dev_addr, u16 word_addr, u16 data){
    u16 stat;
    int i;
    ael2005_write (InstancePtr, PhyAddress, 1, AEL_I2C_DATA, data);
    ael2005_write (InstancePtr, PhyAddress, 1, AEL_I2C_CTRL, (dev_addr << 8) | word_addr);
    for (i < 0; i < 200; i++){
        ael2005_sleep (10);
        ael2005_read  (InstancePtr, PhyAddress, 1, AEL_I2C_STAT, &stat);
        if ((stat & 3) == 1)
			return XST_SUCCESS;
	}
	return XST_DEVICE_BUSY;
}

int ael2005_i2c_read (XEmacLite *InstancePtr, u32 PhyAddress, u16 dev_addr, u16 word_addr, u16 *data){
    u16 stat;
    int i;
    ael2005_write (InstancePtr, PhyAddress, 1, AEL_I2C_CTRL, (dev_addr << 8) | (1 << 8) | word_addr);
    for (i < 0; i < 200; i++){
        ael2005_sleep (10);
        ael2005_read  (InstancePtr, PhyAddress, 1, AEL_I2C_STAT, &stat);
        if ((stat & 3) == 1){
            ael2005_read  (InstancePtr, PhyAddress, 1, AEL_I2C_DATA, &stat);
            *data = stat >> 8;
			return XST_SUCCESS;
	    }
	}
	return XST_DEVICE_BUSY;
}*/


int ael2005_sleep (int ms){

    int result_0 = XWdtTb_ReadReg(XPAR_XPS_TIMEBASE_WDT_0_BASEADDR, XWT_TBR_OFFSET);
    int result_1 = result_0;
    while(result_1 - result_0 < ms * 50000) {
        result_1 = XWdtTb_ReadReg(XPAR_XPS_TIMEBASE_WDT_0_BASEADDR, XWT_TBR_OFFSET);
    }
    return XST_SUCCESS;
}

int ael2005_initialize(XEmacLite *InstancePtr){
                
        int size, i, dev = 0;
        
        // Step 1
        size = sizeof(regs0) / sizeof(u16);
        for(i = 0; i < size; i+=2){
            for( dev = 0; dev < 4; dev++){
                ael2005_write(InstancePtr, dev, 1, regs0[i], regs0[i+1]);
            }
        }        
        ael2005_sleep(50);
        
        // Step 2
        size = sizeof(twinax_edc) / sizeof(u16);
        for(i = 0; i < size; i+=2){
            for( dev = 0; dev < 4; dev++){
                ael2005_write(InstancePtr, dev, 1, twinax_edc[i], twinax_edc[i+1]);                
            }
        }        
        
        // Step 3
        size = sizeof(regs1) / sizeof(u16);
        for(i = 0; i < size; i+=2){
            for( dev = 0; dev < 4; dev++){
                ael2005_write(InstancePtr, dev, 1, regs1[i], regs1[i+1]);
            }
        }        
        ael2005_sleep(50);    
        
        return XST_SUCCESS;    
}

int test_initialize(XEmacLite *InstancePtr, u32 xaui_status_base_address){
        Xuint32 baseaddr = (Xuint32) xaui_status_base_address;
        // Step 1
        print("Reset PHY, XAUI, XGMII, Aurora\r\n");
        XAUI_STATUS_mWriteSlaveReg13(baseaddr, 0, 0x7);
        ael2005_sleep(1000);
        
        // Step 2
        print("Release PHY, XAUI, Aurora\r\n");
        XAUI_STATUS_mWriteSlaveReg13(baseaddr, 0, 0x4);
        ael2005_sleep(1000);
        ael2005_initialize(InstancePtr);
        ael2005_sleep(2000);
        
        // Step 3
        print("Release XGMII\r\n");
        XAUI_STATUS_mWriteSlaveReg13(baseaddr, 0, 0x0);		  
		  
        return XST_SUCCESS;           
}

int test_status(XEmacLite *InstancePtr, u32 xaui_status_base_address){
        int read_result, read_result_2;
		  int i, dev;
		  int all_ok, aurora_ok, xaui_ok;
        u16 pma_status, pcs_status, phy_xs_status;
		  u16 rx_count, tx_count;
        /*print("INFO: Test started. It takes a while to ");
		  for (i = 0; i< 60; i++) {
		       outbyte('.');
		       ael2005_sleep(10);
	     }
		  print("finish.\r\n");*/
		  all_ok = 1;
		  xaui_ok = 0;
        Xuint32 baseaddr = (Xuint32) xaui_status_base_address;       
		  read_result = XAUI_STATUS_mReadSlaveReg7(baseaddr, 0);
		  if(!((read_result >> 27) & 0x1)) {
		      print("====================================\r\n");
		      print("WARNING: Unsupported Board Revision!\r\n");
		      print("====================================\r\n");
		  }
		  else
		      print("INFO: Detected Supported Board Revision.\r\n");
	     
		  if(((read_result >> 11) & 0x3F) == 0x15) {print("SRAM OK\r\n"); all_ok &= 1;}
		  else {xil_printf("SRAM error: Code %x\r\n", (read_result >> 11) & 0x3F); all_ok = 0;}
		  if(((read_result >> 17) & 0x3FF) == 0x35A) {print("DRAM OK\r\n"); all_ok &= 1;}
		  else {xil_printf("DRAM error: Code %x\r\n", (read_result >> 17) & 0x3FF); all_ok = 0;}
        if((read_result >> 6) & 0x1) {print("Power OK\r\n"); all_ok &= 1;}
		  else {print("Power error\r\n"); all_ok = 0;}
		  if((read_result >> 7) & 0x1) {print("CPLD OK\r\n"); all_ok &= 1;}
		  else {print("CPLD error\r\n"); all_ok = 0;}
		  if((read_result >> 8) & 0x1) {print("Flash OK\r\n"); all_ok &= 1;}
		  else {print("Flash error\r\n"); all_ok = 0;}
		  print("100MHz Clock OK\r\n"); // System Clock
		  if((read_result >> 9) & 0x1) {print("25MHz Clock OK\r\n"); all_ok &= 1;}
		  else {print("25MHz Clock error\r\n"); all_ok = 0;}
		  if((read_result >> 10) & 0x1) {print("Super Clock OK\r\n"); all_ok &= 1;}
		  else {print("Super Clock error\r\n"); all_ok = 0;}
		  
		  print("\r\nNetFPGA 10G Ethernet Interface Status\r\n");
		  
		  while(1){
		  for( i = 0; i < 4; i++){
		          xaui_ok = xaui_ok << 1;
		          switch(i){  // PHY0-3 -> C, B, A, D
                    case 0: 
						      dev = 2; 
								read_result_2 = XAUI_STATUS_mReadSlaveReg0(baseaddr, 0);
								break;
					     case 1: 
						      dev = 1; 
								read_result_2 = XAUI_STATUS_mReadSlaveReg1(baseaddr, 0);
								break;
						  case 2: 
						      dev = 0; 
								read_result_2 = XAUI_STATUS_mReadSlaveReg2(baseaddr, 0);
								break;
						  case 3: 
						      dev = 3; 
								read_result_2 = XAUI_STATUS_mReadSlaveReg3(baseaddr, 0);
								break;
						  default:;
					 }
					 ael2005_read(InstancePtr, dev, 1, 0x1, &pma_status);
					 ael2005_read(InstancePtr, dev, 3, 0x1, &pcs_status);
					 ael2005_read(InstancePtr, dev, 4, 0x1, &phy_xs_status);
					 //xil_printf("%x, %x, %x, %x\r\n", pma_status, pcs_status, phy_xs_status, (read_result>>i) & 0x1);
					 if(((pma_status>>2) & 0x1) &
					    ((pcs_status>>2) & 0x1) &
						 ((phy_xs_status>>2) & 0x1) &
						 ((read_result>>i) & 0x1)){
						    if(((read_result_2>>16)&0xFFFF) > (((read_result_2)&0xFFFF) + 10)){
							     xil_printf("PHY %d error: code %x\r\n", i, read_result_2);
								  all_ok = 0;
						    }
						    else {
							     xil_printf("PHY %d OK: ", i);
								  // Demo only
								  xil_printf("TX %5d, RX %5d\r\n", (read_result_2>>16)&0xFFFF, (read_result_2)&0xFFFF);								  
								  // End of Demo
							     all_ok &= 1;
								  xaui_ok += 1;
							 }
				    }
				    else {
					     xil_printf("PHY %d error: link down\r\n", i);
						  all_ok = 0;
				    }
						  
        }
		  ael2005_sleep(2000);
		  print("\033[4A");
		  }

		  
		  /*aurora_ok = 0;
		  if(((read_result >> 4) & 0x3) == 0x3) {	
            read_result = XAUI_STATUS_mReadSlaveReg6(baseaddr, 0);
            //xil_printf("Aurora Error 0: 0x%02x\t Aurora Error 1: 0x%02x\r\n", read_result & 0xFF, (read_result >> 16) & 0xFF);
		      if( ((read_result & 0xFF) < 625) && (((read_result >> 16) & 0xFF) <625)){//BER = 1e-8
				    print("Aurora OK\r\n");
				    aurora_ok = 1;
		      }
				else{
				    print("Aurora error: BER too high\r\n");					 
			   }
	     }
		  else {
		      print("Aurora error: Link down. Please check cable.\r\n");
		  }
		  XAUI_STATUS_mWriteSlaveReg13(baseaddr, 0, (xaui_ok << 5) | (all_ok << 4) | (aurora_ok << 3));*/
		  //read_result = XAUI_STATUS_mReadSlaveReg13(baseaddr, 0);
		  //xil_printf("Result code:%x, %x\r\n", read_result, xaui_ok);
        return XST_SUCCESS;
}
