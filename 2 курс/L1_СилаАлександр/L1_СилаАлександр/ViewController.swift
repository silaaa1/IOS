
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var loginInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGestue = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyboardGestue)
    }

    
    @IBAction func logInButton(_ sender: Any) {
        guard let login = loginInput.text,
              let password = passwordInput.text,
              login == "admin",
              password == "123456" else {
                  
                  show(message: "Ошибка авторизации")
                  return
              }
        
        performSegue(withIdentifier: "Log in", sender: nil)
    }
    


    
    @objc func keyBoardWasShown(notification: Notification) {
        let info = notification.userInfo! as
        NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        self.scrollView.contentInset = contentInsets
    }
    @objc func keyBoardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,selector: #selector(self.keyBoardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self,selector: #selector(self.keyBoardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
}

