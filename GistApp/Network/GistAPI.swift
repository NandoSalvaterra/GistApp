//
//  GistAPI.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 22/03/21.
//

import Foundation

class GistAPI {

    func getPublicGists(completion: @escaping ([Gist]?, String?) -> Void) {
        guard let url = URL(string: "https://api.github.com/gists/public") else {
            completion(nil, "invalid_url".localized)
            return
        }

        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(nil, "invalid_data".localized)
                return
            }
            do {
            let decodedResponse = try JSONDecoder().decode([Gist].self, from: data)
            } catch let error {
                completion(nil, "invalid_data".localized)
            }

        }.resume()
    }
    
}
