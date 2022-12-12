//===----------------------------------------------------------------------===//
//
// This contains the Toy Op definitions.
//
//===----------------------------------------------------------------------===//

#ifndef TOYOPS_TD
#define TOYOPS_TD

include "Toy/ToyDialect/ToyDialect.td"
include "mlir/IR/OpBase.td"

// Base class for toy dialect operations. This operation inherits from the base
// `Op` class in OpBase.td, and provides:
//   * The parent dialect of the operation.
//   * The mnemonic for the operation, or the name without the dialect prefix.
//   * A list of traits for the operation.
class Toy_Op<string mnemonic, list<Trait> traits = []> :
    Op<Toy_Dialect, mnemonic, traits>;

//===----------------------------------------------------------------------===//
// ConstantOp
//===----------------------------------------------------------------------===//

def ConstantOp : Toy_Op<"constant"> {
}

#endif // TOYOPS_TD
