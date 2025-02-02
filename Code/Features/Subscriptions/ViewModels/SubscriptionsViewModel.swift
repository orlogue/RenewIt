import Foundation
import Observation
import CoreData

@Observable final class SubscriptionsViewModel {
    @ObservationIgnored private var context = PersistenceController.shared.context
    var isAddingSubscriptionSheetOpen: Bool = false
    var formData: AddSubscriptionFormData = AddSubscriptionFormData()
    
    var subscriptions: [Subscription] = []
    
    init() {
        fetchSubscriptions()
    }
    
    func fetchSubscriptions() {
        let request: NSFetchRequest<Subscription> = Subscription.fetchRequest()
        do {
            subscriptions = try context.fetch(request)
        } catch {
            print("Failed to fetch subscriptions: \(error)")
        }
    }
    
    func addSubscription() {
        let subscription = Subscription(context: context)
        subscription.id = UUID()
        subscription.createdAt = Date()
        subscription.name = formData.name
        subscription.category = formData.category
        subscription.renewalDate = formData.renewalDate
        subscription.periodicity = formData.periodicity
        subscription.price = formData.price ?? 0
        saveChanges()
        isAddingSubscriptionSheetOpen.toggle()
        formData = AddSubscriptionFormData()
    }
    
    func deleteSubscription(at offsets: IndexSet) {
        for index in offsets {
            let sub = subscriptions[index]
            context.delete(sub)
        }
        saveChanges()
    }
    
    private func saveChanges() {
        do {
            try context.save()
            fetchSubscriptions()
        } catch {
            print("Failed to save context: \(error.localizedDescription)")
        }
    }
}
