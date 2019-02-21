FROM alpine:edge

RUN apk update && \
	apk add unzip wget qemu && \
	wget https://dl.google.com/android/repository/sys-img/google_apis/x86-25_r15.zip && \
	wget https://dl.google.com/android/repository/sys-img/google_apis/x86_64-25_r15.zip && \
	wget https://dl.google.com/android/repository/sys-img/google_apis/armeabi-v7a-25_r15.zip && \
	wget https://dl.google.com/android/repository/sys-img/google_apis/arm64-v8a-25_r15.zip && \
	unzip x86-25_r15.zip system.img && \
	mv system.img i686.img && \
	unzip x86_64-25_r15.zip system.img && \
	mv system.img x86-64.img && \
	unzip armeabi-v7a-25_r15.zip system.img && \
	mv system.img arm.img && \
	unzip arm64-v8a-25_r15.zip system.img && \
	mv system.img aarch64.img && \
	rm *.zip
