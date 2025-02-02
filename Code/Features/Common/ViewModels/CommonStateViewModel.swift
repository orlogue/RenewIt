import Foundation
import Observation

@Observable final class CommonStateViewModel {
    var activeTab: Tab = .subs
    var allTabs: [AnimatableTab] = Tab.allCases.compactMap { tab in AnimatableTab(tab: tab)
    }
}
