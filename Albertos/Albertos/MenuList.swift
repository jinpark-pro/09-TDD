//
//  ContentView.swift
//  Albertos
//
//  Created by Jungjin Park on 2024-07-10.
//

import SwiftUI

struct MenuList: View {
    let viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.sections) { section in
                Section(header: Text(section.category)) {
                    ForEach(section.items) { item in
                        MenuRow(viewModel: .init(item: item))
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MenuList(viewModel: .init())
    }
}
