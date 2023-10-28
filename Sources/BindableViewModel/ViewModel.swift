import UIKit

public protocol ViewModel {}

internal let main = DispatchQueue.main

extension ViewModel {
    
    public func bind<Value>(
        _ keyPath: KeyPath<ViewModel, Bindable<Value>>,
        _ action: @escaping Action<Value>
    ) {
        let bindable = self[keyPath: keyPath]
        bindable.bind(action)
    }
    
    public func bind(
        _ keyPath: KeyPath<ViewModel, Bindable<String>>,
        to label: UILabel
    ) {
        let bindable = self[keyPath: keyPath]
        bindable.bind { [weak label] value in
            label?.text = value
        }
    }
    
    public func bind(
        _ keyPath: KeyPath<ViewModel, Bindable<String>>,
        to button: UIButton
    ) {
        let bindable = self[keyPath: keyPath]
        bindable.bind { [weak button] value in
            button?.setTitle(value, for: .normal)
        }
    }
    
    public func bind(
        _ keyPath: KeyPath<ViewModel, Bindable<Bool>>,
        to button: UIButton
    ) {
        let bindable = self[keyPath: keyPath]
        bindable.bind { [weak button] value in
            button?.isEnabled = value
        }
    }
    
    public func bind(
        _ keyPath: KeyPath<ViewModel, Bindable<Bool>>,
        to _switch: UISwitch
    ) {
        let bindable = self[keyPath: keyPath]
        bindable.bind { [weak _switch] value in
            _switch?.isOn = value
        }
    }
}
