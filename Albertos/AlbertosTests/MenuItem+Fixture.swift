//
//  MenuItem+Fixture.swift
//  AlbertosTests
//
//  Created by Jungjin Park on 2024-07-11.
//

@testable import Albertos

extension MenuItem {
    static func fixture(
        category: String = "category",
        name: String = "name",
        spicy: Bool = false
    ) -> MenuItem {
        MenuItem(category: category, name: name, spicy: spicy)
    }
}
