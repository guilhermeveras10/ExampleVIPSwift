//
//  CatsWorker.swift
//  ExampleVIP
//
//  Created by Guilherme Duarte on 19/01/23.
//

import UIKit

protocol CatsWorkerLogic {
    func getCatsList(completionHandler: @escaping (Swift.Result<Cats.Model.Response, ErrorHttp>) -> ())
}

final class CatsWorker: CatsWorkerLogic {
    func getCatsList(completionHandler: @escaping (Result<Cats.Model.Response, ErrorHttp>) -> ()) {
        HttpRepositoryHome.shared.getCatsList { result in
            switch result {
            case .success(let cats):
                completionHandler(.success(cats))
            case .failure(let errorCode):
                completionHandler(.failure(errorCode))
            }
        }
    }
}
