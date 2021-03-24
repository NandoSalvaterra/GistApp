//
//  AppDelegate.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = setupNavigationController(rootViewController: GistListViewController())
        window?.makeKeyAndVisible()
        return true
    }

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

