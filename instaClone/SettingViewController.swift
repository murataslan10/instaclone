//
//  UploadViewController.swift
//  instaClone
//
//  Created by Murat Aslan on 1.09.2021.
//

import UIKit
import Firebase

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do{
           try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toTabbarVC", sender: nil)
            
        }catch{
            print("Error")
        }
        
    }
    
}
