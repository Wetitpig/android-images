FROM alpine:edge AS arm-ex
RUN apk update && \
	apk add p7zip aria2 qemu && \
	mkdir -p system && \
	aria2c -x 8 -k 2M https://dl.google.com/android/repository/sys-img/google_apis/armeabi-v7a-25_r15.zip && \
	7z x armeabi-v7a-25_r15.zip && \
	7z x armeabi-v7a/ramdisk.img -osystem && \
	cd system && \
	cpio -i -F ramdisk && \
	rm ramdisk vendor && \
	cd .. && \
	7z x armeabi-v7a/system.img -osystem -x'!etc' && \
	7z x armeabi-v7a/system.img etc -osystem/system && \
	ln -sf system/vendor system/system/vendor && \
	ln -sf system/system/bin system/bin && \
	7z x armeabi-v7a/userdata.img -osystem/data && \
	cp -r armeabi-v7a/data system/data && \
	chmod -R 777 system

FROM scratch
COPY --from=arm-ex system/ /
ENTRYPOINT ["/init"]
