//
//  Copyright © 2018 ERT Limited. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appConfiguration: AppConfiguration = DefaultAppConfiguration()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        appConfiguration.configure()
        configureInitialModule()

        return true
    }
}

extension AppDelegate {

    private func configureInitialModule() {

        makeKeyWindow()

        guard let dashboardWireframe = makeDashboardWireframe() else {

            return
        }
        dashboardWireframe.present()
    }

    private func makeKeyWindow() {

        guard let window = UIApplication.shared.windows.first else {

            return
        }

        window.makeKeyAndVisible()

        self.window = window
    }

    private func makeDashboardWireframe() -> DashboardWireframe? {

        guard let dashboardViewController = findDashboardViewController() else {

            return nil
        }

		guard let dashboardWireframeFactory = ServiceDirectory.Dashboard.factory else {

			return nil
		}

        return dashboardWireframeFactory.makeWireframe(with: dashboardViewController)
    }

    private func findDashboardViewController() -> DashboardViewController? {

        guard let rootViewController = window?.rootViewController as? UINavigationController else {

            return nil
        }

        guard rootViewController.viewControllers.count == 1,
              let dashboardViewController = rootViewController.topViewController as? DashboardViewController else {

            return nil
        }

        return dashboardViewController
    }
}

