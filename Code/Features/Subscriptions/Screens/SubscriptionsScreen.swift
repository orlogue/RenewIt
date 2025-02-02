import SwiftUI

struct SubscriptionsScreen: View {
    @State private var viewModel = SubscriptionsViewModel()
    var geometry: GeometryProxy
    
    init(with geometry: GeometryProxy) {
        self.geometry = geometry
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.subscriptions) { subscription in
                    HStack {
                        Text(subscription.name ?? "")
                        Spacer()
                        Text(String(subscription.price) + "₽")
                    }
                }
                .onDelete(perform: viewModel.deleteSubscription)
            }
            .scrollIndicators(.hidden)
            .safeAreaPadding(.bottom, geometry.safeAreaInsets.bottom)
            .navigationTitle("Subscriptions")
            .toolbarBackground(.ultraThickMaterial, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.isAddingSubscriptionSheetOpen.toggle()
                    } label: {
                        Label("Add subscription", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isAddingSubscriptionSheetOpen) {
            SubscriptionFormView(viewModel: viewModel)
        }
    }
}
