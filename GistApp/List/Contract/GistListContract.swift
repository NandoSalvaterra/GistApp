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

//    func getReferencePoints()
//    func showReferencePointDetailView(_ referencePoint: ReferencePoint)
//    func showSelectAddressView(viewMode: SelectAddressViewMode)
}

protocol GistListInteractorInput: class {

    var output: GistListInteractorOutput? { get set }

}

protocol GistListInteractorOutput: class {

//    func referencePointsDidLoad(_ referencePoints: [ReferencePoint])
//    func onErrorLoadingReferencePoints(message: String)
}

protocol GistListWireframe: class {

    var viewController: GistListViewController? { get set }

//    func openReferencePointDetailView(_ referencePoint: ReferencePoint)
//    func openSelectAddressView(viewMode: SelectAddressViewMode)
}
