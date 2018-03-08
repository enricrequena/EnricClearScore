//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import XCTest
@testable import EnricTest

class DefaultAppConfigurationTests: XCTestCase {

    var configuration: DefaultAppConfiguration!

    override func setUp() {

        super.setUp()
        configuration = DefaultAppConfiguration()
    }

    override func tearDown() {

        configuration = nil
        super.tearDown()
    }

    // MARK: - configureClearScoreService

    func testConfigureClearScoreService() {

		configuration.configureClearScoreService()

        XCTAssertTrue(ServiceDirectory.Common.clearScoreService is DefaultClearScoreService)
    }

    // MARK: - configureDashboard

    func testConfigureDashboard() {

		configuration.configureDashboard()

        XCTAssertTrue(ServiceDirectory.Dashboard.factory is DefaultDashboardWireframeFactory)
    }
}
