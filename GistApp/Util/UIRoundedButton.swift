//
//  UIRoundedButton.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import UIKit

@IBDesignable class UIRoundedButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderColorFromUIColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        configureRoundedButton()
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureRoundedButton()
    }

    func configureRoundedButton() {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColorFromUIColor!.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = true
    }
}
