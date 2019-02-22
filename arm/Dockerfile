FROM alpine:edge AS arm-ex
RUN apk update && \
	apk add p7zip wget qemu && \
	mkdir -p system && \
	wget https://dl.google.com/android/repository/sys-img/google_apis/armeabi-v7a-25_r15.zip && \
	7z x armeabi-v7a-25_r15.zip && \
	7z x armeabi-v7a/ramdisk.img -osystem && \
	cd system && \
	cpio -i -F ramdisk && \
	rm ramdisk vendor && \
	cd .. && \
	7z x armeabi-v7a/system.img -osystem -x'!etc' && \
	7z x armeabi-v7a/system.img etc -osystem/system && \
	ln -sf system/vendor system/system/vendor && \
	7z x armeabi-v7a/userdata.img -osystem/data && \
	cp -r armeabi-v7a/data system/data

FROM scratch
COPY --from=arm-ex system/ /
ENTRYPOINT ["/init"]
