//
//  ViewController.swift
//  AlternateAppIcons
//
//  Created by Sameh Mabrouk on 29/01/2017.
//  Copyright © 2017 Sameh Mabrouk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentdControlValueChanged(_ sender: Any) {
        
        guard UIApplication.shared.supportsAlternateIcons else {
            let errorAlert = UIAlertController(title: "Error", message: "Sorry your device don't support Alternate icons", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.show(errorAlert, sender: nil)
            
            return
        }
        
        var iconName : String? = nil
        
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            iconName = "fr"
        case 2:
            iconName = "de"
        case 3:
            iconName = "it"
        default:
            break
        }
        
        UIApplication.shared.setAlternateIconName(iconName) { (error) in
            if let error = error {
                print("error: \(error)")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var selectedIndex = 0
        
        let currentIcon = UIApplication.shared.alternateIconName ?? ""
        
        switch currentIcon {
        case "fr":
            selectedIndex = 1
        case "de":
            selectedIndex = 2
        case "it":
            selectedIndex = 3
        default:
            break
        }
        
        segmentedControl.selectedSegmentIndex = selectedIndex
    }
    
}
