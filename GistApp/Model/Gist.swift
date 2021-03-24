//
//  Gist.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import Foundation

class Gist: Decodable {

    var id: String?
    var nodeId: String?
    var gistDescription: String?
    var url: String?
    var forksURL: String?
    var commitsURL: String?
    var pullURL: String?
    var pushURL: String?
    var htmlURL: String?
    var commentsURL: String?
    var created: Date?
    var updated: Date?
    var owner: User?
    var isPublic: Bool?
    var isTruncated: Bool?
    var commentCount: Int?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeId = "node_id"
        case gistDescription = "description"
        case url = "url"
        case forksURL = "forks_url"
        case commitsURL = "commits_url"
        case pullURL = "git_pull_url"
        case pushURL = "git_push_url"
        case htmlURL = "html_url"
        case commentsURL = "comments_url"
        case created = "created_at"
        case updated = "updated_at"
        case owner = "owner"
        case isPublic = "public"
        case isTruncated = "truncated"
        case commentCount = "comments"
    }
}
