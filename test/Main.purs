module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Exception (throwException, error)

import Unsafe.Reference (unsafeRefEq, reallyUnsafeRefEq, UnsafeRefEq(..), UnsafeRefEqFallback(..))

data Foo = Foo String
data Bar = Bar String

newtype Foo' = Foo' String
newtype Bar' = Bar' String

assert :: Boolean -> String -> Effect Unit
assert true _ = pure unit
assert _ desc = throwException (error desc)

data X = Y Unit | Z

derive instance eqX :: Eq X

main :: Effect Unit
main = do
  let
    foo1 = Foo "foo"
    foo2 = Foo "foo"
    foo3 = Foo' "foo"
    foo4 = Foo' "foo"
    bar1 = Bar "foo"
    bar2 = Bar' "foo"

  assert (unsafeRefEq foo1 foo1) "unsafeRefEq data"
  assert (not unsafeRefEq foo1 foo2) "not unsafeRefEq data"
  assert (unsafeRefEq foo3 foo4) "unsafeRefEq newtype"
  assert (reallyUnsafeRefEq foo3 bar2) "reallyUnsafeRefEq newtype"
  assert (not reallyUnsafeRefEq foo1 bar1) "not reqallyUnsafeRefEq data"
  assert (UnsafeRefEq 0 == UnsafeRefEq 0) "UnsafeRefEq eq with identical values"
  assert (UnsafeRefEq (Y unit) /= UnsafeRefEq (Y unit)) "UnsafeRefEq not eq with non-identical values"
  assert (UnsafeRefEqFallback (Y unit) == UnsafeRefEqFallback (Y unit)) "UnsafeRefEqFallback eq with non-identical but equal values"
  assert (UnsafeRefEqFallback (Y unit) /= UnsafeRefEqFallback Z) "UnsafeRefEqFallback not eq with non equal values"
