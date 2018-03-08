//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

class DefaultDashboardWireframeFactory {

}

extension DefaultDashboardWireframeFactory: DashboardWireframeFactory {

    func makeWireframe(with viewController: DashboardViewController) -> DashboardWireframe {

        let clearScoreService = ServiceDirectory.Common.clearScoreService!

        return DefaultDashboardWireframe(
            viewController: viewController,
            clearScoreService: clearScoreService
        )
    }
}