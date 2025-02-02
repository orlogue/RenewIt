import SwiftUI
import CoreData

struct RootView: View {
    @Environment(CommonStateViewModel.self) var commonStateViewModel
    
    var body: some View {
        @Bindable var vm = commonStateViewModel
        
        ZStack(alignment: .bottom) {
            GeometryReader { geometry in
                TabView(selection: $vm.activeTab) {
                    HomeScreen()
                        .setUpTab(.home)
                    
                    SubscriptionsScreen(with: geometry)
                        .setUpTab(.subs)
                    
                    SettingsScreen()
                        .setUpTab(.settings)
                }
            }
            
            TabBarView()
        }
    }
}

#Preview {
    RootView()
        .environment(CommonStateViewModel())
}
