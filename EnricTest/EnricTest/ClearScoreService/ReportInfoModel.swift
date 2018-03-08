//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

struct ReportInfoModel: Decodable {

    let accountIDVStatus: String
    let creditReportInfo: CreditReportInfo
    let dashboardStatus: String
    let personaType: String
    let coachingSummary: CoachingSummary
    // TODO: Parameter not parsed as not I am unsure about the type, it requires clarification.
    // augmentedCreditScore
}

extension ReportInfoModel: Equatable {

    static func ==(lhs: ReportInfoModel, rhs: ReportInfoModel) -> Bool {
        return lhs.accountIDVStatus == rhs.accountIDVStatus &&
        lhs.creditReportInfo == rhs.creditReportInfo &&
        lhs.dashboardStatus == rhs.dashboardStatus &&
        lhs.personaType == rhs.personaType &&
        lhs.coachingSummary == rhs.coachingSummary
    }
}

struct CreditReportInfo: Decodable {

    let score: Int
    let scoreBand: Int
    let clientRef: String
    let status: String
    let maxScoreValue: Int
    let minScoreValue: Int
    let monthsSinceLastDefaulted: Int
    let hasEverDefaulted: Bool
    let monthsSinceLastDelinquent: Int
    let hasEverBeenDelinquent: Bool
    let percentageCreditUsed: Int
    let percentageCreditUsedDirectionFlag: Int
    let changedScore: Int
    let currentShortTermDebt: Int
    let currentShortTermNonPromotionalDebt: Int
    let currentShortTermCreditLimit: Int
    let currentShortTermCreditUtilisation: Int
    let changeInShortTermDebt: Int
    let currentLongTermDebt: Int
    let currentLongTermNonPromotionalDebt: Int
    // TODO: Also as above, this parameters are not parsed as the type is not clear
    // let currentLongTermCreditLimit: null
    // let currentLongTermCreditUtilisation: null
    let changeInLongTermDebt: Int
    let numPositiveScoreFactors: Int
    let numNegativeScoreFactors: Int
    let equifaxScoreBand: Int
    let equifaxScoreBandDescription: String
    let daysUntilNextReport: Int
}

extension CreditReportInfo: Equatable {

    static func ==(lhs: CreditReportInfo, rhs: CreditReportInfo) -> Bool {
        return lhs.score == rhs.score &&
        lhs.scoreBand == rhs.scoreBand &&
        lhs.clientRef == rhs.clientRef &&
        lhs.status == rhs.status &&
        lhs.maxScoreValue == rhs.maxScoreValue &&
        lhs.minScoreValue == rhs.minScoreValue &&
        lhs.monthsSinceLastDefaulted == rhs.monthsSinceLastDefaulted &&
        lhs.hasEverDefaulted == rhs.hasEverDefaulted &&
        lhs.monthsSinceLastDelinquent == rhs.monthsSinceLastDelinquent &&
        lhs.hasEverBeenDelinquent == rhs.hasEverBeenDelinquent &&
        lhs.percentageCreditUsed == rhs.percentageCreditUsed &&
        lhs.percentageCreditUsedDirectionFlag == rhs.percentageCreditUsedDirectionFlag &&
        lhs.changedScore == rhs.changedScore &&
        lhs.currentShortTermDebt == rhs.currentShortTermDebt &&
        lhs.currentShortTermNonPromotionalDebt == rhs.currentShortTermNonPromotionalDebt &&
        lhs.currentShortTermCreditLimit == rhs.currentShortTermCreditLimit &&
        lhs.currentShortTermCreditUtilisation == rhs.currentShortTermCreditUtilisation &&
        lhs.changeInShortTermDebt == rhs.changeInShortTermDebt &&
        lhs.currentLongTermDebt == rhs.currentLongTermDebt &&
        lhs.currentLongTermNonPromotionalDebt == rhs.currentLongTermNonPromotionalDebt &&
        lhs.changeInLongTermDebt == rhs.changeInLongTermDebt &&
        lhs.numPositiveScoreFactors == rhs.numPositiveScoreFactors &&
        lhs.numNegativeScoreFactors == rhs.numNegativeScoreFactors &&
        lhs.equifaxScoreBand == rhs.equifaxScoreBand &&
        lhs.equifaxScoreBandDescription == rhs.equifaxScoreBandDescription &&
        lhs.daysUntilNextReport == rhs.daysUntilNextReport
    }
}

struct CoachingSummary: Decodable {

    let activeTodo: Bool
    let activeChat: Bool
    let numberOfTodoItems: Int
    let numberOfCompletedTodoItems: Int
    let selected: Bool
}

extension CoachingSummary: Equatable {

    static func ==(lhs: CoachingSummary, rhs: CoachingSummary) -> Bool {
        return lhs.activeTodo == rhs.activeTodo &&
        lhs.activeChat == rhs.activeChat &&
        lhs.numberOfTodoItems == rhs.numberOfTodoItems &&
        lhs.numberOfCompletedTodoItems == rhs.numberOfCompletedTodoItems &&
        lhs.selected == rhs.selected
    }
}
