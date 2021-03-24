//
//  AccessoryButton.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 03/02/20.
//

import UIKit

class AccessoryButton: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private  weak var button: LoadingButton!
    
    weak var delegate: AccessoryButtonViewDelegate?
    private var isButtonEnable: Bool = true

    convenience init(frame: CGRect, delegate: AccessoryButtonViewDelegate) {
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
        delegate?.acessoryButtonPressed()
    }
    
    private func initialize() {
        Bundle.main.loadNibNamed("AccessoryButton", owner: self, options: nil)
        addSubview(contentView)
        self.backgroundColor = .clear
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        disableCommentButton()
    }

    func setTitle(_ title: String) {
        button.setTitle(title, for: .normal)
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
        button.loading(true, title: button.titleLabel?.text ?? "")
    }
    
    func hideLoading() {
        button.loading(false, title:  button.titleLabel?.text ?? "")
    }
}

protocol AccessoryButtonViewDelegate: class {
    
    func acessoryButtonPressed()
}
