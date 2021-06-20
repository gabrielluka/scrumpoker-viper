//
//  SprintsViewController.swift
//  scrumpoker
//
//  Created by Gabriel Lucas Santos on 20/06/21.
//

import UIKit
import RxSwift
import RxSwiftExt

protocol SprintsViewControllerToPresenter: AnyObject {
    func setLoading(_ loadgin: Bool)
}

class SprintsViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SprintPresenterToView!
    
    fileprivate var dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildTableView()
        bind()
    }
    
    private func bind() {
        presenter?.sprints
            .observe(on: MainScheduler())
            .bind { [weak self] event in
                self?.tableView.reloadData()
            }.disposed(by: dispose)
        
        presenter?.getAllSprints()
    }
  
}

extension SprintsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.sprints.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: SprintsTableViewCell.self, for: indexPath) as SprintsTableViewCell
        
        if let sprint = presenter?.sprints.value?[indexPath.row]
        {
            cell.bind(sprint: sprint)
        }
        return cell
    }
    
    fileprivate func buildTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.registerCell(type: SprintsTableViewCell.self)
    }
}


extension SprintsViewController: SprintsViewControllerToPresenter {
    func setLoading(_ loading: Bool) {
        if loading  {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
    }
}
