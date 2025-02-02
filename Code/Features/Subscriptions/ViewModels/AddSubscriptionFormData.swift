import Foundation
import Observation
import CoreData

struct AddSubscriptionFormData {
    var name: String = ""
    var category: Category? = nil
    var renewalDate: Date = Date()
    var periodicity: Periodicity = .monthly
    var price: Double?
}
