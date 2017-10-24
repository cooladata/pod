//
//  AppDelegate.swift
//  ExampleSwift3
//
//  Created by Tomer Lavi on 13/04/2017.
//  Copyright © 2017 Cooladata. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CoolaDataDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		CoolaDataTracker.getInstance().setup(withAppKey: "dm83kztf34ps3olwwu3c0cad7cjyr2u4")
		CoolaDataTracker.getInstance().customEventHandler = self
		CoolaDataTracker.getInstance().trackEvent("App Started from Swift #2", properties: nil)
		return true
	}

	func recordEvents(_ events: [Any]!) {
		print("recordEvents: \(events)")
	}
	
	func publishEvents(_ events: [Any]!) {
		print("publishEvents: \(events)")
	}

}

