# mlir-hacking

## Setup

Instructions from the
[MLIR Getting Started docs](https://mlir.llvm.org/getting_started/).

```shell
git clone --recursive git@github.com:llvm/llvm-project.git
cd llvm-project

mkdir build && cd build
# MacOS: BUILD_TARGET=AArch64
# X86: BUILD_TARGET=X86
# NVIDIA GPU: BUILD_TARGET="X86;NVPTX"
# AMD GPU: BUILD_TARGET="X86;AMDGPU"
cmake -G Ninja ../llvm \
   -DLLVM_ENABLE_PROJECTS=mlir \
   -DLLVM_BUILD_EXAMPLES=ON \
   -DLLVM_TARGETS_TO_BUILD=$BUILD_TARGET \
   -DCMAKE_BUILD_TYPE=Release \
   -DLLVM_ENABLE_ASSERTIONS=ON \
   -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++  \
   -DLLVM_CCACHE_BUILD=ON
cmake --build . --target check-mlir

export MLIR_BIN=$PWD/bin
```


## Run the CSE Example

```shell
$MLIR_BIN/mlir-opt ./src/constant-cse.mlir -cse
$MLIR_BIN/mlir-opt ./src/constant-cse.mlir -cse | $MLIR_BIN/FileCheck ./src/constant-cse.mlir
```


## TableGen'erate Toy Dialect

```shell
$MLIR_BIN/mlir-tblgen -gen-dialect-decls ./src/Toy/include/Toy/ToyDialect/ToyDialect.td -I $MLIR_SRC/include
```


## TableGen'erate Toy Op Definitions

```shell
$MLIR_BIN/mlir-tblgen -gen-op-defs ./src/Toy/include/Toy/ToyDialect/ToyOps.td -I $MLIR_SRC/include -I ./src/Toy/include
```
