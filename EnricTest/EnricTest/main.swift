//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import UIKit

autoreleasepool {

    let appDelegateClass: AnyClass? = NSClassFromString("EnricTestTests.TestAppDelegate") ?? AppDelegate.self

    let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
        .bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))

    UIApplicationMain(CommandLine.argc, args, nil, NSStringFromClass(appDelegateClass!))
}