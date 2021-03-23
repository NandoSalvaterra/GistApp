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
}
