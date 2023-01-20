//
//  CatsViewController.swift
//  ExampleVIP
//
//  Created by Guilherme Duarte on 19/01/23.
//

import UIKit

protocol CatsDisplayLogic: AnyObject {
    func displayScreenValues(viewModel: Cats.Model.ViewModel)
    func presentScreenValuesError(code: Int)
}

final class CatsViewController: UIViewController, CatsDisplayLogic {
    
    // MARK: - Archtecture Objects
    
    var interactor: CatsBusinessLogic?
    var router: (NSObjectProtocol & CatsRoutingLogic & CatsDataPassing)?
    
    // MARK: - ViewController Lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        addComponentsConstraints()
        loadScreenValues()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = CatsInteractor()
        let presenter = CatsPresenter()
        let router = CatsRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - Private Functions
    
    private func loadScreenValues() {
        interactor?.loadScreenValues()
    }
    
    // MARK: - Layout Functions
    
    private func addComponents() {}
    
    private func addComponentsConstraints() {}
    
    // MARK: - Display Logic
    
    func displayScreenValues(viewModel: Cats.Model.ViewModel) {
        print(viewModel.title)
    }
    
    func presentScreenValuesError(code: Int) {
        
    }
}
