//
//  ManchesterAirBnBApp.swift
//  ManchesterAirBnB
//
//  Created by Alex Bîrlădeanu on 23.11.2023.
//

import SwiftUI

@main
struct ManchesterAirBnBApp: App {
    @StateObject private var exploreVM = ExploreViewModel()

    var body: some Scene {
        WindowGroup {
            ExploreView()
                .environmentObject(exploreVM)
        }
    }
}
