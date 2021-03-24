//
//  User.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

class User: Decodable {

    var id: Int?
    var name: String?
    var avatarURL: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "login"
        case avatarURL = "avatar_url"
    }
}
