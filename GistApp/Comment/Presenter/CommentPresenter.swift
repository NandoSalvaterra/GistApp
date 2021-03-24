//
//  CommentPresenter.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

class CommentPresenter: CommentPresentation {

    weak var view: CommentView?
    var interactor: CommentInteractorInput!
    var router: CommentWireframe!

    init(viewController: CommentViewController) {
        self.view = viewController
        self.interactor = CommentInteractor(output: self)
        self.router = CommentRouter(viewController: viewController)
    }

    func comment(gistId: String, text: String) {
        view?.showLoadingView()
        interactor.comment(gistId: gistId, text: text)
    }
}

// MARK: - CommentInteractorOutput
extension CommentPresenter: CommentInteractorOutput {

    func commentDidLoad(_ comment: Comment) {
        view?.hideLoadingView()
        view?.showComment(comment)
    }

    func onErrorLoadingComment(message: String) {
        view?.hideLoadingView()
        view?.showErrorView(message: message)
    }
}
