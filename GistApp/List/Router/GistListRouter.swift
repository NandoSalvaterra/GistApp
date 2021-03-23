//
//  GistListRouter.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import Foundation

class GistListRouter: GistListWireframe {

    weak var viewController: GistListViewController?

    init(viewController: GistListViewController) {
        self.viewController = viewController
    }

    func openGistDetailView(_ gist: Gist) {

    }

    func openCameraView() {
        let cameraViewController = CameraViewController()
        viewController?.present(cameraViewController, animated: true, completion: nil)
    }
}
