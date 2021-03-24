//
//  LoginContract.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 24/03/21.
//

import Foundation

protocol LoginView: class {

    var presenter: LoginPresentation! { get set }

    func showErrorView(message: String)
}

protocol LoginPresentation: class {

    var view: LoginView? { get set }
    var interactor: LoginInteractorInput! { get set }
    var router: LoginWireframe! { get set }

    func login(userName: String)
}

protocol LoginInteractorInput: class {

    var output: LoginInteractorOutput? { get set }

    func login(userName: String)
}

protocol LoginInteractorOutput: class {

    func userDidLogin(token: String)
    func onErrorLogin(message: String)

}

protocol LoginWireframe: class {

    var viewController: LoginViewController? { get set }

    func openGistListView()
}
