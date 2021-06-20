//
//  SprintInterector.swift
//  scrumpoker
//
//  Created by Gabriel Lucas Santos on 20/06/21.
//

import Foundation
import RxSwift


protocol SprintInteractorOutputToPresenter: AnyObject {
    func list(sprints: [Sprint])
    func show(sprint: Sprint)
    func errorOccured(error: Error)
}

protocol SprintInteractorInputToPresenter: AnyObject {
    func getAll()
    func getOnly(by id: Int)
}

class SprintInteractor {
    weak var output: SprintInteractorOutputToPresenter?
    private let dispose = DisposeBag()
}

extension SprintInteractor : SprintInteractorInputToPresenter {
    func getOnly(by id: Int) {
        SprintService.get(by: id).subscribe { [weak self] event in
            if let sprint = event.element {
                self?.output?.show(sprint: sprint)
            }
            if let error = event.error {
                self?.output?.errorOccured(error: error)
            }
        }.disposed(by: dispose)
    }
    
    func getAll() {
        SprintService.getAll().subscribe { [weak self] event in
            if let sprint = event.element {
                self?.output?.list(sprints: sprint)
            }
            if let error = event.error {
                self?.output?.errorOccured(error: error)
            }
        }.disposed(by: dispose)
    }
}
