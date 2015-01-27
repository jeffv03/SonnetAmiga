clearreg	macro
		lis \1, 0
		mr \1,\1
		endm

loadreg 	macro
		IFEQ High(\2)
		li      \1, \2
    		ELSEIF
        	lis     \1, High(\2)
        	ori     \1, \1, Low(\2)
    		ENDC
		endm

setpcireg	macro
		ori r23,r22,\1
		endm
		
mfl2cr3		macro				
		dc.l $7c79faa6		;r3	Let's do this different when we've the time...
		endm
		
mtl2cr3		macro
		dc.l $7c79fba6		;r3
		endm				


mfl2cr4		macro
		dc.l $7c99faa6		;r4
		endm
		
mtl2cr4		macro
		dc.l $7c99fba6		;r4
		endm				


mfl2cr5		macro
		dc.l $7cb9faa6		;r5
		endm
		
mtl2cr5		macro
		dc.l $7cb9fba6		;r5
		endm				



HID0		EQU	1008
HID0_NHR	EQU	$00010000
HID0_ICFI	EQU	$00000800
HID0_DCFI	EQU	$00000400
HID0_ICE	EQU	$00008000
HID0_DCE	EQU	$00004000
HID0_SGE	EQU	$00000080
HID0_BTIC	EQU	$00000020
HID0_BHTE	EQU	$00000004

PPC_MSR_FP	EQU	$00002000
L2CR		EQU	1017
PVR		EQU	287
CTR		EQU	9


srr0		EQU	26
srr1		EQU	27
SPRG0		EQU	272
SPRG1		EQU	273
SPRG2		EQU	274
SPRG3		EQU	275
PSL_IR		EQU	32
PSL_DR		EQU	16
CONFIG_ADDR	EQU	$FEC0
CONFIG_DAT	EQU	$FEE0
CMD_BASE	EQU	$8000
VEC_BASE	EQU	$FFF0
EUMBBAR		EQU	$78		;At 0x80000000 (Sonnet side)
EUMB		EQU	$8000
EUMBEPICPROC	EQU	$8006
EUMBEPICCONF	EQU	$8004
EUMBEPICINT	EQU	$8005
EUMBF		EQU	$800F
EPIC_GCR	EQU	$41020
EPIC_PCTPR	EQU	$60080
EPIC_FRR	EQU	$41000
EPIC_EICR	EQU	$41030
EPIC_IVPR0	EQU	$50200
EPIC_IVPR3	EQU	$50260
EPIC_IVPR4	EQU	$50280
EPIC_IIVPR3	EQU	$510c0
IMIMR		EQU	$104
PCI_COMMAND	EQU	$4
OMBAR		EQU	$2300
OTWR		EQU	$2308
ITWR		EQU	$2310
LMBAR		EQU	$10
MSAR1		EQU	$80
MSAR2		EQU	$84
MESAR1		EQU	$88
MESAR2		EQU	$8C
MEAR1		EQU	$90
MEAR2		EQU	$94
MEEAR1		EQU	$98
MEEAR2		EQU	$9C
MBEN		EQU	$A0

MCCR1		EQU	$F0
MCCR2		EQU	$F4
MCCR3		EQU	$F8
MCCR4		EQU	$FC


ibat0u		EQU	528
ibat0l		EQU	529
ibat1u		EQU	530
ibat1l		EQU	531
ibat2u		EQU	532
ibat2l		EQU	533
ibat3u		EQU	534
ibat3l		EQU	535

dbat0u		EQU	536
dbat0l		EQU	537
dbat1u		EQU	538
dbat1l		EQU	539
dbat2u		EQU	540
dbat2l		EQU	541
dbat3u		EQU	542
dbat3l		EQU	543

; general BAT defines for bit settings to compose BAT regs
; represent all the different block lengths
; The BL field	 is part of the Upper Bat Register

BAT_BL_128K 	EQU	$00000000
BAT_BL_256K 	EQU 	$00000004
BAT_BL_512K 	EQU	$0000000C
BAT_BL_1M 	EQU 	$0000001C
BAT_BL_2M 	EQU 	$0000003C
BAT_BL_4M 	EQU 	$0000007C
BAT_BL_8M 	EQU 	$000000FC
BAT_BL_16M 	EQU 	$000001FC
BAT_BL_32M 	EQU 	$000003FC
BAT_BL_64M 	EQU 	$000007FC
BAT_BL_128M 	EQU 	$00000FFC
BAT_BL_256M 	EQU 	$00001FFC

; supervisor/user valid mode definitions  - Upper BAT
BAT_VALID_SUPERVISOR 	EQU 	$00000002
BAT_VALID_USER 		EQU 	$00000001
BAT_INVALID 		EQU 	$00000000

