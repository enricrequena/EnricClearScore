//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import XCTest
@testable import EnricTest

class DefaultReportInfoModelToDashboardViewModelAdapterTests: XCTestCase {

    var adapter: DefaultReportInfoModelToDashboardViewModelAdapter!

    override func setUp() {

        super.setUp()
        adapter = DefaultReportInfoModelToDashboardViewModelAdapter()
    }

    override func tearDown() {

        adapter = nil
        super.tearDown()
    }

    // MARK: - convert

    func testConvert() {

        let scoreValue = 300
        let maxScoreValue = 700
        let creditReportInfo = CreditReportInfo.Builder()
            .withScore(scoreValue)
            .withMaxScoreValue(maxScoreValue)
            .build()
        let reportInfoModel = ReportInfoModel.Builder()
            .withCreditReportInfo(creditReportInfo)
            .build()

        let expectedViewModel = DashboardViewModel.Builder()
            .withLine1(Strings.DashboardView.firstLineCopy)
            .withScoreValue(String(scoreValue))
            .withLine2(Strings.DashboardView.makeSecondLineCopy(with: maxScoreValue))
            .withPercentage(Float(scoreValue) / Float(maxScoreValue))
            .build()

        let viewModel = adapter.convert(model: reportInfoModel)

        XCTAssertEqual(viewModel, expectedViewModel)
    }
}
