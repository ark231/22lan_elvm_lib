LAN22_DIR = ../22lan
CC = g++
LAN22_FLAGS = #-d4
CFLAGS =
LAN22_STDLIB_DIR = ../stdlib


all: elvm_lib.22l elvm_lib.22libe

elvm_lib.22l: elvm_lib.22le elvm_lib.ext.csv ${LAN22_STDLIB_DIR}/utils.22libe
	$(LAN22_DIR)/22lan_deref.py -s elvm_lib.22le -e ${LAN22_STDLIB_DIR}/utils.22libe

elvm_lib.22libe: elvm_lib.22le elvm_lib.ext.csv
	$(LAN22_DIR)/22lan_deref.py -s elvm_lib.22le -l 22lan_extended_library

# test: test.22le test.ext.csv elvm_lib.22l elvm_lib.22libe
# 	$(LAN22_DIR)/22lan_deref.py -s test.22le -e elvm_lib.22libe
# 	$(LAN22_DIR)/22lan.py -s test.22l elvm_lib.22l -o test.cpp -l cxx $(LAN22_FLAGS)
# 	$(CC) test.cpp -o test $(CFLAGS)
#
clean:
	rm -f elvm_lib.22l elvm_lib.22libe
