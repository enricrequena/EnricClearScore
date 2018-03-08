//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

class DefaultAppConfiguration: AppConfiguration {

    func configureClearScoreService() {

        ServiceDirectory.Common.clearScoreService = DefaultClearScoreService()
    }

    func configureDashboard() {

        ServiceDirectory.Dashboard.factory = DefaultDashboardWireframeFactory()
    }
}