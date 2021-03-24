//
//  CommentViewController.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import UIKit

class CommentViewController: UIViewController {
    
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var commentTextField: UITextField!
    
    var gist: Gist!
    var presenter: CommentPresentation!

    weak var delegate: CommentViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter = CommentPresenter(viewController: self)
    }
    
    // MARK: - IBActions
    
    @IBAction private func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private API
    
    private func setupView() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        descriptionLabel.text = "\("comment_on".localized)\(gist.owner?.name ?? "anonymous_gist".localized)"
        commentTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        commentTextField.inputAccessoryView = CommentButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 80), delegate: self)
        commentTextField.becomeFirstResponder()
    }
}

// MARK: - CommentView
extension CommentViewController: CommentView {
    
    func showLoadingView() {
        (commentTextField.inputAccessoryView as? CommentButton)?.showLoading()
    }
    
    func hideLoadingView() {
        (commentTextField.inputAccessoryView as? CommentButton)?.hideLoading()
    }
    
    func showComment(_ comment: Comment) {
        delegate?.commentDidLoad(comment)
        self.dismiss(animated: true, completion: nil)
    }
    
    func showErrorView(message: String) {
        
    }
}

// MARK: - UITextFieldDelegate
extension CommentViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            (commentTextField.inputAccessoryView as? CommentButton)?.disableCommentButton()
        } else {
            (commentTextField.inputAccessoryView as? CommentButton)?.enableComentButton()
        }
    }
}


//MARK: - CommentButtonViewDelegate
extension CommentViewController: CommentButtonViewDelegate {
    
    func commentButtonPressed() {
        presenter.comment(gistId: gist.id  ?? "", text: commentTextField.text ?? "")
    }
}

protocol CommentViewDelegate: class {

    func commentDidLoad(_ comment: Comment)
}
