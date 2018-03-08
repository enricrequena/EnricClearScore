//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

class MockAppConfiguration {

    struct Invocations {

        var configure = 0
        var configureClearScoreService = 0
        var configureDashboard = 0
    }
    var recordedInvocations = Invocations()
}

extension MockAppConfiguration: AppConfiguration {

    func configure() {

        recordedInvocations.configure += 1
    }

    func configureClearScoreService() {

        recordedInvocations.configureClearScoreService += 1
    }

    func configureDashboard() {

        recordedInvocations.configureDashboard += 1
    }
}
