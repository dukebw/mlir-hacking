// RUN: mlir-opt -allow-unregistered-dialect %s
func.func @toy_func(%tensor: tensor<2x3xf64>) -> tensor<3x2xf64> {
  %t_tensor = "toy.transpose"(%tensor) { inplace = true } : (tensor<2x3xf64>) -> tensor<3x2xf64>
  return %t_tensor : tensor<3x2xf64>
}

func.func @main() {
  %0 = "toy.print"() : () -> tensor<2x3xf64>
}
