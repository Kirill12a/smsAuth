//
//  SMSCodeViewController.swift
//  smsAuth
//
//  Created by Kirill Drozdov on 08.03.2022.
//

import UIKit

class SMSCodeViewController: UIViewController, UITextFieldDelegate {
  
  private let codeField: UITextField = {
    let field = UITextField()
    field.backgroundColor = .secondarySystemBackground
    field.placeholder = "Enter code"
    field.textAlignment = .center
    field.returnKeyType = .continue
    return field
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(codeField)
    codeField.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
    codeField.center = view.center
    codeField.delegate = self
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    if let text = textField.text, !text.isEmpty{
      let code = text
      AuthManager.shared.verifAuth(smsCode: code) { [weak self] succsess in
        guard succsess else {return}
        DispatchQueue.main.async {
          let vc = AccountViewController()
          vc.modalPresentationStyle = .fullScreen
          self?.present(vc, animated:  true)
        }
      }
    }
    return true
  }
  
}

