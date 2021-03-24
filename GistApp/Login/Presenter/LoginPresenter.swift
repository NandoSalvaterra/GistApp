//
//  LoginPresenter.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 24/03/21.
//

import Foundation

class LoginPresenter: LoginPresentation {

    weak var view: LoginView?
    var interactor: LoginInteractorInput!
    var router: LoginWireframe!

    init(viewController: LoginViewController) {
        self.view  = viewController
        self.interactor = LoginInteractor(output: self)
        self.router = LoginRouter(viewController: viewController)
    }

    func login(userName: String) {
        interactor.login(userName: userName)
    }
}

// MARK: - LoginInteractorOutput 
extension LoginPresenter: LoginInteractorOutput {

    func userDidLogin(token: String) {
        GistAPI.shared.token = token
        router.openGistListView()
    }

    func onErrorLogin(message: String) {

    }
}
