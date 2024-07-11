//
//  MenuRowViewModelTests.swift
//  AlbertosTests
//
//  Created by Jungjin Park on 2024-07-11.
//

import XCTest
@testable import Albertos

final class MenuRowViewModelTests: XCTestCase {
    func testWhenItemIsNotSpicyTextIsItemNameOnly() {
        let item = MenuItem.fixture(name: "name", spicy: false)
        let viewModel = MenuRow.ViewModel(item: item)
        XCTAssertEqual(viewModel.text, "name")
    }
    
    func testWhenItemIsSpicyTextIsItemNameWithChiliEmoji() {
        
    }
}
