//
//  GistListPresenter.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import Foundation

class GistListPresenter: GistListPresentation {

    weak var view: GistListView?
    var interactor: GistListInteractorInput!
    var router: GistListWireframe!

    init(viewController: GistListViewController) {
        self.view = viewController
        self.interactor = GistListInteractor(output: self)
        self.router = GistListRouter(viewController: viewController)
    }

    func getGists() {
        view?.showLoadingView()
        interactor.fetchGists()
    }

    func showGistDetailView(_ gist: Gist) {
        router.openGistDetailView(gist)
    }

    func showCameraView() {
        router.openCameraView()
    }
}

// MARK: - GistListInteractorOutput
extension GistListPresenter: GistListInteractorOutput {

    func gistsDidLoad(_ gists: [Gist]) {
        view?.hideLoadingView()
        view?.showGists(gists)
    }

    func onErrorLoadingGists(message: String) {
        view?.hideLoadingView()
        view?.showErrorView(message: message)
    }
}
