//
//  LoginInteractor.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 24/03/21.
//

import Foundation

class LoginInteractor: LoginInteractorInput {

    weak var output: LoginInteractorOutput?

    init(output: LoginInteractorOutput) {
        self.output = output
    }

    func login(userName: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.output?.userDidLogin(token: "01001ed6e98ba8ad6d80bb312fa02f763facdbb3") //TODO: put your token here
        }
    }
}
