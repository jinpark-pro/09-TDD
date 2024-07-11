//
//  MenuRow.ViewModel.swift
//  Albertos
//
//  Created by Jungjin Park on 2024-07-11.
//

extension MenuRow {
    struct ViewModel {
        let text: String

        init(item: MenuItem) {
            text = item.spicy ? "\(item.name) 🌶️" : item.name
        }
    }
}
