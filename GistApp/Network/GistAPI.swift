//
//  GistAPI.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import Foundation

class GistAPI {

    static let shared = GistAPI()

    private var baseURL: String { return  Bundle.main.infoDictionary?["API URL"] as! String }
    var token: String = ""

    private init () { }

    func getGists(completion: @escaping ([Gist]?, String?) -> Void) {
        guard let url = URL(string: "\(baseURL)") else {
            completion(nil, "invalid_url".localized)
            return
        }
        var request = URLRequest(url: url)
        request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil, "invalid_data".localized)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.gistDateFormat)
                    let decodedGists = try decoder.decode([Gist].self, from: data)
                    completion(decodedGists, nil)
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            }
        }.resume()
    }

    func getGistDetail(gistId: String, completion: @escaping (Gist?, String?) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(gistId)") else {
            completion(nil, "invalid_url".localized)
            return
        }
        var request = URLRequest(url: url)
        request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil, "invalid_data".localized)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.gistDateFormat)
                    let decodedGist = try decoder.decode(Gist.self, from: data)
                    completion(decodedGist, nil)
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            }
        }.resume()
    }

    func getComments(gistId: String, completion: @escaping ([Comment]?, String?) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(gistId)/comments") else {
            completion(nil, "invalid_url".localized)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil, "invalid_data".localized)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.gistDateFormat)
                    let decodedComments = try decoder.decode([Comment].self, from: data)
                    completion(decodedComments, nil)
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            }
        }.resume()
    }

    func comment(gistId: String, text: String, completion: @escaping (Comment?, String?) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(gistId)/comments") else {
            completion(nil, "invalid_url".localized)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        let json: [String: String] = ["body": text]
        let jsonData = try! JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil, "invalid_data".localized)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.gistDateFormat)
                    let decodedComment = try decoder.decode(Comment.self, from: data)
                    completion(decodedComment, nil)
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            }
        }.resume()
    }
}
