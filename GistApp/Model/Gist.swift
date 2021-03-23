//
//  Gist.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import Foundation

class Gist: Codable {

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
//    var created: Date?
//    var updated: Date?
//    var files: Any? // TODO: change here
//    var user: Any? // TODO: change here
    var owner: Owner? // TODO: change here
//    var forks: [Any]? // TODO: change here
//    var history: [Any]? // TODO: change here
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
//        case created = "created_at"
//        case updated = "updated_at"
//        case files = "files"
//        case user = "user"
        case owner = "owner"
//        case forks = "forks"
//        case history = "history"
        case isPublic = "public"
        case isTruncated = "truncated"
        case commentCount = "commentCount"
    }
}
