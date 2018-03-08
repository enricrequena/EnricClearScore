//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

extension ReportInfoModel {

    struct Builder {

        var accountIDVStatus: String = "accountIDVStatus"
        var creditReportInfo: CreditReportInfo = CreditReportInfo.Builder().build()
        var dashboardStatus: String = "dashboardStatus"
        var personaType: String = "personaType"
        var coachingSummary: CoachingSummary = CoachingSummary.Builder().build()

        func withAccountIDVStatus(_ accountIDVStatus: String) -> Builder {
            var builder = self
            builder.accountIDVStatus = accountIDVStatus
            return builder
        }

        func withCreditReportInfo(_ creditReportInfo: CreditReportInfo) -> Builder {
            var builder = self
            builder.creditReportInfo = creditReportInfo
            return builder
        }

        func withDashboardStatus(_ dashboardStatus: String) -> Builder {
            var builder = self
            builder.dashboardStatus = dashboardStatus
            return builder
        }

        func withPersonaType(_ personaType: String) -> Builder {
            var builder = self
            builder.personaType = personaType
            return builder
        }

        func withCoachingSummary(_ coachingSummary: CoachingSummary) -> Builder {
            var builder = self
            builder.coachingSummary = coachingSummary
            return builder
        }

        func build() -> ReportInfoModel {
            return ReportInfoModel(
                accountIDVStatus: self.accountIDVStatus,
                creditReportInfo: self.creditReportInfo,
                dashboardStatus: self.dashboardStatus,
                personaType: self.personaType,
                coachingSummary: self.coachingSummary)
        }
    }
}

extension CreditReportInfo {

    struct Builder {
        var score: Int = 0
        var scoreBand: Int = 0
        var clientRef: String = "clientRef"
        var status: String = "status"
        var maxScoreValue: Int = 0
        var minScoreValue: Int = 0
        var monthsSinceLastDefaulted: Int = 0
        var hasEverDefaulted: Bool = false
        var monthsSinceLastDelinquent: Int = 0
        var hasEverBeenDelinquent: Bool = false
        var percentageCreditUsed: Int = 0
        var percentageCreditUsedDirectionFlag: Int = 0
        var changedScore: Int = 0
        var currentShortTermDebt: Int = 0
        var currentShortTermNonPromotionalDebt: Int = 0
        var currentShortTermCreditLimit: Int = 0
        var currentShortTermCreditUtilisation: Int = 0
        var changeInShortTermDebt: Int = 0
        var currentLongTermDebt: Int = 0
        var currentLongTermNonPromotionalDebt: Int = 0
        var changeInLongTermDebt: Int = 0
        var numPositiveScoreFactors: Int = 0
        var numNegativeScoreFactors: Int = 0
        var equifaxScoreBand: Int = 0
        var equifaxScoreBandDescription: String = "equifaxScoreBandDescription"
        var daysUntilNextReport: Int = 0

        func withScore(_ score: Int) -> Builder {
            var builder = self
            builder.score = score
            return builder
        }

        func withScoreBand(_ scoreBand: Int) -> Builder {
            var builder = self
            builder.scoreBand = scoreBand
            return builder
        }

        func withClientRef(_ clientRef: String) -> Builder {
            var builder = self
            builder.clientRef = clientRef
            return builder
        }

        func withStatus(_ status: String) -> Builder {
            var builder = self
            builder.status = status
            return builder
        }

        func withMaxScoreValue(_ maxScoreValue: Int) -> Builder {
            var builder = self
            builder.maxScoreValue = maxScoreValue
            return builder
        }

        func withMinScoreValue(_ minScoreValue: Int) -> Builder {
            var builder = self
            builder.minScoreValue = minScoreValue
            return builder
        }

        func withMonthsSinceLastDefaulted(_ monthsSinceLastDefaulted: Int) -> Builder {
            var builder = self
            builder.monthsSinceLastDefaulted = monthsSinceLastDefaulted
            return builder
        }

        func withHasEverDefaulted(_ hasEverDefaulted: Bool) -> Builder {
            var builder = self
            builder.hasEverDefaulted = hasEverDefaulted
            return builder
        }

        func withMonthsSinceLastDelinquent(_ monthsSinceLastDelinquent: Int) -> Builder {
            var builder = self
            builder.monthsSinceLastDelinquent = monthsSinceLastDelinquent
            return builder
        }

        func withHasEverBeenDelinquent(_ hasEverBeenDelinquent: Bool) -> Builder {
            var builder = self
            builder.hasEverBeenDelinquent = hasEverBeenDelinquent
            return builder
        }

        func withPercentageCreditUsed(_ percentageCreditUsed: Int) -> Builder {
            var builder = self
            builder.percentageCreditUsed = percentageCreditUsed
            return builder
        }

        func withPercentageCreditUsedDirectionFlag(_ percentageCreditUsedDirectionFlag: Int) -> Builder {
            var builder = self
            builder.percentageCreditUsedDirectionFlag = percentageCreditUsedDirectionFlag
            return builder
        }

        func withChangedScore(_ changedScore: Int) -> Builder {
            var builder = self
            builder.changedScore = changedScore
            return builder
        }

        func withCurrentShortTermDebt(_ currentShortTermDebt: Int) -> Builder {
            var builder = self
            builder.currentShortTermDebt = currentShortTermDebt
            return builder
        }

        func withCurrentShortTermNonPromotionalDebt(_ currentShortTermNonPromotionalDebt: Int) -> Builder {
            var builder = self
            builder.currentShortTermNonPromotionalDebt = currentShortTermNonPromotionalDebt
            return builder
        }

