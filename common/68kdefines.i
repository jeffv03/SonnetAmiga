* Copyright (c) 2015-2017 Dennis van der Boon
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
SonBase			EQU	0
PPCMemHeader		EQU	8
PPERR_MISCERR		EQU	3
TF_PPC			EQU	4
TB_PPC			EQU	2
L1_CACHE_LINE_SIZE_040	EQU	16
COMMAND			EQU 	$4
IMR0			EQU 	$50
IMR1			EQU	$54
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
OPQI			EQU	$20000000
WP_CONTROL		EQU 	$F48
WP_TRIG01		EQU 	$c0000000
MEMF_PPC		EQU 	$2000
TASKPPC_NAME		EQU	1636
NoMemAccess		EQU	$400000
PageTableSize		EQU	$100000
MSG_LEN			EQU	192
MN_ARG0			EQU	184
MN_ARG1			EQU	180
MN_ARG2			EQU	176
MN_MCPORT		EQU	188
MN_STACKFRAME		EQU	188
_LVORawPutChar		EQU	-516	* Private function in Exec
NT_XMSG68K		EQU	102
VENDOR_ELBOX		EQU	$89e
VENDOR_ATI		EQU	$1002
VENDOR_3DFX		EQU	$121a
VENDOR_MOTOROLA		EQU	$1057
DEVICE_MPC107		EQU	$0004
DEVICE_VOODOO3		EQU	$0005
DEVICE_VOODOO4		EQU	$0007
DEVICE_VOODOO45		EQU	$0009
DEVICE_RV280PRO		EQU	$5960
DEVICE_RV280MOB		EQU	$5C63
DEVICE_RV280SE		EQU	$5964
MEDIATOR_MKII		EQU	33
MEDIATOR_1200TX		EQU	60
MEDIATOR_LOGIC		EQU	161
PCI_VERSION		EQU	11
HW_CPUTYPE		EQU	11	* Private
HW_SETDEBUGMODE		EQU	12	* Private
HW_PPCSTATE		EQU	13	* Private
EXCF_SYSTEMCALL		EQU	$00001000
EXCF_SYSMAN		EQU	$00100000
EXCF_THERMAN		EQU	$00800000
EXCF_VMXUN		EQU	$01000000

FUNC_CNT	 SET	-30		* Skip 4 standard vectors
FUNCDEF		 MACRO
_LVO\1		 EQU	FUNC_CNT
FUNC_CNT	 SET	FUNC_CNT-6	* Standard offset-6 bytes each
		 ENDM
