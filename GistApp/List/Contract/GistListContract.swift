//
//  GistListContract.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import Foundation

protocol GistListView: class {

    var presenter: GistListPresentation! { get set }

    func showLoadingView()
    func hideLoadingView()
    func showGists(_ gists: [Gist])
    func showEmptyView()
    func showErrorView(message: String)
}

protocol GistListPresentation: class {

    var view: GistListView? { get set }
    var interactor: GistListInteractorInput! { get set }
    var router: GistListWireframe! { get set }

    func getGists()
    func showGistDetailView(_ gistId: String)
    func showCameraView()
}

protocol GistListInteractorInput: class {

    var output: GistListInteractorOutput? { get set }

    func fetchGists()

}

protocol GistListInteractorOutput: class {

    func gistsDidLoad(_ gists: [Gist])
    func onErrorLoadingGists(message: String)
}

protocol GistListWireframe: class {

    var viewController: GistListViewController? { get set }

    func openGistDetailView(_ gistId: String)
    func openCameraView()
}
