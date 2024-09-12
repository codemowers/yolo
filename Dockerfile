ARG model=yolov8n
ARG version=v8.2.0
FROM alpine/curl AS build
RUN curl -O https://github.com/ultralytics/assets/releases/download/${version}/${model}.pt

FROM scratch
COPY --from=build ${model}.pt /model.pt
