module Unsafe.Reference
  ( unsafeRefEq
  , reallyUnsafeRefEq
  ) where

-- | Compares two values of the same type using strict (`===`) equality.
-- |
-- | It should not be used to define `Eq` instances, as it breaks the
-- | transitivity law for expressions (it is only transitive on values).
unsafeRefEq :: forall a. a -> a -> Boolean
unsafeRefEq = reallyUnsafeRefEq

-- | Compares two values of different types using strict (`===`) equality.
foreign import reallyUnsafeRefEq :: forall a b. a -> b -> Boolean
