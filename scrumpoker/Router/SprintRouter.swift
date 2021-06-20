//
//  SprintRouter.swift
//  scrumpoker
//
//  Created by Gabriel Lucas Santos on 20/06/21.
//

import UIKit

class SprintRouter {
    let view = SprintsViewController(nibName: "SprintsViewController", bundle: Bundle.main)
    let interactor = SprintInteractor()
    let presenter = SprintPresenter()
    
    init() {
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
    }
    
    func present(on window: UIWindow) {
        window.rootViewController = view
    }
}
