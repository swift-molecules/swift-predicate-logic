public import Logic
public import Predicate

extension Predicate {

    @inlinable
    public static func callAsFunction<L: Logic.Ternary.`Protocol`>(
        _ predicate: Predicate,
        _ value: T?
    ) -> L {
        guard let value else { return .unknown }
        return predicate.evaluate(value) ? .true : .false
    }

    @inlinable
    public func callAsFunction<L: Logic.Ternary.`Protocol`>(_ value: T?) -> L {
        Self.callAsFunction(self, value)
    }
}
