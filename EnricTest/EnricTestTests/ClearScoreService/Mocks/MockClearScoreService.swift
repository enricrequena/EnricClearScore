//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

class MockClearScoreService {

    struct Invocations {

        var getReportInfo = [((Result<ReportInfoModel>) -> Void)]()
    }
    var recordedInvocations = Invocations()

    struct Return {

        var getReportInfo: Result<ReportInfoModel> = .success(ReportInfoModel.Builder().build())
    }
    var returnValues = Return()
}

extension MockClearScoreService: ClearScoreService {

    func getReportInfo(completion: @escaping (Result<ReportInfoModel>) -> Void) {

        recordedInvocations.getReportInfo.append(completion)

        completion(returnValues.getReportInfo)
    }
}