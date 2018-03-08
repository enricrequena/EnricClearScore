//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

protocol AppConfiguration {

    func configure()
    func configureClearScoreService()
    func configureDashboard()
}

extension AppConfiguration {

    func configure() {

        configureClearScoreService()
        configureDashboard()
    }
}
