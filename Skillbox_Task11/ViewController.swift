import UIKit
import Bond

class ViewController: UIViewController {
    
    @IBOutlet weak var logInTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoPasswordLabel: UILabel!
    
    @IBAction func enterClickButton(_ sender: Any) {
        
        infoLabel.isHidden = false
        infoPasswordLabel.isHidden = false
        
        if variable1 && variable2 {
            performSegue(withIdentifier: "goToNextViewController", sender: nil)
            infoLabel.isHidden = true
            infoPasswordLabel.isHidden = true
        }
        
        logInTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBOutlet weak var enterButton: UIButton!
    
    var variable1 = false
    var variable2 = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        infoLabel.isHidden = true
        infoPasswordLabel.isHidden = true
        
        logInTextField.reactive.text.map{ text in
            return self.checkLogInField(text: text!)
        }
        .bind(to: self.infoLabel.reactive.text)
            
        passwordTextField.reactive.text.map { text in
            return self.checkPasswordField(text: text!)
        }
        .bind(to: self.infoPasswordLabel.reactive.text)
            
        passwordTextField.reactive.text.map{ _ in
            return (self.logInTextField.text != "") && (self.passwordTextField.text != "") ? true : false
        }
        .bind(to: self.enterButton.reactive.isEnabled)
    }

    func checkLogInField(text: String) -> String {
        
        let emailSymb = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailCheck = NSPredicate(format:"SELF MATCHES %@", emailSymb)
        
        if emailCheck.evaluate(with: text) == true { variable1 = true }
        else { variable1 = false }
        
        return emailCheck.evaluate(with: text) == false ? "Not a valid email" : ""
    }
    
    func checkPasswordField(text: String) -> String {
        
        let passwordSymb = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordSymb)
        
        if passwordCheck.evaluate(with: text) == true { variable2 = true }
        else { variable2 = false }
        
        return passwordCheck.evaluate(with: text) == false ? "Not a valid password" : ""
    }
}

