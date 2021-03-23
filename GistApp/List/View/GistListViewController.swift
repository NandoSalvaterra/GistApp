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

    private var refreshControl: UIRefreshControl!

    private var gists: [Gist] = []

    var presenter: GistListPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter = GistListPresenter(viewController: self)
        presenter.getGists()
    }

    // MARK: -  IBActions

    @IBAction private func scanButtonPressed(_ sender: UIRoundedButton) {
        presenter.showCameraView()
    }

    @objc private func refreshControlDidChange(_ sender: UIRefreshControl) {
        presenter.getGists()
    }

    // MARK: - Private API

    private func setupView() {
        tableView.register(UINib(nibName: "GistTableViewCell", bundle: nil), forCellReuseIdentifier: "gistTableViewCell")
        tableView.tableFooterView = UIView()
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = #colorLiteral(red: 0.6039215686, green: 0.5843137255, blue: 0.6980392157, alpha: 1)
        refreshControl?.addTarget(self, action: #selector(refreshControlDidChange(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
}

// MARK: - GistListView
extension GistListViewController: GistListView {

    func showLoadingView() {
        if refreshControl.isRefreshing { return }
    }

    func hideLoadingView() {
        refreshControl.endRefreshing()
    }

    func showGists(_ gists: [Gist]) {
        self.gists = gists
        tableView.reloadData()
    }

    func showEmptyView() {

    }

    func showErrorView(message: String) {

    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension GistListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "gistTableViewCell", for: indexPath) as? GistTableViewCell else { return UITableViewCell() }
        cell.bind(gist: gists[indexPath.row])
        return cell
    }
}
