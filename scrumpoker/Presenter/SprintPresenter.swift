//
//  SprintPresenter.swift
//  scrumpoker
//
//  Created by Gabriel Lucas Santos on 20/06/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxSwiftExt


protocol SprintPresenterToView: AnyObject {
    var sprints: BehaviorRelay<[Sprint]?> {get}
    var sprint: BehaviorRelay<Sprint?> {get}
    func getAllSprints()
    func getSprint(by id: Int)
}

class SprintPresenter {
    weak var view: SprintsViewControllerToPresenter?
    
    var interactor: SprintInteractorInputToPresenter?
    
    private let dipose = DisposeBag()
    
    var sprint = BehaviorRelay<Sprint?>(value: nil)
    var sprints = BehaviorRelay<[Sprint]?>(value: nil)
}

extension SprintPresenter: SprintPresenterToView {
    func getAllSprints() {
        view?.setLoading(true)
        interactor?.getAll()
    }
    
    func getSprint(by id: Int) {
        view?.setLoading(true)
        interactor?.getOnly(by: id)
    }
}

extension SprintPresenter : SprintInteractorOutputToPresenter {
    func list(sprints: [Sprint]) {
        view?.setLoading(false)
        self.sprints.accept(sprints)
    }
    
    func show(sprint: Sprint) {
        view?.setLoading(false)
        self.sprint.accept(sprint)
    }
    
    func errorOccured(error: Error) {
        view?.setLoading(false)
        debugPrint(error ?? "Deu erro")
    }
    
    
}
