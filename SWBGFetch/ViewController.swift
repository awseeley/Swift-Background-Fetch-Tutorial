//
//  ViewController.swift
//  SWBGFetch
//
//  Created by Andrew Seeley on 2/6/18.
//  Copyright © 2018 Seemu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblWeather: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(weather: String, temp: Double) {
        print("Update UI")
        lblTime.text = "\(Date())"
        lblWeather.text = "\(weather) \(temp)"
    }


}

