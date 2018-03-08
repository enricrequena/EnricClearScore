//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

class MockDashboardWireframe {

    struct Invocations {

        var present = 0
    }
    var recordedInvocations = Invocations()
}

extension MockDashboardWireframe: DashboardWireframe {

    func present() {

        recordedInvocations.present += 1
    }
}