//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import XCTest
@testable import EnricTest

class DefaultDashboardPresenterTests: XCTestCase {

    var presenter: DefaultDashboardPresenter!
    var mockView: MockDashboardView!
    var mockClearScoreService: MockClearScoreService!
    var mockAdapter: MockReportInfoModelToDashboardViewModelAdapter!

    override func setUp() {

        super.setUp()
        mockView = MockDashboardView()
        mockClearScoreService = MockClearScoreService()
        mockAdapter = MockReportInfoModelToDashboardViewModelAdapter()
        presenter = DefaultDashboardPresenter(
            view: mockView,
            clearScoreService: mockClearScoreService,
            adapter: mockAdapter
        )
    }

    override func tearDown() {

        presenter = nil
        mockView = nil
        mockClearScoreService = nil
        mockAdapter = nil
        super.tearDown()
    }

    // MARK: - viewDidLoad

    func testViewDidLoad_SuccessServiceResponse() {

        let reportInfoModel = ReportInfoModel.Builder().withDashboardStatus("389981y64").build()
        let success: Result<ReportInfoModel> = .success(reportInfoModel)
        mockClearScoreService.returnValues.getReportInfo = success

        let viewModel = DashboardViewModel.Builder().withLine1("24124").build()
        mockAdapter.returnValues.convert = viewModel

        presenter.viewDidLoad()

        XCTAssertEqual(mockView.recordedInvocations.showLoading, 1)
        XCTAssertEqual(mockClearScoreService.recordedInvocations.getReportInfo.count, 1)
        XCTAssertEqual(mockAdapter.recordedInvocations.convert, [reportInfoModel])
        XCTAssertEqual(mockView.recordedInvocations.update, [viewModel])
    }

    func testViewDidLoad_FailureServiceResponse() {

        let error = ClearScoreServiceError.requestFailed(message: "")
        let failure: Result<ReportInfoModel> = .failure(error)
        mockClearScoreService.returnValues.getReportInfo = failure

        let viewModel = DashboardViewModel.Builder().withLine1("241189124").build()
        mockAdapter.returnValues.convert = viewModel

        presenter.viewDidLoad()

        XCTAssertEqual(mockView.recordedInvocations.showLoading, 1)
        XCTAssertEqual(mockClearScoreService.recordedInvocations.getReportInfo.count, 1)
        XCTAssertEqual(mockAdapter.recordedInvocations.convert.count, 0)
        XCTAssertEqual(mockView.recordedInvocations.updateWithError.first?.0, Strings.DashboardView.Error.generalErrorMessage)
        XCTAssertEqual(mockView.recordedInvocations.updateWithError.first?.1, UIColor.red.withAlphaComponent(0.6))
    }
}
