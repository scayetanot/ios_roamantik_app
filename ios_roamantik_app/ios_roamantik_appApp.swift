//
//  ios_roamantik_appApp.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

@main
struct ios_roamantik_appApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
