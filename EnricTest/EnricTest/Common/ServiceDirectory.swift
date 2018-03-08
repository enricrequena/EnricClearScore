//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

struct ServiceDirectory {

    enum Common {

        static var clearScoreService: ClearScoreService!
    }

    enum Dashboard {

        static var factory: DashboardWireframeFactory!
    }
}