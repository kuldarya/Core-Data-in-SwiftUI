//
//  CoreDataAndSwiftUIApp.swift
//  CoreDataAndSwiftUI
//

import SwiftUI

@main
struct CoreDataAndSwiftUIApp: App {
    /// Make an instance of `DataController` and inject it to SwiftUI's environment.
    /// Rather than every view try and make their own store to write and read data independently,
    /// we'll make it once when the app launches and then store it in SwiftUI environment.
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
            /// `managedObjectContext` is the life version of the data
                .environment(\.managedObjectContext, dataController.persistentContainer.viewContext)
        }
    }
}
