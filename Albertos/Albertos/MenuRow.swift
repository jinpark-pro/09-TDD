//
//  MenuRow.swift
//  Albertos
//
//  Created by Jungjin Park on 2024-07-11.
//

import SwiftUI

struct MenuRow: View {
    let viewModel: ViewModel

    var body: some View {
        Text(viewModel.text)
    }
}

#Preview {
    MenuRow(viewModel: .init(item: menu[0]))
}
