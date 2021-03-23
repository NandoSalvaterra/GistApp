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
}

// MARK: - GistDetailInteractorOutput
extension GistDetailPresenter: GistDetailInteractorOutput {

}