        func withCurrentShortTermCreditLimit(_ currentShortTermCreditLimit: Int) -> Builder {
            var builder = self
            builder.currentShortTermCreditLimit = currentShortTermCreditLimit
            return builder
        }

        func withCurrentShortTermCreditUtilisation(_ currentShortTermCreditUtilisation: Int) -> Builder {
            var builder = self
            builder.currentShortTermCreditUtilisation = currentShortTermCreditUtilisation
            return builder
        }

        func withChangeInShortTermDebt(_ changeInShortTermDebt: Int) -> Builder {
            var builder = self
            builder.changeInShortTermDebt = changeInShortTermDebt
            return builder
        }

        func withCurrentLongTermDebt(_ currentLongTermDebt: Int) -> Builder {
            var builder = self
            builder.currentLongTermDebt = currentLongTermDebt
            return builder
        }

        func withCurrentLongTermNonPromotionalDebt(_ currentLongTermNonPromotionalDebt: Int) -> Builder {
            var builder = self
            builder.currentLongTermNonPromotionalDebt = currentLongTermNonPromotionalDebt
            return builder
        }

        func withChangeInLongTermDebt(_ changeInLongTermDebt: Int) -> Builder {
            var builder = self
            builder.changeInLongTermDebt = changeInLongTermDebt
            return builder
        }

        func withNumPositiveScoreFactors(_ numPositiveScoreFactors: Int) -> Builder {
            var builder = self
            builder.numPositiveScoreFactors = numPositiveScoreFactors
            return builder
        }

        func withNumNegativeScoreFactors(_ numNegativeScoreFactors: Int) -> Builder {
            var builder = self
            builder.numNegativeScoreFactors = numNegativeScoreFactors
            return builder
        }

        func withEquifaxScoreBand(_ equifaxScoreBand: Int) -> Builder {
            var builder = self
            builder.equifaxScoreBand = equifaxScoreBand
            return builder
        }

        func withEquifaxScoreBandDescription(_ equifaxScoreBandDescription: String) -> Builder {
            var builder = self
            builder.equifaxScoreBandDescription = equifaxScoreBandDescription
            return builder
        }

        func withDaysUntilNextReport(_ daysUntilNextReport: Int) -> Builder {
            var builder = self
            builder.daysUntilNextReport = daysUntilNextReport
            return builder
        }

        func build() -> CreditReportInfo {
            return CreditReportInfo(
                score: self.score,
                scoreBand: self.scoreBand,
                clientRef: self.clientRef,
                status: self.status,
                maxScoreValue: self.maxScoreValue,
                minScoreValue: self.minScoreValue,
                monthsSinceLastDefaulted: self.monthsSinceLastDefaulted,
                hasEverDefaulted: self.hasEverDefaulted,
                monthsSinceLastDelinquent: self.monthsSinceLastDelinquent,
                hasEverBeenDelinquent: self.hasEverBeenDelinquent,
                percentageCreditUsed: self.percentageCreditUsed,
                percentageCreditUsedDirectionFlag: self.percentageCreditUsedDirectionFlag,
                changedScore: self.changedScore,
                currentShortTermDebt: self.currentShortTermDebt,
                currentShortTermNonPromotionalDebt: self.currentShortTermNonPromotionalDebt,
                currentShortTermCreditLimit: self.currentShortTermCreditLimit,
                currentShortTermCreditUtilisation: self.currentShortTermCreditUtilisation,
                changeInShortTermDebt: self.changeInShortTermDebt,
                currentLongTermDebt: self.currentLongTermDebt,
                currentLongTermNonPromotionalDebt: self.currentLongTermNonPromotionalDebt,
                changeInLongTermDebt: self.changeInLongTermDebt,
                numPositiveScoreFactors: self.numPositiveScoreFactors,
                numNegativeScoreFactors: self.numNegativeScoreFactors,
                equifaxScoreBand: self.equifaxScoreBand,
                equifaxScoreBandDescription: self.equifaxScoreBandDescription,
                daysUntilNextReport: self.daysUntilNextReport)
        }
    }
}

extension CoachingSummary {

    struct Builder {
        var activeTodo: Bool = false
        var activeChat: Bool = false
        var numberOfTodoItems: Int = 0
        var numberOfCompletedTodoItems: Int = 0
        var selected: Bool = false

        func withActiveTodo(_ activeTodo: Bool) -> Builder {
            var builder = self
            builder.activeTodo = activeTodo
            return builder
        }

        func withActiveChat(_ activeChat: Bool) -> Builder {
            var builder = self
            builder.activeChat = activeChat
            return builder
        }

        func withNumberOfTodoItems(_ numberOfTodoItems: Int) -> Builder {
            var builder = self
            builder.numberOfTodoItems = numberOfTodoItems
            return builder
        }

        func withNumberOfCompletedTodoItems(_ numberOfCompletedTodoItems: Int) -> Builder {
            var builder = self
            builder.numberOfCompletedTodoItems = numberOfCompletedTodoItems
            return builder
        }

        func withSelected(_ selected: Bool) -> Builder {
            var builder = self
            builder.selected = selected
            return builder
        }

        func build() -> CoachingSummary {
            return CoachingSummary(
                activeTodo: self.activeTodo,
                activeChat: self.activeChat,
                numberOfTodoItems: self.numberOfTodoItems,
                numberOfCompletedTodoItems: self.numberOfCompletedTodoItems,
                selected: self.selected)
        }
    }
}