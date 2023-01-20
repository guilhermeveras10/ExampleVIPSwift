//
//  HttpRepository.swift
//  ExampleVIP
//
//  Created by Guilherme Duarte on 19/01/23.
//

import Foundation
import Alamofire

class HttpRepositoryHome: NSObject {
    static let shared: HttpRepositoryHome = HttpRepositoryHome()
    func getCatsList(completionHandler: @escaping (Swift.Result<Cats.Model.Response, ErrorHttp>) -> ()) {
        let headers: HTTPHeaders = [
            "Authorization": "Client-ID f7d0b41cdaa41a9",
            "Content-type": "application/json"
        ]
        Alamofire.request("https://api.imgur.com/3/gallery/search/?q=cats", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            guard let data = response.data else {
                completionHandler(.failure(ErrorHttp(code: 204)))
                return
            }
            do {
                let response = try JSONDecoder().decode(Cats.Model.Response.self, from: data)
                completionHandler(.success(response))
            } catch {
                completionHandler(.failure(ErrorHttp(code: 500)))
            }
            return
        }
    }
}
// MARK: - ErrorHttp
struct ErrorHttp: Codable, Error {
    let code: Int
    init(code: Int) {
        self.code = code
    }
}
