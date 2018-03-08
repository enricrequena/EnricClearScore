//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

@testable import EnricTest

extension DashboardViewModel {

    struct Builder {
        var line1: String = "line1"
        var scoreValue: String = "scoreValue"
        var line2: String = "line2"
        var percentage: Float = 1.0

        func withLine1(_ line1: String) -> Builder {
            var builder = self
            builder.line1 = line1
            return builder
        }

        func withScoreValue(_ scoreValue: String) -> Builder {
            var builder = self
            builder.scoreValue = scoreValue
            return builder
        }

        func withLine2(_ line2: String) -> Builder {
            var builder = self
            builder.line2 = line2
            return builder
        }

        func withPercentage(_ percentage: Float) -> Builder {
            var builder = self
            builder.percentage = percentage
            return builder
        }

        func build() -> DashboardViewModel {
            return DashboardViewModel(
                line1: self.line1,
                scoreValue: self.scoreValue,
                line2: self.line2,
                percentage: self.percentage)
        }
    }
}