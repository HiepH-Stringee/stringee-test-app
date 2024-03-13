//
//  ViewController.swift
//  StringeeTest
//
//  Created by Hiệp Hoàng on 13/03/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func loginTapped(_ sender: Any) {
//        if email.text != "ios@stringee.com" || password.text != "abcd123$" {
//            let alert = UIAlertController(title: "Error", message: "email or passowrd invalid", preferredStyle: .alert)
//            alert.addAction(.init(title: "OK", style: .cancel))
//            self.present(alert, animated: true)
//            return
//        }
        self.performSegue(withIdentifier: "showPost", sender: nil)
    }
    
}

