FROM rust:1.91-slim-trixie

# Environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TOKEI_VER=12.1.2
ENV KERNEL_VER=v6.17

# Install system dependencies (git, python3)
RUN apt update && apt install --yes git python3

# Install tokei from crates.io at specific version
RUN cargo install tokei --version ${TOKEI_VER}

# Shallow clone the kernel source at specific version
WORKDIR /app
RUN git clone --depth 1 --branch "${KERNEL_VER}" https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git "linux_${KERNEL_VER}"

# Copy the script to count LoC of programming languages into container
COPY sum_linux_programming_loc.py .
RUN chmod +x sum_linux_programming_loc.py

# Run tokei and compute total LoC of only programming languages
CMD tokei --output json --compact . > tokei_output.json && \
    python3 sum_linux_programming_loc.py tokei_output.json

