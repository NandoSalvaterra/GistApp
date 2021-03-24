//
//  Comment.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

class Comment: Decodable {

    var id: Int?
    var user: User?
    var text: String?
    var created: Date?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case user = "user"
        case text = "body"
        case created = "created_at"
    }
}
