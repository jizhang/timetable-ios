//
//  TimetableApp.swift
//  Timetable
//
//  Created by Ji ZHANG on 2020/10/1.
//

import SwiftUI

@main
struct TimetableApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
