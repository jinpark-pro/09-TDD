//
//  MenuListViewModelTests.swift
//  AlbertosTests
//
//  Created by Jungjin Park on 2024-07-11.
//

import XCTest
import Combine
@testable import Albertos

final class MenuListViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    func testCallsGivenGroupingFunction() throws {
        try XCTSkipIf(true, "skipping this for now, keeping it to resue part of the code later on")
        
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
    
    func testWhenFetchingSuccceedsPublishesSectionsBuiltFromReceivedMenuAndGivenGroupingCategoryClosure() {
        var receivedMenu: [MenuItem]?
        let expectedSections: [MenuSection] = [.fixture()]
        
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            receivedMenu = items
            return expectedSections
        }
        
        let viewModel = MenuList.ViewModel(
            menuFetching: MenuFetchingSample(),
            menuGrouping: spyClosure
            )
        
        let expectation = XCTestExpectation(description: "받은 메뉴와 주어진 그룹화 클로저를 사용하여 생성된 섹션들을 발행함")
        
        viewModel.$sections
            .dropFirst()
            .sink { value in
                XCTAssertEqual(receivedMenu, menu)
                XCTAssertEqual(value, expectedSections)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
    }
}
