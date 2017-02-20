module Unsafe.Reference
  ( unsafeRefEq
  , reallyUnsafeRefEq
  ) where

-- | Compares two values of the same type using strict (`===`) equality.
unsafeRefEq :: forall a. a -> a -> Boolean
unsafeRefEq = reallyUnsafeRefEq

-- | Compares two values of different types using strict (`===`) equality.
foreign import reallyUnsafeRefEq :: forall a b. a -> b -> Boolean
