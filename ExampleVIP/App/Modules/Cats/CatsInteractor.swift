//
//  CatsInteractor.swift
//  ExampleVIP
//
//  Created by Guilherme Duarte on 19/01/23.
//

import UIKit

protocol CatsBusinessLogic {
    func loadScreenValues()
}

protocol CatsDataStore {
    // var name: String { get set }
}

final class CatsInteractor: CatsBusinessLogic, CatsDataStore {
    
    // MARK: - Archtecture Objects
    
    var presenter: CatsPresentationLogic?
    let worker: CatsWorkerLogic
    
    // MARK: - DataStore Objects
    
    // var name: String = ""
    
    // MARK: - Interactor Lifecycle
    
    init(worker: CatsWorkerLogic = CatsWorker()) {
        self.worker = worker
    }
    
    // MARK: - Business Logic
    
    func loadScreenValues() {
        worker.getCatsList { result in
            switch result {
            case .success(let cats):
                self.presenter?.presentScreenValues(response: cats)
            case .failure(let error):
                self.presenter?.presentScreenValuesError(code: error.code)
            }
        }
    }
}
