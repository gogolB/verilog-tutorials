all: hvsync-generator

hvsync-generator: 
	make -C hvsync_generator

.PHONY: clean 

clean:
	make -C hvsync_generator clean