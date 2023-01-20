//
//  CatsRouter.swift
//  ExampleVIP
//
//  Created by Guilherme Duarte on 19/01/23.
//

import UIKit

@objc protocol CatsRoutingLogic {
    func routeToSomewhere()
}

protocol CatsDataPassing {
    var dataStore: CatsDataStore? { get }
}

final class CatsRouter: NSObject, CatsRoutingLogic, CatsDataPassing {
    
    // MARK: - Archtecture Objects
    
    weak var viewController: CatsViewController?
    var dataStore: CatsDataStore?
    
    // MARK: - Routing Logic
    
    func routeToSomewhere() {
        //let nextController = NextViewController()
        //var destinationDS = nextController.router?.dataStore
        //passDataToSomewhere(source: dataStore, destination: &destinationDS)
        //viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: - Passing data
    
    //func passDataToSomewhere(source: CatsDataStore, destination: inout SomewhereDataStore) {
        //destination.name = source.name
    //}
}
