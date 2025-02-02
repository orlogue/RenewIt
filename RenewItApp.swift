import SwiftUI

@main
struct RenewItApp: App {
    let persistenceController = PersistenceController.shared
    @State private var commonState = CommonStateViewModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(commonState)
        }
    }
}
