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
}
