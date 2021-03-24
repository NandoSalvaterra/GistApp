//
//  LoginRouter.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 24/03/21.
//

import UIKit

class LoginRouter: LoginWireframe {
    
    weak var viewController: LoginViewController?
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }

    func openGistListView() {
        let gistListViewController = setupNavigationController(rootViewController: GistListViewController())
        gistListViewController.modalPresentationStyle = .fullScreen
        viewController?.present(gistListViewController, animated: true, completion: nil)

    }

    // MARK: - Private API

    private func setupNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2235294118, green: 0.2078431373, blue: 0.2901960784, alpha: 1),
             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21, weight: .regular)]
        navigationController.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.topItem?.title = ""
        navigationController.navigationBar.tintColor = #colorLiteral(red: 0.2235294118, green: 0.2078431373, blue: 0.2901960784, alpha: 1)
        navigationController.navigationBar.layoutIfNeeded()
        return navigationController
    }
}
