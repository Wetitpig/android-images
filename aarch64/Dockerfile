FROM alpine:edge AS aarch64-ex
RUN apk update && \
	apk add p7zip wget qemu && \
	mkdir -p system && \
	wget https://dl.google.com/android/repository/sys-img/google_apis/arm64-v8a-25_r15.zip && \
	7z x arm64-v8a-25_r15.zip && \
	7z x arm64-v8a/ramdisk.img -osystem && \
	cd system && \
	cpio -i -F ramdisk && \
	rm ramdisk vendor && \
	cd .. && \
	7z x arm64-v8a/system.img -osystem -x'!etc' && \
	7z x arm64-v8a/system.img etc -osystem/system && \
	ln -sf system/vendor system/system/vendor && \
	7z x arm64-v8a/userdata.img -osystem/data && \
	cp -r arm64-v8a/data system/data

FROM scratch
COPY --from=aarch64-ex system/ /
ENTRYPOINT ["/init"]
