//
//  Copyright © 2018 ERT Limited. All rights reserved.
//

import UIKit
import Toast_Swift

class DashboardViewController: UIViewController {

    private var viewModel: DashboardViewModel?
    var presenter: DashboardPresenter?

	@IBOutlet weak var loadingView: UIView!
	@IBOutlet weak var clearScoreView: ClearScoreView!

    override func viewDidLoad() {

        presenter?.viewDidLoad()
    }
}

extension DashboardViewController: DashboardView {

    func showLoading() {

        showLoadingView()
    }

    func update(with viewModel: DashboardViewModel) {

        showClearScoreView()
        clearScoreView.update(with: viewModel)
    }

    func update(withError error: String, and color: UIColor) {

        hideLoadingViewAndClearScoreView()
        var style = ToastStyle()
        style.backgroundColor = color
        self.view.makeToast(error, duration: 1.5, position: .center, style: style)
    }
}

extension DashboardViewController {

    private func showLoadingView() {

        loadingView.isHidden = false
        clearScoreView.isHidden = true
    }

    private func showClearScoreView() {

        loadingView.isHidden = true
        clearScoreView.isHidden = false
    }

    private func hideLoadingViewAndClearScoreView() {

        loadingView.isHidden = true
        clearScoreView.isHidden = true
    }
}
