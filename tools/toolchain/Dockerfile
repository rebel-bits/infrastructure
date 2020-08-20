FROM rbits/ubuntu_20_base_env:latest as toolchain_box


COPY install_toolchain.sh /
RUN bash install_toolchain.sh && rm /install_toolchain.sh

