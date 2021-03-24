//
//  CommentRouter.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

class CommentRouter: CommentWireframe {

    weak var viewController: CommentViewController?

    init(viewController: CommentViewController) {
        self.viewController = viewController
    }
}
