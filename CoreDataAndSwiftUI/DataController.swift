//
//  DataController.swift
//  CoreDataAndSwiftUI
//

import CoreData
import Foundation

/// Class should conform to `ObservableObject` so that we can use @State object with it.
/// We want it to be created when the app launches and stay alive for as long as the app runs.
class DataController: ObservableObject {

    /// Core data type responsible for loading a Data Model and giving us the access to the actual data inside.
    /// The data is not loaded at this point, but it's prepared to be loaded.
    /// Data Models don't contain the actual data, they just contain the data models (properties and attributes).
    let persistentContainer = NSPersistentContainer(name: "Bookworm")

    init() {
        /// Load data: read data from disk
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
