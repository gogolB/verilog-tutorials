all: hvsync-generator

hvsync-generator: 
	make -C hvsync_generator all

.PHONY: clean 

clean:
	make -C hvsync_generator clean