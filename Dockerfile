FROM ubuntu:22.04 as base
RUN apt update -q && apt install -y ca-certificates wget && \
    wget -qO /cuda-keyring.deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i /cuda-keyring.deb && apt update -q
ARG CUDA=12-2
ENV CUDA=${CUDA}

FROM base as builder
RUN apt update -q && apt install -y --no-install-recommends git cmake \
        cuda-nvcc-${CUDA} libcublas-dev-${CUDA}
RUN git clone --depth=1 https://github.com/wilicc/gpu-burn /build
RUN cd /build && make

FROM base as runner
RUN apt update -q && apt install -y --no-install-recommends libcublas-${CUDA}
COPY --from=builder /build/gpu_burn /build/compare.ptx /app/
WORKDIR /app
CMD ["./gpu_burn", "-tc", "-d", "300"]
