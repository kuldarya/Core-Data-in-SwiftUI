//
//  ContentView.swift
//  CoreDataAndSwiftUI
//

import SwiftUI

struct ContentView: View {

    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }

            Button("Add") {
                let firstNames = ["Ann", "George", "Piter", "Emmy", "Ola"]
                let lastNames = ["Lovie", "Hudson", "Brick", "Granger"]

                let chosenFirstName = firstNames.randomElement()!
                let choseLastName = lastNames.randomElement()!

                let student = Student(context: moc)

                student.id = UUID()
                student.name = "\(chosenFirstName) \(choseLastName)"

                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
