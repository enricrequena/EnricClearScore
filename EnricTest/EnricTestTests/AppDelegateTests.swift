//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest
import XCTest

class AppDelegateTests: XCTestCase {

    var appDelegate: AppDelegate!
    var mockAppConfiguration: MockAppConfiguration!

    override func setUp() {

        super.setUp()

        mockAppConfiguration = MockAppConfiguration()
        appDelegate = AppDelegate()
        appDelegate.appConfiguration = mockAppConfiguration
    }

    override func tearDown() {

        appDelegate = nil
        mockAppConfiguration = nil

        super.tearDown()
    }

    func testApplicationDidFinishLaunchingWithOptions() {

        guard let mockDashboardFactory = ServiceDirectory.Dashboard.factory as? MockDashboardWireframeFactory else {

            XCTFail("MockImageListWireframeFactory not configured")
            return
        }

        let application = UIApplication.shared
        let options: [UIApplicationLaunchOptionsKey: Any]? = nil

        let result = appDelegate.application(application, didFinishLaunchingWithOptions: options)
        XCTAssertTrue(result)
        XCTAssertEqual(mockAppConfiguration.recordedInvocations.configure, 1)

        guard let navigationViewController = appDelegate.window?.rootViewController as? UINavigationController,
              navigationViewController.viewControllers.count == 1,
              let dashboardViewController = navigationViewController.topViewController as? DashboardViewController else {

            XCTFail("DashboardViewController not found")
            return
        }

        XCTAssertEqual(mockDashboardFactory.recordedInvocations.makeWireframe.count, 1)
        XCTAssert(mockDashboardFactory.recordedInvocations.makeWireframe.first! === dashboardViewController)
        XCTAssertEqual(mockDashboardFactory.returnValues.dashboardWireframe.recordedInvocations.present, 1)
        XCTAssertEqual(mockAppConfiguration.recordedInvocations.configure, 1)
    }
}
