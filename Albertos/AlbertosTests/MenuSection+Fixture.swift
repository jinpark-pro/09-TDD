//
//  MenuSection+Fixture.swift
//  AlbertosTests
//
//  Created by Jungjin Park on 2024-07-11.
//

@testable import Albertos

extension MenuSection {
    static func fixture(
        category: String = "a category",
        items: [MenuItem] = [.fixture()]
    ) -> MenuSection {
        return MenuSection(category: category, items: items)
    }
}
