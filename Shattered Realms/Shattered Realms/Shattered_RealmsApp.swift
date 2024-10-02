//
//  Shattered_RealmsApp.swift
//  Shattered Realms
//
//  Created by Orkhan Gojayev on 10/2/24.
//

import SwiftUI
import SwiftData

@main
struct Shattered_RealmsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
        .modelContainer(sharedModelContainer)
    }
}
