//
//  GistListInteractor.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import Foundation

class GistListInteractor: GistListInteractorInput {

    weak var output: GistListInteractorOutput?

    init(output: GistListInteractorOutput) {
        self.output = output
    }

    func fetchGists() {
        GistAPI.shared.getGists { (gists, errorMessage) in
            if let gistList = gists {
                self.output?.gistsDidLoad(gistList)
            } else {
                self.output?.onErrorLoadingGists(message: errorMessage ?? "error_default".localized)
            }
        }
    }
}
