//
//  AppDelegate.swift
//  ToDo-App-week3-Afnan
//
//  Created by Fno Khalid on 07/03/1443 AH.
//

import UIKit



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.splashscreen()
        
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        
        return true
    }
        private func splashscreen() {
            let launchScreenVC = UIStoryboard.init(name: "LaunchScreen", bundle: nil)
            let rootVC =
            launchScreenVC.instantiateViewController(withIdentifier: "SplashController")
            self.window?.rootViewController = rootVC
            self.window?.makeKeyAndVisible()
            Timer.scheduledTimer(timeInterval: 50, target: self, selector: #selector(dismissSplashController), userInfo: nil, repeats: false)
            
        }
    
    @objc func dismissSplashController() {
        let mainVC = UIStoryboard.init(name: "Main", bundle: nil)
        let rootVc = mainVC.instantiateViewController(withIdentifier: "initController")
        self.window?.rootViewController = rootVc
        self.window?.makeKeyAndVisible()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

