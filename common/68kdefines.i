
PPCMemHeader		EQU	8
L1_CACHE_LINE_SIZE_040	EQU	16
COMMAND			EQU 	$4
IMR0			EQU 	$50
OMISR			EQU 	$30
OMIMR			EQU 	$34
IFQPR			EQU	$40
OFQPR			EQU	$44
OMR0			EQU 	$58
OMR1			EQU 	$5C
LMBAR			EQU 	$10
PCSRBAR			EQU 	$14
OMBAR			EQU 	$300
OTWR			EQU 	$308
WP_CONTROL		EQU 	$F48
WP_TRIG01		EQU 	$c0000000
MEMF_PPC		EQU 	$1000
StackSize		EQU 	$10000
TASKPPC_CTMEM		EQU 	252
TASKPPC_CONTEXTMEM	EQU	100
TASKPPC_NAME		EQU	800
NT_PPCTASK		EQU 	100
MN_ARG0			EQU	184
MN_ARG1			EQU	180
MN_ARG2			EQU	176
MN_MCTASK		EQU	188

FUNC_CNT	 EQU	-30		* Skip 4 standard vectors
FUNCDEF		 MACRO
_LVO\1		 EQU	FUNC_CNT
FUNC_CNT	 SET	FUNC_CNT-6	* Standard offset-6 bytes each
		 ENDM
