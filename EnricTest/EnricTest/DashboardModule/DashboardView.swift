//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import UIKit

protocol DashboardView: class {

	func showLoading()
    func update(with viewModel: DashboardViewModel)
    func update(withError error: String, and color: UIColor)
}
