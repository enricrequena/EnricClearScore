//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import XCTest
@testable import EnricTest

class DefaultDashboardWireframeTests: XCTestCase {

    var wireframe: DefaultDashboardWireframe!
    var dashboardViewController: DashboardViewController!
    var mockClearScoreService: MockClearScoreService!

    override func setUp() {

        super.setUp()

        dashboardViewController = DashboardViewController()
        mockClearScoreService = MockClearScoreService()
        wireframe = DefaultDashboardWireframe(
            viewController: dashboardViewController,
            clearScoreService: mockClearScoreService
        )
    }

    override func tearDown() {

        wireframe = nil
        dashboardViewController = nil
        mockClearScoreService = nil
        super.tearDown()
    }

    // MARK: - present

    func testPresent() {

        wireframe.present()

        guard let presenter = dashboardViewController.presenter as? DefaultDashboardPresenter else {

            XCTFail("DefaultDashboardPresenter not found")
            return
        }
        XCTAssert(presenter.view === dashboardViewController)
        XCTAssert(presenter.clearScoreService === mockClearScoreService)
        XCTAssertTrue(presenter.adapter is DefaultReportInfoModelToDashboardViewModelAdapter)
    }
}
