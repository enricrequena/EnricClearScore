//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import XCTest
@testable import EnricTest

class DefaultDashboardWireframeFactoryTests: XCTestCase {

    var factory: DefaultDashboardWireframeFactory!

    override func setUp() {

        super.setUp()
        factory = DefaultDashboardWireframeFactory()
    }

    override func tearDown() {

        factory = nil
        super.tearDown()
    }

    // MARK: - makeWireframe

    func testMakeWireframe() {

        let dashboardViewController = DashboardViewController()

        let wireframe = factory.makeWireframe(with: dashboardViewController)

        guard let defaultWireframe = wireframe as? DefaultDashboardWireframe else {

            XCTFail("DefaultDashboardWireframe not found")
            return
        }

        XCTAssert(defaultWireframe.viewController === dashboardViewController)
        XCTAssert(defaultWireframe.clearScoreService === ServiceDirectory.Common.clearScoreService)
    }
}
