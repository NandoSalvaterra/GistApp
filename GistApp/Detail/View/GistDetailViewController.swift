//
//  GistDetailViewController.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import UIKit

class GistDetailViewController: UIViewController {
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var stateView: UIView!
    @IBOutlet private weak var stateImageView: UIImageView!
    @IBOutlet private weak var commentView: UIView!
    @IBOutlet private weak var commentCountLabel: UILabel!
    @IBOutlet private weak var lastUpdateLabel: UILabel!
    @IBOutlet private weak var commitChangesLabel: UILabel!
    @IBOutlet private weak var commitDateLabel: UILabel!
    @IBOutlet private weak var filesCountLabel: UILabel!
    @IBOutlet private weak var filesLabel: UILabel!
    @IBOutlet private weak var forksCountLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var commentsTableView: UITableView!
    @IBOutlet private weak var commentButton: UIRoundedButton!
    
    private lazy var loadingView = LoadingView(frame: view.frame)
    
    var gistId: String!
    var gist: Gist!
    var comments: [Comment] = []
    var presenter: GistDetailPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter = GistDetailPresenter(viewController: self)
        presenter.getGistDetail(gistId: gistId)
        presenter.getComments(gistId: gistId)
    }
    
    // MARK: - IBActions
    
    @IBAction private func commentButtonPressed(_ sender: UIRoundedButton) {
        presenter.showCommentView(gist: gist)
    }
    
    // MARK: - Private API
    
    private func setupView() {
        title = "details".localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        commentsTableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "commentTableViewCell")
        commentsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        commentsTableView.tableFooterView = UIView()
    }
}

// MARK: - GistDetailView
extension GistDetailViewController: GistDetailView {
    
    func showLoadingView() {
        view.addSubview(loadingView)
    }
    
    func hideLoadingView() {
        loadingView.removeFromSuperview()
    }
    
    func showGist(_ gist: Gist) {
        self.gist = gist
        userImageView.load(url: URL(string: gist.owner?.avatarURL ?? "")!)
        userNameLabel.text = gist.owner?.name
        descriptionLabel.text = (gist.gistDescription?.isEmpty ?? true) ? "no_description".localized : gist.gistDescription
        stateImageView.image = (gist.isPublic ?? false) ? #imageLiteral(resourceName: "icon_public") : #imageLiteral(resourceName: "icon_private")
        commentCountLabel.textColor = (gist.isPublic ?? false) ? #colorLiteral(red: 0.07058823529, green: 0.6980392157, blue: 0.5215686275, alpha: 1) : #colorLiteral(red: 0.9568627451, green: 0.4235294118, blue: 0.4235294118, alpha: 1)
        commentCountLabel.text = "\(gist.commentCount ?? 0) \("comments".localized)"
        lastUpdateLabel.text = gist.updated?.readableText
    }
    
    func showComments(_ comments: [Comment]) {
        self.comments = comments
        commentsTableView.reloadData()
    }
    
    func showEmptyView() {
        
    }
    
    func showErrorView(message: String) {
        
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension GistDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentTableViewCell", for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
        cell.bind(comment: comments[indexPath.row])
        return cell
    }
}


// MARK: - CommentViewDelegate
extension GistDetailViewController: CommentViewDelegate {

    func commentDidLoad(_ comment: Comment) {
        self.comments.insert(comment, at: 0)
        commentsTableView.reloadData()
        commentsTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
}
