//
//  AppDelegate.swift
//  Coola
//
//  Created by Tomer Lavi on 16/05/2016.
//  Copyright © 2016 CoolaData. All rights reserved.
//

import UIKit
import CoolaDataTracker

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CoolaDataDelegate {

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//		CoolaDataTracker.updateServiceEndPoint("https://udc-neb.kampyle.com/")
		CoolaDataTracker.getInstance().setupWithAppKey("<Your app key>")
		CoolaDataTracker.getInstance().customEventHandler = self
		CoolaDataTracker.getInstance().trackEvent("App Started from Swift", properties: nil)
		return true
	}

	func RecordEvents(events: [AnyObject]!) {
		print("RecordEvents: \(events)")
	}

	func PublishEvents(events: [AnyObject]!) {
		print("PublishEvents: \(events)")
	}
}

