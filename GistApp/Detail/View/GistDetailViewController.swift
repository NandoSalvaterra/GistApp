//
//  GistDetailViewController.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import UIKit

class GistDetailViewController: UIViewController {

    var presenter: GistDetailPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter = GistDetailPresenter(viewController: self)
    }

    // MARK: - Private API

    private func setupView() {

    }
}

// MARK: - GistDetailView
extension GistDetailViewController: GistDetailView {

}
