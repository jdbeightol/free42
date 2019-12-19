build:
	docker run -v $(PWD):/workspace -e DISPLAY=host.docker.internal:0 free42 make -C gtk -e BCD_MATH=1 AUDIO_ALSA=1

clean:
	make -C gtk cleaner

dev-build:
	docker build -t free42:latest .

dev:
	docker run -itv $(PWD):/workspace -e DISPLAY=host.docker.internal:0 free42

run: build
	docker run -v $(PWD):/workspace -e DISPLAY=host.docker.internal:0 free42 gtk/free42dec

debug: build
	docker run -itv $(PWD):/workspace -e DISPLAY=host.docker.internal:0 free42 gdb gtk/free42dec

remote-debug: build
	docker run -p 9001:9001 -itv $(PWD):/workspace -e DISPLAY=host.docker.internal:0 free42 gdbserver :9001 gtk/free42dec

.PHONY: build clean dev-build dev run debug remote-debug
