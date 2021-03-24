//
//  CommentInteractor.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

class CommentInteractor: CommentInteractorInput {

    weak var output: CommentInteractorOutput?

    init(output: CommentInteractorOutput) {
        self.output = output
    }

    func comment(gistId: String, text: String) {
        GistAPI.shared.comment(gistId: gistId, text: text) { (comment, errorMessage) in
            if let commentMade = comment {
                self.output?.commentDidLoad(commentMade)
            } else {
                self.output?.onErrorLoadingComment(message: errorMessage ?? "error_default".localized)
            }
        }
    }
}
