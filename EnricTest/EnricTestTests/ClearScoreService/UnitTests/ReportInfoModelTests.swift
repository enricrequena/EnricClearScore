//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import XCTest
@testable import EnricTest

class ReportInfoModelTests: XCTestCase {

    // MARK: - ReportInfoModel

    func testEquatability() {

        let a = ReportInfoModel.Builder().build()
        let b = ReportInfoModel.Builder().build()
        XCTAssertEqual(a, b)
    }

    func testEquatability_Different_AccountIDVStatus() {

        let a = ReportInfoModel.Builder().withAccountIDVStatus("a").build()
        let b = ReportInfoModel.Builder().withAccountIDVStatus("b").build()
        XCTAssertNotEqual(a, b)
    }

    func testEquatability_Different_CreditReportInfo() {

        let creditReportA = CreditReportInfo.Builder().withChangedScore(1).build()
        let creditReportB = CreditReportInfo.Builder().withChangedScore(4).build()
        let a = ReportInfoModel.Builder().withCreditReportInfo(creditReportA).build()
        let b = ReportInfoModel.Builder().withCreditReportInfo(creditReportB).build()
        XCTAssertNotEqual(a, b)
    }

    func testEquatability_Different_DashboardStatus() {

        let a = ReportInfoModel.Builder().withDashboardStatus("a").build()
        let b = ReportInfoModel.Builder().withDashboardStatus("b").build()
        XCTAssertNotEqual(a, b)
    }

    func testEquatability_Different_PersonaType() {

        let a = ReportInfoModel.Builder().withPersonaType("a").build()
        let b = ReportInfoModel.Builder().withPersonaType("b").build()
        XCTAssertNotEqual(a, b)
    }

    func testEquatability_Different_CoachingSummary() {

        let coachingSummaryA = CoachingSummary.Builder().withActiveChat(true).build()
        let coachingSummaryB = CoachingSummary.Builder().withActiveChat(false).build()
        let a = ReportInfoModel.Builder().withCoachingSummary(coachingSummaryA).build()
        let b = ReportInfoModel.Builder().withCoachingSummary(coachingSummaryB).build()
        XCTAssertNotEqual(a, b)
    }

    // MARK: - CreditReportInfo

    // TODO: Implement tests for equatability

    // MARK: - CoachingSummary

    // TODO: Implement tests for equatability
}
