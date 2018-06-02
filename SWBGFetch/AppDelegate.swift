//
//  AppDelegate.swift
//  SWBGFetch
//
//  Created by Andrew Seeley on 2/6/18.
//  Copyright © 2018 Seemu. All rights reserved.
//

import UIKit
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let vc = window?.rootViewController as? ViewController {
            
            let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22")
            print("Loading URL")
            URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) in
                print("done")
                guard let data = data, error == nil else {
                    completionHandler(.failed)
                    return
                }
                
                do {
                    let json = try JSON(data: data)
                    
                    let weather = json["weather"][0]["main"].string!
                    let temp = json["main"]["temp"].double!
                    
                    DispatchQueue.main.async {
                        vc.updateUI(weather: weather, temp: temp)
                    }
                    completionHandler(.newData)
                } catch {
                    completionHandler(.failed)
                    print("Failed to parse")
                }
            }).resume()

        }
    }


}

