//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

enum Strings {

    enum  DashboardView {

        static let firstLineCopy = "Your credit score is"
        static func makeSecondLineCopy(with maxScoreValue: Int) -> String {

            return "out of \(maxScoreValue)"
        }

        enum Error {

            static let generalErrorMessage = "Oops, your request failed this time. Please try again."
        }
    }
}
