//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import XCTest
@testable import EnricTest

class DashboardViewModelTests: XCTestCase {

    // MARK: - Equatability

    func testEquatability() {

        let a = DashboardViewModel.Builder().build()
        let b = DashboardViewModel.Builder().build()
        XCTAssertEqual(a, b)
    }

    func testEquatability_Different_Line1() {

        let a = DashboardViewModel.Builder().withLine1("a").build()
        let b = DashboardViewModel.Builder().withLine1("b").build()
        XCTAssertNotEqual(a, b)
    }

    func testEquatability_Different_ScoreValue() {

        let a = DashboardViewModel.Builder().withScoreValue("a").build()
        let b = DashboardViewModel.Builder().withScoreValue("b").build()
        XCTAssertNotEqual(a, b)
    }

    func testEquatability_Different_Line2() {

        let a = DashboardViewModel.Builder().withLine2("a").build()
        let b = DashboardViewModel.Builder().withLine2("b").build()
        XCTAssertNotEqual(a, b)
    }

    func testEquatability_Different_Percentage() {

        let a = DashboardViewModel.Builder().withPercentage(1.0).build()
        let b = DashboardViewModel.Builder().withPercentage(2.0).build()
        XCTAssertNotEqual(a, b)
    }
}
