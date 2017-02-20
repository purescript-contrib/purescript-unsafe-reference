module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION, throwException, error)

import Unsafe.Reference (unsafeRefEq, reallyUnsafeRefEq)

data Foo = Foo String
data Bar = Bar String

newtype Foo' = Foo' String
newtype Bar' = Bar' String

assert :: forall eff. Boolean -> String -> Eff (err :: EXCEPTION | eff) Unit
assert true _ = pure unit
assert _ desc = throwException (error desc)

main :: Eff (err :: EXCEPTION) Unit
main = do
  let
    foo1 = Foo  "foo"
    foo2 = Foo  "foo"
    foo3 = Foo' "foo"
    foo4 = Foo' "foo"
    bar1 = Bar  "foo"
    bar2 = Bar' "foo"

  assert (unsafeRefEq foo1 foo1) "unsafeRefEq data"
  assert (not unsafeRefEq foo1 foo2) "not unsafeRefEq data"
  assert (unsafeRefEq foo3 foo4) "unsafeRefEq newtype"
  assert (reallyUnsafeRefEq foo3 bar2) "reallyUnsafeRefEq newtype"
  assert (not reallyUnsafeRefEq foo1 bar1) "not reqallyUnsafeRefEq data"
