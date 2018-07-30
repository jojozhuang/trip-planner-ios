//
//  SettingsAnimationViewController.swift
//  johnny.portfolio.tripplanner
//
//  Created by Johnny on 6/3/15.
//  Copyright (c) 2015 JoJoStudio. All rights reserved.
//

import UIKit

let options = [
    "Curl Down",
    "Curl Up(Default)",
    "Dissolve",
    "Flip Left",
    "Flip Right",
    "Flip Top",
    "Flip Bottom",
]

class SettingsAnimationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
//UIPickerViewDataSource
    @IBOutlet weak var pickerTransitionMode: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        //set the selection of the picker
        var selectedIndex = -1
        switch appSettings.transitionOptions {
        case UIViewAnimationOptions.transitionCurlDown:
            selectedIndex = 0
        case UIViewAnimationOptions.transitionCurlUp:
            selectedIndex = 1
        case UIViewAnimationOptions.transitionCrossDissolve:
            selectedIndex = 2
        case UIViewAnimationOptions.transitionFlipFromLeft:
            selectedIndex = 3
        case UIViewAnimationOptions.transitionFlipFromRight:
            selectedIndex = 4
        case UIViewAnimationOptions.transitionFlipFromTop:
            selectedIndex = 5
        case UIViewAnimationOptions.transitionFlipFromBottom:
            selectedIndex = 6
        default:
            selectedIndex = 1
        }
        
        pickerTransitionMode.selectRow(selectedIndex, inComponent: 0, animated: true)
    }
    
    @IBAction func saveSetting(_ sender: UIBarButtonItem) {
        var transitionOptions = UIViewAnimationOptions.showHideTransitionViews
        switch options[pickerTransitionMode.selectedRow(inComponent: 0)] {
        case "Curl Down":
            transitionOptions = .transitionCurlDown
        case "Curl Up":
            transitionOptions = .transitionCurlUp
        case "Dissolve":
            transitionOptions = .transitionCrossDissolve
        case "Flip Left":
            transitionOptions = .transitionFlipFromLeft
        case "Flip Right":
            transitionOptions = .transitionFlipFromRight
        case "Flip Top":
            transitionOptions = .transitionFlipFromTop
        case "Flip Bottom":
            transitionOptions = .transitionFlipFromBottom
        default:
            transitionOptions = .transitionCurlUp
        }
        
        appSettings.transitionOptions = transitionOptions
        navigationController!.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    // MARK: UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
