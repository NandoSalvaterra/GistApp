//
//  GistListViewController.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import UIKit

class GistListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var scanButton: UIRoundedButton!

    private var gists: [Gist] = []

    var presenter: GistListPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter = GistListPresenter(viewController: self)
    }

    // MARK: -  IBActions

    @IBAction func scanButtonPressed(_ sender: UIRoundedButton) {
    }


    // MARK: - Private API

    private func setupView() {
        tableView.register(UINib(nibName: "GistTableViewCell", bundle: nil), forCellReuseIdentifier: "gistTableViewCell")
    }
}

// MARK: - GistListView
extension GistListViewController: GistListView {

    func showLoadingView() {

    }

    func hideLoadingView() {

    }

    func showGists(_ gists: [Gist]) {

    }

    func showEmptyView() {

    }

    func showErrorView(message: String) {

    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension GistListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "gistTableViewCell", for: indexPath) as? GistTableViewCell else { return UITableViewCell() }
        //cell.bind(trackable: trackable)
        return cell
    }
}
