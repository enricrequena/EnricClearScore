//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

class DefaultDashboardWireframe {

    let viewController: DashboardViewController
    let clearScoreService: ClearScoreService

    init(viewController: DashboardViewController, clearScoreService: ClearScoreService) {

        self.viewController = viewController
        self.clearScoreService = clearScoreService
    }
}

extension DefaultDashboardWireframe: DashboardWireframe {

    func present() {

        wireUpModule()
    }
}

extension DefaultDashboardWireframe {

    private func wireUpModule() {

        let adapter = DefaultReportInfoModelToDashboardViewModelAdapter()

        let presenter = DefaultDashboardPresenter(
            view: viewController,
            clearScoreService: clearScoreService,
            adapter: adapter
        )

        viewController.presenter = presenter
    }
}
