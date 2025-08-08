//
//  SwiftDataTutorialApp.swift
//  SwiftDataTutorial
//
//  Created by João Vitor Rocha Miranda on 07/08/25.
//

import SwiftUI

@main
struct SwiftDataTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
    }
}
