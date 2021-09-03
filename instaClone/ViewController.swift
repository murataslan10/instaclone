//
//  UploadViewController.swift
//  instaClone
//
//  Created by Murat Aslan on 1.09.2021. 
//

import UIKit
import Firebase

class ViewController: UIViewController {
   
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passworTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    @IBAction func singInClicked(_ sender: Any) {
        if mailTextField.text != "" && passworTextField.text != "" {
            
            Auth.auth().signIn(withEmail: mailTextField.text!, password: passworTextField.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toTabbar", sender: nil)
                }
                
            }
        }else{
            makeAlert(titleInput: "Error", messageInput: "Email/Password?")
        }
    }
  
    @IBAction func singUpClicked(_ sender: Any) {
        
        if mailTextField.text != "" && passworTextField.text != "" {
            Auth.auth().createUser(withEmail: mailTextField.text!, password: passworTextField.text!) { (authData, error) in
                
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toTabbar", sender: nil)
                }
            
            }
        }else{
            makeAlert(titleInput: "Error", messageInput: "Username/Password?")
        }
       
        
    }
    func makeAlert(titleInput:String, messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
}

