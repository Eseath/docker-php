#!/usr/bin/env bash

versions=("7.4" "8.0" "8.1")
variants=("cli" "fpm")

function build {
    for v in ${!versions[@]}; do
        for i in ${!variants[@]}; do
            docker build \
                --build-arg PHP_VERSION=${versions[$v]} \
                --build-arg PHP_VARIANT=${variants[$i]} \
                -t eseath/php:${versions[$v]}-${variants[$i]}-alpine .
        done
    done
}

function push {
    for v in ${!versions[@]}; do
        for i in ${!variants[@]}; do
            docker push eseath/php:${versions[$v]}-${variants[$i]}-alpine
        done
    done
}

case $1 in
    build)
        build
        ;;
    push)
        push
        ;;
    *)
        echo "Use './run.sh build' or './run.sh push'"
        ;;
esac
