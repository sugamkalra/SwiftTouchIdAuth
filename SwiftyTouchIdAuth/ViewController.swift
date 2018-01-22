//
//  ViewController.swift
//  SwiftyTouchIdAuth
//
//  Created by Sugam Kalra on 20/01/18.
//  Copyright © 2018 Sugam Kalra. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func authWithTouchID(_ sender: Any) {
    
        let context = LAContext()
        var error: NSError?
        
        // Check for Touch ID
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Authenticate with Touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply:
                {(success, error) in
                    
                    if success {
                        self.showAlertController("Touch ID Authentication Succeeded")
                    }
                    else {
                        self.showAlertController("Touch ID Authentication Failed")
                    }
            })
        }
            
        else {
            showAlertController("Touch ID not available")
        }
    }
    
    // MARK: - Show Alert Method
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



