//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import XCTest

@testable import EnricTest

class DefaultClearScoreServiceTests: XCTestCase {

    var service: DefaultClearScoreService!

    override func setUp() {

        super.setUp()
        service = DefaultClearScoreService()
    }

    override func tearDown() {

        service = nil
        super.tearDown()
    }

    // MARK: - getReportInfo

    func testGetReportInfo() {

        let expectation = XCTestExpectation(description: "getReportInfo")

        var resultResponse: Result<ReportInfoModel>? = nil
        service.getReportInfo {

            (result: Result<ReportInfoModel>) in

            resultResponse = result

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)

        guard let result = resultResponse else {

            XCTFail("No response")
            return
        }

        switch result {

            case .failure:

                XCTFail("ReportInfo request broken")

            case .success(let reportInfoModel):

                XCTAssertEqual(reportInfoModel.accountIDVStatus, "PASS")
        }
    }
}
