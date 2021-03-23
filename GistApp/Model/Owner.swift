//
//  Owner.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

class Owner: Codable {

    var id: Int?
    var name: String?
    var avatarURL: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "login"
        case avatarURL = "avatar_url"
    }

//    "login":"mjgargani",
//    "id":46717827,
//    "node_id":"MDQ6VXNlcjQ2NzE3ODI3",
//    "avatar_url":"https://avatars.githubusercontent.com/u/46717827?v=4",
//    "gravatar_id":"",
//    "url":"https://api.github.com/users/mjgargani",
//    "html_url":"https://github.com/mjgargani",
//    "followers_url":"https://api.github.com/users/mjgargani/followers",
//    "following_url":"https://api.github.com/users/mjgargani/following{/other_user}",
//    "gists_url":"https://api.github.com/users/mjgargani/gists{/gist_id}",
//    "starred_url":"https://api.github.com/users/mjgargani/starred{/owner}{/repo}",
//    "subscriptions_url":"https://api.github.com/users/mjgargani/subscriptions",
//    "organizations_url":"https://api.github.com/users/mjgargani/orgs",
//    "repos_url":"https://api.github.com/users/mjgargani/repos",
//    "events_url":"https://api.github.com/users/mjgargani/events{/privacy}",
//    "received_events_url":"https://api.github.com/users/mjgargani/received_events",
//    "type":"User",
//    "site_admin":false
}
