###Rutabaga_gfxstream-For-Debian-Make-Script###
build:

	#Build gfxstream
	git clone https://android.googlesource.com/platform/hardware/google/gfxstream
	cd gfxstream/;meson setup -Ddefault_library=static build;cd ..

	#Build rutabaga_gfxstream_ffi
	git clone https://chromium.googlesource.com/crosvm/crosvm
	cd crosvm/rutabaga_gfx/ffi/;meson setup -Ddefault_library=static build;cd ../../..


install:
	###Delete the informal symbolic link and rebuild them
	cd crosvm/rutabaga_gfx/ffi/ && meson install -C build && cd ../../..
	cd gfxstream/;meson install -C build;cd ..


clean:
	rm -rf gfxstream
	rm -rf crosvm


