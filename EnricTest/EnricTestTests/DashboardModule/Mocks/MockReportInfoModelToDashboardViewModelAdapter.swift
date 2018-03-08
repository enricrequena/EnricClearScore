//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

class MockReportInfoModelToDashboardViewModelAdapter {

    struct Invocations {

        var convert = [ReportInfoModel]()
    }
    var recordedInvocations = Invocations()

    struct Return {

        var convert = DashboardViewModel.Builder().build()
    }
    var returnValues = Return()
}

extension MockReportInfoModelToDashboardViewModelAdapter: ReportInfoModelToDashboardViewModelAdapter {

    func convert(model: ReportInfoModel) -> DashboardViewModel {

        recordedInvocations.convert.append(model)

        return returnValues.convert
    }
}