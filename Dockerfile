FROM alpine:edge AS extract

RUN apk update && \
	apk add p7zip wget qemu && \
	wget https://dl.google.com/android/repository/sys-img/google_apis/x86-25_r15.zip && \
	wget https://dl.google.com/android/repository/sys-img/google_apis/x86_64-25_r15.zip && \
	wget https://dl.google.com/android/repository/sys-img/google_apis/armeabi-v7a-25_r15.zip && \
	wget https://dl.google.com/android/repository/sys-img/google_apis/arm64-v8a-25_r15.zip && \
	7z x x86-25_r15.zip x86/system.img && \
	7z x x86_64-25_r15.zip x86_64/system.img && \
	7z x armeabi-v7a-25_r15.zip armeabi-v7a/system.img && \
	7z x arm64-v8a-25_r15.zip arm64-v8a/system.img && \
	rm *.zip && \
	7z x x86/system.img && \
	7z x x86_64/system.img && \
	7z x armeabi-v7a/system.img && \
	7z x arm64-v8a/system.img
