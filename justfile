#!/usr/bin/env just --justfile

build_package:
    @echo "Building WASM..."
    cargo build --target wasm32-unknown-unknown --release
    cp target/wasm32-unknown-unknown/release/cyclet.wasm typst-package/src/cyclet.wasm

[working-directory: 'typst-package']
test: build_package
    @echo "Running typship dev"
    typship dev
    echo "Running tinymist test..."
    tinymist test examples/test.typ
    rm -rf target

lint:
    cargo clippy