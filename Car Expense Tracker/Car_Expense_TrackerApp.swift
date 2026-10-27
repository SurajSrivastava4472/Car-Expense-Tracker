//
//  Car_Expense_TrackerApp.swift
//  Car Expense Tracker
//
//  Created by Suraj Srivastava on 10/27/26.
//

import SwiftUI
import CoreData

@main
struct Car_Expense_TrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
