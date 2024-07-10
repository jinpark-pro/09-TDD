//
//  MenuSection.swift
//  Albertos
//
//  Created by Jungjin Park on 2024-07-10.
//

import Foundation

struct MenuSection: Identifiable {
    let category: String
    let items: [MenuItem]
    
    var id: String { category }
}
