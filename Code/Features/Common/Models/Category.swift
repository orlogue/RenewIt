import Foundation

enum Category: String, CaseIterable, Identifiable {
    case entertainment = "Entertainment"
    case productivity = "Productivity"
    case health = "Health"
    case shopping = "Shopping"
    case learning = "Learning"
    case business = "Business"
    case travel = "Travel"
    case social = "Social"
    case other = "Other"
    
    var id: String { rawValue }
    
    var systemImageName: String {
        switch self {
        case .entertainment: return "play.tv.fill"
        case .productivity: return "gearshape"
        case .health: return "heart.fill"
        case .shopping: return "cart.fill"
        case .learning: return "book.fill"
        case .business: return "briefcase.fill"
        case .travel: return "airplane"
        case .social: return "bubble.left.and.bubble.right.fill"
        case .other: return "ellipsis"
        }
    }
}

