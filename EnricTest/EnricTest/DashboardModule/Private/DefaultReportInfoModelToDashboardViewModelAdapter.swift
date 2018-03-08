//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

class DefaultReportInfoModelToDashboardViewModelAdapter {

}

extension DefaultReportInfoModelToDashboardViewModelAdapter: ReportInfoModelToDashboardViewModelAdapter {

    func convert(model reportInfo: ReportInfoModel) -> DashboardViewModel {

        let firstLine = Strings.DashboardView.firstLineCopy
        let scoreValue = String(reportInfo.creditReportInfo.score)
        let maxScoreValue = reportInfo.creditReportInfo.maxScoreValue
        let secondLine = Strings.DashboardView.makeSecondLineCopy(with: maxScoreValue)
        let percentage = Float(reportInfo.creditReportInfo.score) / Float(reportInfo.creditReportInfo.maxScoreValue)

        return .init(line1: firstLine, scoreValue: scoreValue, line2: secondLine, percentage: percentage)
    }
}
