import SwiftUI

struct TabBarView: View {
    @Environment(CommonStateViewModel.self) var viewModel
    
    var body: some View {
        @Bindable var vw = viewModel
        
        HStack(spacing: 0) {
            ForEach($vw.allTabs) { $animatableTab in
                let tab = animatableTab.tab

                Button(action: {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete) {
                        vw.activeTab = tab
                        animatableTab.isAnimating = true
                    } completion: {
                        var transation = Transaction()
                        transation.disablesAnimations = true
                        withTransaction(transation) {
                            animatableTab.isAnimating = nil
                        }
                    }
                }) {
                    TabBarItemView(animatableTab: animatableTab)
                        .foregroundStyle(vw.activeTab == tab ? .blue : .gray)
                }
            }
        }
        .background(.ultraThickMaterial)
    }
}

#Preview {
    TabBarView().environment(CommonStateViewModel())
}
