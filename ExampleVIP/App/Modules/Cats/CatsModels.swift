//
//  CatsModels.swift
//  ExampleVIP
//
//  Created by Guilherme Duarte on 19/01/23.
//

import UIKit

enum Cats {
    enum Model {
        struct Request {
            let clientId: String
        }
        struct Response: Codable {
            let data: [ImgUrlData]?
        }
        struct ImgUrlData: Codable {
            let title: String?
            let cover: String?
        }
        struct ViewModel {
            let title: [String]?
            let cover: [String]?
        }
    }
}
