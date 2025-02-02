import SwiftUI

struct TabBarItemView: View {
    var animatableTab: AnimatableTab
    
    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: animatableTab.tab.systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 23, height: 23)
                .symbolEffect(.bounce, value: animatableTab.isAnimating)
            
            Text(animatableTab.tab.rawValue)
                .font(.caption)
                .textScale(.secondary)
        }
        .padding(.top, 6)
        .padding(.bottom, 2)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TabBarItemView(animatableTab: AnimatableTab(tab: .home))
}
