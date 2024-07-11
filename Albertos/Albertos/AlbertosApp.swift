//
//  AlbertosApp.swift
//  Albertos
//
//  Created by Jungjin Park on 2024-07-10.
//

import SwiftUI

@main
struct AlbertosApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MenuList(viewModel: .init())
                    .navigationTitle("Alberto's restourant")
            }
        }
    }
}
