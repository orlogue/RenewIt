import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home")
            }
            .navigationTitle("Dashboard")
        }
    }
}

#Preview {
    HomeScreen()
}
