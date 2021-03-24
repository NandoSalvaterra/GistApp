//
//  UIAcessoryTextFied.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 24/03/21.
//

import UIKit

@IBDesignable class UIAccessoryTextField: UITextField {

    @IBInspectable var rightImage: UIImage? {
        didSet { updateView() }
    }

    @IBInspectable var rightPadding: CGFloat = 0

    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet { updateView() }
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x += rightPadding
        return textRect
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(paste(_:)) { return false }
        return super.canPerformAction(action, withSender: sender)
    }

    func updateView() {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        self.leftView = paddingView
        self.leftViewMode = .always
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 11, height: 6))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}
