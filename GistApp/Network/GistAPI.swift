//
//  GistAPI.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import Foundation

class GistAPI {

    static let shared = GistAPI()

    private init () { }

    func getPublicGists(completion: @escaping ([Gist]?, String?) -> Void) {
        guard let url = URL(string: "https://api.github.com/gists/public") else {
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
                    let decodedGists = try JSONDecoder().decode([Gist].self, from: data)
                    completion(decodedGists, nil)
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            }
        }.resume()
    }
}
