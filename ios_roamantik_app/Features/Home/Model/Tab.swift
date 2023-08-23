//
//  Tab.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case feed = "Feed"
    case search = "Search"
    case add = "Add"
    case messages = "Messages"
    case profile = "Profile"
    
    var systemImage: String {
        switch self {
        case .feed:
            return "list.bullet.circle"
        case .search:
            return "magnifyingglass.circle"
        case .add:
            return "plus.circle"
        case .messages:
            return "message.circle"
        case .profile:
            return "person.circle"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
