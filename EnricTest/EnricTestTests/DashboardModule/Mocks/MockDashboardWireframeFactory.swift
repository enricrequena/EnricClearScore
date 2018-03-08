//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

class MockDashboardWireframeFactory {

    struct Invocations {

        var makeWireframe = [DashboardViewController]()
    }
    var recordedInvocations = Invocations()

    struct Return {

        var dashboardWireframe = MockDashboardWireframe()
    }
    var returnValues = Return()

}

extension MockDashboardWireframeFactory: DashboardWireframeFactory {

    func makeWireframe(with viewController: DashboardViewController) -> DashboardWireframe {

        recordedInvocations.makeWireframe.append(viewController)

        return returnValues.dashboardWireframe
    }
}