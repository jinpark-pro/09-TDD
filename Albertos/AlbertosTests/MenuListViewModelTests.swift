//
//  MenuListViewModelTests.swift
//  AlbertosTests
//
//  Created by Jungjin Park on 2024-07-11.
//

import XCTest
@testable import Albertos

final class MenuListViewModelTests: XCTestCase {
    func testCallsGivenGroupingFunction() {
        var called = false
        let inputSections = [MenuSection.fixture()]
        // fake function
        let probeClosure: ([MenuItem]) -> [MenuSection] = { _ in
            called = true
            return inputSections
        }
        
        let viewModel = MenuList.ViewModel(menuGrouping: probeClosure)
        let sections = viewModel.sections
        
        // Check that the given closure was called
        XCTAssertTrue(called)
        // Check that the returned value was build with the closure
        XCTAssertEqual(sections, inputSections)
    }
    
    func testWhenFetchingStartsPublishesEmptyMenu() {
        let viewModel = MenuList.ViewModel()
        XCTAssertTrue(viewModel.sections.isEmpty)
    }
}
