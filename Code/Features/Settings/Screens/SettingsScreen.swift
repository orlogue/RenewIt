import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Settings")
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsScreen()
}
