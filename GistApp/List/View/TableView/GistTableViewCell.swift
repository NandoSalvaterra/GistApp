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
    }

    func bind(gist: Gist) {
        userImageView.load(url: URL(string: gist.owner?.avatarURL ?? "")!)
        userNameLabel.text = gist.owner?.name
        descriptionLabel.text = gist.gistDescription
        stateView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        stateImageView.image = (gist.isPublic ?? false) ? #imageLiteral(resourceName: "icon_public") : #imageLiteral(resourceName: "icon_private")
        commentCountLabel.text = "123 Comentários"
    }
}
