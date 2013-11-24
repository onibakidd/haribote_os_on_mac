IMG=os.img
 
all: ipl.asm
	make img
	make run
 
 
os.img: ipl.asm ipl.ls
	nasm -o $(IMG) ipl.asm -d ipl.ls
 
run: $(IMG)
	qemu-system-i386 -fda ipl.bin


 
img:;  make os.img
