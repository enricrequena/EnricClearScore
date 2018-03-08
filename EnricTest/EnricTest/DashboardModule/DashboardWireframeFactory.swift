//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

protocol DashboardWireframeFactory: class {

    func makeWireframe(with viewController: DashboardViewController) -> DashboardWireframe
}
