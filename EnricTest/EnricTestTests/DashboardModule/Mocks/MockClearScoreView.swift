//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

import UIKit

class MockClearScoreView: ClearScoreView {

    init() {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {

        fatalError()
    }

    struct Invocations {

		var update = [DashboardViewModel]()
    }

    var recordedInvocations = Invocations()

	override func update(with viewModel: DashboardViewModel) {

        recordedInvocations.update.append(viewModel)
    }
}
