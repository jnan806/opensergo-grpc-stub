#!/bin/sh
##!/usr/bin/env bash
# ======================================================================
# Linux/OSX startup script
# ======================================================================


function usage() {
  echo "Usage:  gen.sh [-Operator] [Language]"
  echo ""
  echo "Available Operators:"
  echo "  -g, -gen, -generate: generate stub code"
  echo "  -c, -clean         : clean stub code"
  echo ""
  echo "Available Lanuages:"
  echo "  all  : generate stub code of all supported language"
  echo "  go   : generate stub code of go"
  echo "  java : generate stub code of java"
}


operator="$1"
targetLanguage="$2"


cd $(dirname $0)
DIR_HOME="${PWD}"


export PATH=$DIR_HOME/protoc-gen/lib/exec:$PATH
export PATH=$DIR_HOME/protoc-gen/lib/buf/bin:$PATH
export PATH=$DIR_HOME/protoc-gen/lib/protoc/bin:$PATH


OPENSERGO_WITH_VERSION=buf.build/opensergo/opensergoapis:v0.0.11


# clean go
function clean_go() {
  rm -rf $DIR_HOME/stub-go/opensergo-protocol-grpc-go
}

# generate go
function gen_go() {
  clean_go
  cd $DIR_HOME/stub-go
  buf generate $OPENSERGO_WITH_VERSION
  cp $DIR_HOME/stub-go/go.mod $DIR_HOME/stub-go/opensergo-protocol-grpc-go/go.mod
  cp $DIR_HOME/stub-go/.gitignore $DIR_HOME/stub-go/opensergo-protocol-grpc-go/.gitignore
  cd $DIR_HOME
}

# clean java
function clean_java() {
  rm -rf $DIR_HOME/stub-java/opensergo-protocol-grpc-java
}

# generate java
function gen_java() {
  clean_java
  cd $DIR_HOME/stub-java
  buf generate $OPENSERGO_WITH_VERSION
  cp $DIR_HOME/stub-java/pom.xml $DIR_HOME/stub-java/opensergo-protocol-grpc-java/pom.xml
  cd $DIR_HOME
}

# do_gen
function do_gen() {
  case $targetLanguage in
    "go")
      gen_go
      ;;
    "java")
      gen_java
      ;;
    "all")
      gen_go
      gen_java
      ;;
    *)
      echo "error! unsupport Language..."
      echo ""
      usage
      ;;
  esac
}

# do_clean
function do_clean() {
  case $targetLanguage in
    "all")
      clean_go
      clean_java
      ;;
    "go")
      clean_go
      ;;
    "java")
      clean_java
      ;;
    *)
      echo "error! unsupported Language..."
      echo ""
      usage
      ;;
  esac
}

# main
case $operator in
  "-g" | "-gen" | "generate")
    do_gen
    ;;
  "-c" | "-clean")
    do_clean
    ;;
  *)
    echo "error! unsupported operator..."
    echo ""
    usage
    ;;
esac