//
//  GistDetailPresenter.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

class GistDetailPresenter: GistDetailPresentation {
    
    weak var view: GistDetailView?
    var interactor: GistDetailInteractorInput!
    var router: GistDetailWireframe!
    
    init(viewController: GistDetailViewController) {
        self.view = viewController
        self.interactor = GistDetailInteractor(output: self)
        self.router = GistDetailRouter(viewController: viewController)
    }
    
    func getGistDetail(gistId: String) {
        view?.showLoadingView()
        interactor.fetchGistDetail(gistId: gistId)
    }
    
    func getComments(gistId: String) {
        interactor.fetchComments(gistId: gistId)
    }
}

// MARK: - GistDetailInteractorOutput
extension GistDetailPresenter: GistDetailInteractorOutput {
    
    func gistDetailDidLoad(_ gist: Gist) {
        view?.hideLoadingView()
        view?.showGist(gist)
    }
    
    func commentsDidLoad(_ comments: [Comment]) {
        view?.hideLoadingView()
        view?.showComments(comments)
    }
    
    func onErrorLoadingGist(message: String) {
        view?.hideLoadingView()
        view?.showErrorView(message: message)
    }
    
    func onErrorLoadingComments(message: String) {
        view?.hideLoadingView()
        view?.showErrorView(message: message)
    }
}
