// RUN: mlir-opt %s -split-input-file -verify-diagnostics

func.func @bad_branch() {
  cf.br ^missing // expected-error {{reference to an undefined block}}
}

// -----

func.func @foo(%a : f32) {
  // expected-error@+1 {{invalid predicate attribute specification: "foo"}}
  %result = arith.cmpf "foo", %a, %a : f32
  return
}
