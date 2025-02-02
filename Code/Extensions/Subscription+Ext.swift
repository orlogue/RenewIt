import Foundation

extension Subscription {
    var periodicity: Periodicity {
        get {  .init(rawValue: self.periodicityRaw) ?? .monthly }
        set { periodicityRaw = newValue.rawValue }
    }
    
    var category: Category? {
        get { .init(rawValue: categoryRaw ?? "") }
        set { categoryRaw = newValue?.rawValue }
    }
}
