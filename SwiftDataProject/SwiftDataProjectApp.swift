//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Brian Vo on 5/13/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
