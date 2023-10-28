import Foundation

public typealias Action<Value> = (Value) -> Void

@propertyWrapper
public final class Bindable<Value: Equatable> {
    
    public var wrappedValue: Value {
        didSet {
            main.async { [weak self] in
                guard let self, (oldValue != wrappedValue || Value.self == Void.self) else { return }
                self.onChange?(self.wrappedValue)
            }
        }
    }
    public var projectedValue: Bindable<Value> { self }
    
    private var onChange: Action<Value>?
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    internal func bind(_ action: @escaping Action<Value>) {
        onChange = action
    }
}
