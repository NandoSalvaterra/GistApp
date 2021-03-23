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
}

// MARK: - GistListInteractorOutput
extension GistListPresenter: GistListInteractorOutput {

}