; WIMG bit settings  - Lower BAT
BAT_WRITE_THROUGH 	EQU 	$00000040
BAT_CACHE_INHIBITED 	EQU 	$00000020
BAT_COHERENT 		EQU 	$00000010
BAT_GUARDED 		EQU 	$00000008

; Protection bits - Lower BAT
BAT_NO_ACCESS	EQU 	$00000000
BAT_READ_ONLY 	EQU 	$00000001
BAT_READ_WRITE	EQU 	$00000002

; Bit defines for the L2CR register
L2CR_L2E 	EQU 	$80000000 		; bit 0 - enable
L2CR_L2PE 	EQU 	$40000000 		; bit 1 - data parity
L2CR_L2SIZ_2M 	EQU 	$00000000 		; bits 2-3 2 MB; MPC7400 ONLY!
L2CR_L2SIZ_1M 	EQU 	$30000000 		; bits 2-3 1MB
L2CR_L2SIZ_HM 	EQU 	$20000000 		; bits 2-3 512K
L2CR_L2SIZ_QM 	EQU 	$10000000 		; bits 2-3 256K; MPC750 ONLY
L2CR_L2CLK_1 	EQU 	$02000000 		; bits 4-6 Clock Ratio div 1
L2CR_L2CLK_1_5 	EQU 	$04000000 		; bits 4-6 Clock Ratio div 1.5
L2CR_L2CLK_2 	EQU 	$08000000 		; bits 4-6 Clock Ratio div 2
L2CR_L2CLK_2_5 	EQU 	$0a000000 		; bits 4-6 Clock Ratio div 2.5
L2CR_L2CLK_3 	EQU 	$0c000000 		; bits 4-6 Clock Ratio div 3
L2CR_L2RAM_BURST EQU 	$01000000 		; bits 7-8 burst SRAM
L2CR_DO 	EQU 	$00400000 		; bit 9 Enable caching of instr. in L2
L2CR_L2I 	EQU 	$00200000 		; bit 10 Global invalidate bit
L2CR_TS 	EQU 	$00040000 		; bit 13 Test support on 
L2CR_TS_OFF 	EQU 	~L2CR_TS   		; bit 13 Test support off
L2CR_L2OH_5 	EQU 	$00000000 		; bits 14-15 Output Hold time = 0.5ns*/
L2CR_L2OH_1 	EQU 	$00010000 		; bits 14-15 Output Hold time = 1.0ns*/
L2CR_L2OH_INV 	EQU 	$00020000 		; bits 14-15 Output Hold time = 1.0ns*/
L2CR_L2IP	EQU	$00000001

; first, set address ranges for the devices I'm mapping with the BATs. 
; The memory model for my board has ROM at fff000000 and RAM at $00000000. 

PROM_BASE 	EQU 	$fc000000		; IOSPACE and 'ROM'
PRAM_BASE 	EQU 	$00000000
VROM_BASE 	EQU 	PROM_BASE
VRAM_BASE 	EQU 	PRAM_BASE
PCI_BASE 	EQU 	$80000000

IBAT0L_VAL EQU (PROM_BASE|BAT_CACHE_INHIBITED|BAT_READ_WRITE)
IBAT0U_VAL EQU (VROM_BASE|BAT_VALID_SUPERVISOR|BAT_VALID_USER|BAT_BL_64M)
DBAT0L_VAL EQU IBAT0L_VAL
DBAT0U_VAL EQU IBAT0U_VAL
IBAT1L_VAL EQU (PRAM_BASE|BAT_READ_WRITE)
IBAT1U_VAL EQU (VRAM_BASE|BAT_BL_256M|BAT_VALID_SUPERVISOR|BAT_VALID_USER)
DBAT1L_VAL EQU IBAT1L_VAL
DBAT1U_VAL EQU IBAT1U_VAL
IBAT2L_VAL EQU (PRAM_BASE+$10000000|BAT_READ_WRITE)
IBAT2U_VAL EQU (VRAM_BASE+$10000000|BAT_BL_128M|BAT_VALID_SUPERVISOR|BAT_VALID_USER)
DBAT2L_VAL EQU IBAT2L_VAL
DBAT2U_VAL EQU IBAT2U_VAL
IBAT3L_VAL EQU (PCI_BASE|BAT_CACHE_INHIBITED|BAT_GUARDED|BAT_READ_WRITE)
IBAT3U_VAL EQU (PCI_BASE|BAT_BL_256M|BAT_VALID_SUPERVISOR|BAT_VALID_USER)
DBAT3L_VAL EQU (PCI_BASE|BAT_CACHE_INHIBITED|BAT_GUARDED|BAT_READ_WRITE)
DBAT3U_VAL EQU (PCI_BASE|BAT_BL_256M|BAT_VALID_SUPERVISOR|BAT_VALID_USER)



MPC750 		EQU 	$1

L1_CACHE_LINE_SIZE	EQU	32
