FROM alpine:edge AS i686-ex
RUN apk update && \
	apk add p7zip aria2 qemu && \
	mkdir -p system && \
	aria2c -x 8 -k 2M http://dl.google.com/android/repository/sys-img/google_apis/x86-25_r15.zip && \
	7z x x86-25_r15.zip && \
	7z x x86/ramdisk.img -osystem && \
	cd system && \
	cpio -i -F ramdisk && \
	rm ramdisk vendor && \
	cd .. && \
	7z x x86/system.img -osystem -x'!etc' && \
	7z x x86/system.img etc -osystem/system && \
	ln -sf system/vendor system/system/vendor && \
	ln -sf system/bin system/system/bin && \
	7z x x86/userdata.img -osystem/data && \
	cp -r x86/data system/data && \
	chmod -R 777 system

FROM scratch
COPY --from=i686-ex system/ /
ENTRYPOINT ["/init"]
