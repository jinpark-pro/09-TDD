//
//  AlbertosTests.swift
//  AlbertosTests
//
//  Created by Jungjin Park on 2024-07-10.
//

import XCTest
@testable import Albertos

final class MenuGroupingTests: XCTestCase {
    func testMenuWithManyCategoriesReturnsOneSectionPerCategoryInReverseAlphabeticalOrder() {
        let menu: [MenuItem] = [
            .fixture(category: "pastas", name: "a pasta"),
            .fixture(category: "drinks", name: "coke"),
            .fixture(category: "pastas", name: "another pasta"),
            .fixture(category: "desserts", name: "a dessert"),
        ]
        let sections = groupMenuByCategory(menu)
        XCTAssertEqual(sections.count, 3)
        XCTAssertEqual(sections[safe: 0]?.category, "pastas")
        XCTAssertEqual(sections[safe: 1]?.category, "drinks")
        XCTAssertEqual(sections[safe: 2]?.category, "desserts")
        
    }
    func testMenuWithOneCategoryReturnOneSection() throws {
        let menu: [MenuItem] = [
            .fixture(category: "pastas", name: "name"),
            .fixture(category: "pastas", name: "other name"),
        ]
        let sections = groupMenuByCategory(menu)
        
        XCTAssertEqual(sections.count, 1)
        
        let section = try XCTUnwrap(sections.first)
        XCTAssertEqual(section.items.count, 2)
        XCTAssertEqual(section.items.first?.name, "name")
        XCTAssertEqual(section.items.last?.name, "other name")
    }
    func testEmptyMenuReturnsEmptySections() {
        let menu = [MenuItem]()
        let sections = groupMenuByCategory(menu)
        XCTAssertTrue(sections.isEmpty)
    }
}
