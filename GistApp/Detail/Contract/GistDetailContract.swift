//
//  GistDetailContract.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

protocol GistDetailView: class {

    var presenter: GistDetailPresentation! { get set }
}

protocol GistDetailPresentation: class {

    var view: GistDetailView? { get set }
    var interactor: GistDetailInteractorInput! { get set }
    var router: GistDetailWireframe! { get set }
}

protocol GistDetailInteractorInput: class {

    var output: GistDetailInteractorOutput? { get set }
}

protocol GistDetailInteractorOutput: class {

}

protocol GistDetailWireframe: class {

    var viewController: GistDetailViewController? { get set }
}
