//
//  Car_Expense_TrackerApp.swift
//  Car Expense Tracker
//
//  Created by Suraj Srivastava on 10/27/26.
//

import SwiftUI
import CoreData
import SwiftData

@main
struct Car_Expense_TrackerApp: App {
  

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [CarItem.self, ExpenseCreatorClass.self])
              
        }
    }
}
