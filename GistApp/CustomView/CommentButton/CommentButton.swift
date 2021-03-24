//
//  CommentButton.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 03/02/20.
//

import UIKit

class CommentButton: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var button: LoadingButton!
    
    weak var delegate: CommentButtonViewDelegate?
    private var isButtonEnable: Bool = true
    
    convenience init(frame: CGRect, delegate: CommentButtonViewDelegate) {
        self.init(frame: frame)
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if !isButtonEnable { return }
        delegate?.commentButtonPressed()
    }
    
    private func initialize() {
        Bundle.main.loadNibNamed("CommentButton", owner: self, options: nil)
        addSubview(contentView)
        self.backgroundColor = .clear
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        button.setTitle("comment".localized, for: .normal)
        disableCommentButton()
    }
    
    func disableCommentButton() {
        isButtonEnable = false
        button.alpha = 0.1
    }
    
    func enableComentButton() {
        isButtonEnable = true
        button.alpha = 1
    }
    
    func showLoading() {
        button.loading(true, title: "comment".localized)
    }
    
    func hideLoading() {
        button.loading(false, title: "comment".localized)
    }
}

protocol CommentButtonViewDelegate: class {
    
    func commentButtonPressed()
}
