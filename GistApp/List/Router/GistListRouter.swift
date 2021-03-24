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

    func openGistDetailView(_ gistId: String) {
        let gistDetailViewController = GistDetailViewController()
        gistDetailViewController.gistId = gistId
        viewController?.navigationController?.pushViewController(gistDetailViewController, animated: true)
    }

    func openCameraView() {
        let cameraViewController = CameraViewController()
        cameraViewController.delegate = viewController
        viewController?.present(cameraViewController, animated: true, completion: nil)
    }
}
