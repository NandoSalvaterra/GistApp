//
//  GistDetailContract.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

protocol GistDetailView: class {

    var presenter: GistDetailPresentation! { get set }

    func showLoadingView()
    func hideLoadingView()
    func showGist(_ gist: Gist)
    func showComments(_ comments: [Comment])
    func showEmptyView()
    func showErrorView(message: String)
}

protocol GistDetailPresentation: class {

    var view: GistDetailView? { get set }
    var interactor: GistDetailInteractorInput! { get set }
    var router: GistDetailWireframe! { get set }

    func getGistDetail(gistId: String)
    func getComments(gistId: String)
}

protocol GistDetailInteractorInput: class {

    var output: GistDetailInteractorOutput? { get set }

    func fetchGistDetail(gistId: String)
    func fetchComments(gistId: String)
}

protocol GistDetailInteractorOutput: class {

    func gistDetailDidLoad(_ gist: Gist)
    func commentsDidLoad(_ comments: [Comment])
    func onErrorLoadingGist(message: String)
    func onErrorLoadingComments(message: String)
}

protocol GistDetailWireframe: class {

    var viewController: GistDetailViewController? { get set }
}
