//
//  GistTableViewCell.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import UIKit

class GistTableViewCell: UITableViewCell {

    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var stateView: UIView!
    @IBOutlet private weak var stateImageView: UIImageView!
    @IBOutlet private weak var commentView: UIView!
    @IBOutlet private weak var commentCountLabel: UILabel!
    @IBOutlet private weak var lastUpdateLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        userImageView.image = nil
        userNameLabel.text = nil
        descriptionLabel.text = nil
        stateImageView.image = nil
        commentCountLabel.text = nil
        lastUpdateLabel.text = nil
    }

    func bind(gist: Gist) {
        userImageView.load(url: URL(string: gist.owner?.avatarURL ?? "")!)
        userNameLabel.text = gist.owner?.name
        descriptionLabel.text = (gist.gistDescription?.isEmpty ?? true) ? "no_description".localized : gist.gistDescription
        stateImageView.image = (gist.isPublic ?? false) ? #imageLiteral(resourceName: "icon_public") : #imageLiteral(resourceName: "icon_private")
        commentCountLabel.textColor = (gist.isPublic ?? false) ? #colorLiteral(red: 0.07058823529, green: 0.6980392157, blue: 0.5215686275, alpha: 1) : #colorLiteral(red: 0.9568627451, green: 0.4235294118, blue: 0.4235294118, alpha: 1)
        commentCountLabel.text = "\(gist.commentCount ?? 0) \("comments".localized)"
        lastUpdateLabel.text = gist.updated?.readableText
    }
}
