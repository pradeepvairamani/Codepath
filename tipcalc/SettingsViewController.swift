//
//  SettingsViewController.swift
//  tipcalc
//
//  Created by Pradeep Vairamani on 12/22/16.
//  Copyright © 2016 Pradeep Vairamani. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsSegment: UISegmentedControl!
    let gradientLayer = CAGradientLayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.green
        gradientLayer.frame = self.view.bounds
        let color1 = UIColor(red: 0.15, green: 0.67, blue: 0.66, alpha: 1.0).cgColor as CGColor
        let color2 = UIColor(red: 0, green: 0.0, blue: 1.0, alpha: 0.5).cgColor as CGColor
        gradientLayer.colors = [color1, color2]
        //        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        //        self.view.layer.addSublayer(gradientLayer)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        let defaults = UserDefaults.standard
        let defaultVal = defaults.value(forKey: "default_tip")
        if(defaultVal != nil){
            let intDefaultVal = defaults.value(forKey: "default_tip") as! Int
            settingsSegment.selectedSegmentIndex = intDefaultVal
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onDefaultChange(_ sender: Any) {
        let selectedSegment = settingsSegment.selectedSegmentIndex
        print(selectedSegment)
        let defaults = UserDefaults.standard
        defaults.set(selectedSegment, forKey: "default_tip")
        defaults.synchronize()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
