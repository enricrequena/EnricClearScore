//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

import UIKit

class MockDashboardView {

    struct Invocations {

        var showLoading = 0
        var update = [DashboardViewModel]()
        var updateWithError = [(String, UIColor)]()
    }
    var recordedInvocations = Invocations()
}

extension MockDashboardView: DashboardView {

    func showLoading() {

        recordedInvocations.showLoading += 1
    }

    func update(with viewModel: DashboardViewModel) {

        recordedInvocations.update.append(viewModel)
    }

    func update(withError error: String, and color: UIColor) {

        recordedInvocations.updateWithError.append((error, color))
    }
}
