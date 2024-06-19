FROM alpine:latest AS builder

RUN apk update && \
    apk add --no-cache \
    git \
    g++ \
    cmake \
    make \
    protobuf-dev \
    protobuf

WORKDIR /app
RUN git clone https://github.com/jshan0120/libplctag.git .
RUN mkdir build

WORKDIR /app/build
RUN cmake ..
RUN make

# Runtime

FROM alpine:latest AS runtime

RUN apk update && \
    apk add --no-cache \
    libstdc++ \
    protobuf

WORKDIR /app
COPY --from=builder /app/build/bin_dist /app/
COPY ab_server.sh /app/ab_server.sh

EXPOSE 44818

ENTRYPOINT ["./ab_server.sh"]
CMD ["tags.txt"]
