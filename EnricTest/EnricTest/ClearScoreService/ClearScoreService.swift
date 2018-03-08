//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

protocol ClearScoreService: class {

    func getReportInfo(completion: @escaping (Result<ReportInfoModel>) -> Void)
}