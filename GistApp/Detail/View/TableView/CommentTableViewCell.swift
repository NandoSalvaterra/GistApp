//
//  CommentTableViewCell.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var commentTextLabel: UILabel!
    @IBOutlet private weak var createdLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        userNameLabel.text = nil
        userImageView.image = nil
        commentTextLabel.text = nil
        createdLabel.text = nil
    }

    func bind(comment: Comment) {
        userImageView.load(url: URL(string: comment.user?.avatarURL ?? "")!)
        userNameLabel.text = comment.user?.name
        commentTextLabel.text = comment.text
        createdLabel.text = comment.created?.readableText
    }
}
