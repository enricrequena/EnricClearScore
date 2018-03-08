//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import UIKit

class DefaultDashboardPresenter {

    let adapter: ReportInfoModelToDashboardViewModelAdapter
    let clearScoreService: ClearScoreService
    weak var view: DashboardView?

    init(view: DashboardView,
         clearScoreService: ClearScoreService,
         adapter: ReportInfoModelToDashboardViewModelAdapter) {

        self.view = view
        self.clearScoreService = clearScoreService
        self.adapter = adapter
    }
}

extension DefaultDashboardPresenter: DashboardPresenter {

    func viewDidLoad() {

        view?.showLoading()

        clearScoreService.getReportInfo {

            [weak self] result in

            guard let strongSelf = self else {

                return
            }

            strongSelf.process(result)
        }
    }
}

extension DefaultDashboardPresenter {

    private func process(_ result: Result<ReportInfoModel>) {

        switch result {

            case let .success(reportInfoModel):

                let dashboardViewModel = adapter.convert(model: reportInfoModel)
                view?.update(with: dashboardViewModel)

            case let .failure(error):

                let errorMessage = makeErrorMessage(from: error)
                view?.update(withError: errorMessage, and: UIColor.red.withAlphaComponent(0.6))
        }
    }

    private func makeErrorMessage(from: Error) -> String {

        // TODO: Log error to logging framework (such as NewRelic)

        return Strings.DashboardView.Error.generalErrorMessage
    }
}