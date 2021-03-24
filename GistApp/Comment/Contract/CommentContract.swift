//
//  CommentContract.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

protocol CommentView: class {

    var presenter: CommentPresentation! { get set }

    func showLoadingView()
    func hideLoadingView()
    func showComment(_ comment: Comment)
    func showErrorView(message: String)
}

protocol CommentPresentation: class {

    var view: CommentView? { get set }
    var interactor: CommentInteractorInput! { get set }
    var router: CommentWireframe! { get set }

    func comment(gistId: String, text: String)
}

protocol CommentInteractorInput: class {

    var output: CommentInteractorOutput? { get set }

    func comment(gistId: String, text: String)
}

protocol CommentInteractorOutput: class {

    func commentDidLoad(_ comment: Comment)
    func onErrorLoadingComment(message: String)
}

protocol CommentWireframe: class {

    var viewController: CommentViewController? { get set }
}

