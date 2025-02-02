import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case subs = "Subscriptions"
    case settings = "Settings"
    
    var systemImageName: String {
        switch self {
        case .home: "house.fill"
        case .subs: "star.square"
        case .settings: "gear"
        }
    }
}

struct AnimatableTab: Identifiable {
    let id = UUID()
    let tab: Tab
    var isAnimating: Bool?
}
