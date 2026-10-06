FROM alpine/curl AS build
ARG model=yolov8n
ARG version=v8.3.0
RUN curl -fL --retry 3 -o /model.pt https://github.com/ultralytics/assets/releases/download/${version}/${model}.pt

FROM scratch
COPY --from=build /model.pt /model.pt
