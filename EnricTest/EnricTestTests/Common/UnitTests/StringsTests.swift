//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import XCTest
@testable import EnricTest

class StringsTests: XCTestCase {

    // MARK: - DashboardView

    func testDashboardView() {

        XCTAssertEqual(Strings.DashboardView.firstLineCopy, "Your credit score is")
        XCTAssertEqual(Strings.DashboardView.makeSecondLineCopy(with: 60), "out of 60")
        XCTAssertEqual(Strings.DashboardView.makeSecondLineCopy(with: 900), "out of 900")
    }
}
