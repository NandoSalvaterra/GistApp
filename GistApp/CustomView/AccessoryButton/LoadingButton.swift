//
//  LoadingButton.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 17/02/20.
//

import UIKit

class LoadingButton: UIRoundedButton {

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .medium
        indicator.color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()

    func loading(_ loading: Bool, title: String, activityIndicatorStyle: UIActivityIndicatorView.Style = .medium) {
        var text = title
        activityIndicator.style = activityIndicatorStyle
        DispatchQueue.main.async(execute: {
            self.activityIndicator.stopAnimating()
        })
        if loading == true {
            text = ""
            addActivityIndicatorSubview()
        }
        isEnabled = !loading
        setTitle(text, for: .normal)
    }

    private func addActivityIndicatorSubview() {
        addSubview(activityIndicator)
        addIndicatorConstraints()
        DispatchQueue.main.async(execute: {
            self.activityIndicator.startAnimating()
        })
    }
    
    private func addIndicatorConstraints() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        addConstraint(xCenterConstraint)

        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        addConstraint(yCenterConstraint)
    }
}


