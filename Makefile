LAN22_DIR = ../22lan
CC = g++
LAN22_FLAGS = #-d4
LAN22_DEREF_FLAGS = 
CFLAGS =
LAN22_STDLIB_DIR = ../stdlib


all: elvm_lib.22l elvm_lib.22libe

elvm_lib.22l: elvm_lib.22le elvm_lib.ext.csv ${LAN22_STDLIB_DIR}/utils.22libe
	$(LAN22_DIR)/22lan_deref.py -s elvm_lib.22le -e ${LAN22_STDLIB_DIR}/utils.22libe ${LAN22_DEREF_FLAGS}

elvm_lib.22libe: elvm_lib.22le elvm_lib.ext.csv
	$(LAN22_DIR)/22lan_deref.py -s elvm_lib.22le -l 22lan_extended_library ${LAN22_DEREF_FLAGS}

elvm_lib.22le: 
	$(LAN22_DIR)/22lan_deref.py -s elvm_lib.22le -l 22lan_extended ${LAN22_DEREF_FLAGS}

clean:
	rm -f elvm_lib.22l elvm_lib.22libe
