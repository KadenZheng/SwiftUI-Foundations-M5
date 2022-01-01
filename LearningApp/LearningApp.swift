//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by LaptopCartUser on 1/1/22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
