//
//  CatsPresenter.swift
//  ExampleVIP
//
//  Created by Guilherme Duarte on 19/01/23.
//

import UIKit

protocol CatsPresentationLogic {
    func presentScreenValues(response: Cats.Model.Response)
    func presentScreenValuesError(code: Int)
}

final class CatsPresenter: CatsPresentationLogic {
    
    // MARK: - Archtecture Objects
    
    weak var viewController: CatsDisplayLogic?
    
    // MARK: - Presentation Logic
    
    func presentScreenValues(response: Cats.Model.Response) {
        let viewModel = Cats.Model.ViewModel(title: response.data?.compactMap({$0.title}), cover: response.data?.compactMap({$0.cover}))
        viewController?.displayScreenValues(viewModel: viewModel)
    }
    
    func presentScreenValuesError(code: Int) {
        viewController?.presentScreenValuesError(code: code)
    }
}
