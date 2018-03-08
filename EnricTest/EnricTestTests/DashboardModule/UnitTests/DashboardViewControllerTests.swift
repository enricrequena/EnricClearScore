//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import XCTest
@testable import EnricTest

class DashboardViewControllerTests: XCTestCase {

    var viewController: DashboardViewController!
    var mockPresenter: MockDashboardPresenter!

    override func setUp() {

        super.setUp()

        mockPresenter = MockDashboardPresenter()
        viewController = loadDashboardViewController()
        viewController.presenter = mockPresenter

        viewController.loadViewIfNeeded()
    }

    override func tearDown() {

        viewController = nil
        mockPresenter = nil
        super.tearDown()
    }

    // MARK: - Storyboard
    
    func testStoryboard() {

        XCTAssertNotNil(viewController.clearScoreView)
    }

    // MARK: - viewDidLoad

    func testViewDidLoad() {

        XCTAssertEqual(mockPresenter.recordedInvocations.viewDidLoad, 1)
    }

    // MARK: - DashboardView

    func testShowLoading() {

        viewController.showLoading()

        XCTAssertEqual(viewController.loadingView.isHidden, false)
        XCTAssertEqual(viewController.clearScoreView.isHidden, true)
    }

    func testUpdateWithViewModel() {

        let mockClearScoreView = MockClearScoreView()
        viewController.clearScoreView = mockClearScoreView

        let viewModel = DashboardViewModel.Builder().withLine1("o378124").build()
        viewController.update(with: viewModel)

        XCTAssertEqual(mockClearScoreView.recordedInvocations.update, [viewModel])
        XCTAssertEqual(viewController.loadingView.isHidden, true)
        XCTAssertEqual(viewController.clearScoreView.isHidden, false)
    }

    func testUpdateWithError() {

        viewController.update(withError: "error", and: .red)

        // TODO: Here I decided to use a Toast Cocoa Pod library to demonstrate a CocoaPod instegration but
        // is not straight forward to test. We could test is but is out of scope for this test app.

        XCTAssertEqual(viewController.loadingView.isHidden, true)
        XCTAssertEqual(viewController.clearScoreView.isHidden, true)
    }
}

extension DashboardViewControllerTests {

    private func loadDashboardViewController() -> DashboardViewController {

        let navigationController = UIStoryboard(
            name: "Main",
            bundle: .main
        ).instantiateInitialViewController() as! UINavigationController

        return navigationController.topViewController as! DashboardViewController
    }
}
