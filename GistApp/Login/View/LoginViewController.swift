//
//  LoginViewController.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 24/03/21.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userTextField: UIAccessoryTextField!
    
    var presenter: LoginPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter = LoginPresenter(viewController: self)
    }

    // MARK: - Private API

    private func setupView() {
        userTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        userTextField.inputAccessoryView = AccessoryButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 80), delegate: self)
        (userTextField.inputAccessoryView as? AccessoryButton)?.setTitle("login".localized)
    }
}

// MARK: - LoginView
extension LoginViewController: LoginView {

    func showErrorView(message: String) {
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            (textField.inputAccessoryView as? AccessoryButton)?.disableCommentButton()
        } else {
            (textField.inputAccessoryView as? AccessoryButton)?.enableComentButton()
        }
    }
}

//MARK: - AccessoryButtonViewDelegate
extension LoginViewController: AccessoryButtonViewDelegate {

    func acessoryButtonPressed() {
        (userTextField.inputAccessoryView as? AccessoryButton)?.showLoading()
        presenter.login(userName: userTextField.text ?? "")
    }
}
