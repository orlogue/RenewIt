import SwiftUI

struct SubscriptionFormView: View {
    @Bindable var viewModel: SubscriptionsViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $viewModel.formData.name)
                
                Menu {
                    Picker("Category", selection: $viewModel.formData.category) {
                        Text("None").tag(nil as Category?)
                        ForEach(Category.allCases) { category in
                            Label(category.rawValue, systemImage: category.systemImageName)
                                .tag(category as Category?)
                        }
                    }
                } label: {
                    HStack {
                        if let selectedCategory = viewModel.formData.category {
                            Label(selectedCategory.rawValue, systemImage: selectedCategory.systemImageName)
                        } else {
                            Text("Choose category")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    Text("Price")
                    Spacer()
                    TextField("Price", value: $viewModel.formData.price, formatter: NumberFormatter(), prompt: Text("199₽"))
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
                
                DatePicker("Started on", selection: $viewModel.formData.renewalDate, displayedComponents: .date)
                
                Picker("How often", selection: $viewModel.formData.periodicity) {
                    ForEach(Periodicity.allCases) { period in
                        Text(period.description)
                            .tag(period)
                    }
                }
            }
            .navigationTitle("Add subscription")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        viewModel.isAddingSubscriptionSheetOpen.toggle()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        viewModel.addSubscription()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .padding(.top, 30)
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    VStack {
    }.sheet(isPresented: .constant(true)) {
        SubscriptionFormView(viewModel: SubscriptionsViewModel())
    }
}
