//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

class TestAppConfiguration: DefaultAppConfiguration {

    override func configureClearScoreService() {

        ServiceDirectory.Common.clearScoreService = MockClearScoreService()
    }

    override func configureDashboard() {

        ServiceDirectory.Dashboard.factory = MockDashboardWireframeFactory()
    }
}
