//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

class MockDashboardPresenter {

    struct Invocations {

        var viewDidLoad = 0
    }
    var recordedInvocations = Invocations()
}

extension MockDashboardPresenter: DashboardPresenter {

    func viewDidLoad() {

        recordedInvocations.viewDidLoad += 1
    }
}