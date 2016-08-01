//
//  AppDelegate.swift
//  FreeMe
//
//  Created by Victor Lee on 11/7/16.
//  Copyright © 2016 VictorLee. All rights reserved.
//
//3 parts to protocol: protocol declaration, adoption, conforming. Mainly for Delegation.

import UIKit
import Realm
import RealmSwift
import Mixpanel


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        

        let token = "6642b854339d577922e5154e6f70fe3b"
        Mixpanel.sharedInstanceWithToken(token)
        let mixpanel: Mixpanel = Mixpanel.sharedInstance()
        mixpanel.track("FreeMeApp")
        
        let navigationBarAppearance = UINavigationBar.appearance()
        
        navigationBarAppearance.tintColor = UIColor.whiteColor()
        navigationBarAppearance.barTintColor = UIColor(red: 76.0/255.0, green: 217.0/255.0, blue: 100.0/255.0, alpha: 1)
        
        navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        
        
        
//        // Set up the Parse SDK
//        let configuration = ParseClientConfiguration {
//            $0.applicationId = "freeMeApp"
//            $0.server = "https://enthousiaste-madame-87816.herokuapp.com/parse"
//        }
//        Parse.initializeWithConfiguration(configuration)
//        do {
//            try PFUser.logInWithUsername("test", password: "test")
//        } catch {
//            print("Unable to log in")
//        }
//        
//        if let currentUser = PFUser.currentUser() {
//            print("\(currentUser.username!) logged in successfully")
//        } else {
//            print("No logged in user :(")
//        }
        
        return true
    }
        
        
    

    
        
    
    
    
    
    
    
    
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

