# Predicate Logic

`Predicate Logic` is the narrow integration seam between the
[`Predicate`](https://github.com/swift-atoms/swift-predicate) and
[`Logic`](https://github.com/swift-atoms/swift-logic) domains.

It lifts a `Predicate<T>` over an optional input into a value conforming to
`Logic.Ternary.Protocol`: a present value evaluates to `.true` or `.false`,
while a missing value evaluates to `.unknown`.

```swift
import Predicate_Logic

let isEven = Predicate<Int> { $0.isMultiple(of: 2) }

let present: Bool? = isEven(4 as Int?) // true
let absent: Bool? = isEven(nil)         // unknown (nil)
```

Predicate composition remains owned by `swift-predicate`, and ternary
operators and truth values remain owned by `swift-logic`.
