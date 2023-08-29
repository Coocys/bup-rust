FROM rust:1.71

WORKDIR /rust-bup

RUN cargo init
COPY Cargo.toml .

RUN cargo build
RUN rm src/*.rs

COPY . .

RUN cargo install --path .

ENV port=8080
EXPOSE 8080

CMD [ "bup-rust" ]