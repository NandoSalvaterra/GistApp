//
//  GistDetailRouter.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

class GistDetailRouter: GistDetailWireframe {

    weak var viewController: GistDetailViewController?

    init(viewController: GistDetailViewController) {
        self.viewController = viewController
    }

}
