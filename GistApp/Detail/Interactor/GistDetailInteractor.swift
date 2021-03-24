//
//  GistDetailInteractor.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

class GistDetailInteractor: GistDetailInteractorInput {

    weak var output: GistDetailInteractorOutput?

    init(output: GistDetailInteractorOutput) {
        self.output = output
    }

    func fetchGistDetail(gistId: String) {
        GistAPI.shared.getGistDetail(gistId: gistId) { (gist, errorMessage) in
            if let gistDetail = gist {
                self.output?.gistDetailDidLoad(gistDetail)
            } else {
                self.output?.onErrorLoadingGist(message: errorMessage ?? "error_default".localized)
            }
        }
    }

    func fetchComments(gistId: String) {
        GistAPI.shared.getComments(gistId: gistId) { (comments, errorMessage) in
            if let commentList = comments {
                self.output?.commentsDidLoad(commentList)
            } else {
                self.output?.onErrorLoadingComments(message: errorMessage ?? "error_default".localized)
            }
        }
    }
}
