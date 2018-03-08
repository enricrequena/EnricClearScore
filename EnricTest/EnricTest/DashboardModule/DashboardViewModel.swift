//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

struct DashboardViewModel {

    let line1: String
    let scoreValue: String
    let line2: String
    let percentage: Float
}

extension DashboardViewModel: Equatable {

    static func ==(lhs: DashboardViewModel, rhs: DashboardViewModel) -> Bool {
        return lhs.line1 == rhs.line1 &&
        lhs.scoreValue == rhs.scoreValue &&
        lhs.line2 == rhs.line2 &&
        lhs.percentage == rhs.percentage
    }
}