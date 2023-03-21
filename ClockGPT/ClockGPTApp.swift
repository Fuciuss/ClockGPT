//
//  ClockGPTApp.swift
//  ClockGPT
//
//  Created by Rees Pawson on 21/3/2023.
//

import SwiftUI

@main
struct ClockGPTApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
