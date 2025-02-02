import Foundation

enum Periodicity: Int16, CaseIterable, Identifiable {
    case monthly = 1
    case quarterly = 3
    case semiAnnualy = 6
    case annually = 12
    
    var id: Int16 { rawValue }
    
    var description: String {
        switch self {
        case .monthly: return "Every month"
        case .quarterly: return "Every 3 months"
        case .semiAnnualy: return "Every 6 months"
        case .annually: return "Every year"
        }
    }
}
