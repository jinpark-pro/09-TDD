//
//  AlbertosTests.swift
//  AlbertosTests
//
//  Created by Jungjin Park on 2024-07-10.
//

import XCTest
@testable import Albertos

extension Array {
    subscript(safe index: Index) -> Element? {
        0 <= index && index < count ? self[index] : nil
    }
}

final class MenuGroupingTests: XCTestCase {
    func testMenuWithManyCategoriesReturnsOneSectionPerCategory() {
        
    }
    func testMenuWithOneCategoryReturnOneSection() {
        let menu = [
            MenuItem(category: "pastas", name: "a pasta"),
            MenuItem(category: "drinks", name: "coke"),
            MenuItem(category: "pastas", name: "another pasta"),
//            MenuItem(category: "desserts", name: "a dessert"),
        ]
        let sections = groupMenuByCategory(menu)
        XCTAssertEqual(sections.count, 3)
        XCTAssertEqual(sections[safe: 0]?.category, "pastas")
        XCTAssertEqual(sections[safe: 1]?.category, "drinks")
        XCTAssertEqual(sections[safe: 2]?.category, "desserts")
    }
    func testEmptyMenuReturnsEmptySections() {
        let menu = [MenuItem]()
        let sections = groupMenuByCategory(menu)
        XCTAssertTrue(sections.isEmpty)
    }
}
