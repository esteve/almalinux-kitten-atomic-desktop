# ba0fde3d-bee7-4307-b97b-17d0d20aff50
# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx

COPY files/system /system_files/
COPY files/scripts /build_files/
COPY *.pub /keys/

# Base Image
#FROM quay.io/almalinuxorg/atomic-desktop-gnome:10@sha256:b1eaf6a0d8fdf971fc06d6676f4b195ca1aae21663b9a2a172c4f52c1f209e17
#FROM quay.io/almalinuxorg/almalinux-bootc:10-kitten@sha256:baa026123d22c79c30ae3561458c140bb116ab2823f6bc8f0efea1358ad1d1e2

FROM quay.io/almalinuxorg/almalinux-bootc:10@sha256:8e573afb73517577d096a62a8a8ddfdcbb78689ecf7491207bdac291bebaee43

ARG IMAGE_NAME
ARG IMAGE_REGISTRY
ARG VARIANT

RUN --mount=type=tmpfs,dst=/opt \
    --mount=type=tmpfs,dst=/tmp \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build_files/build.sh

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
