//
//  SprintService.swift
//  scrumpoker
//
//  Created by Gabriel Lucas Santos on 20/06/21.
//

import Foundation
import RxSwift
import RxAlamofire

struct SprintService {
    static let kBaseURL: String = "https://scrum-deck-backend.herokuapp.com/sprint"

    static func get(by id: Int) -> Observable<Sprint> {
        return RxAlamofire
            .requestDecodable(.get, "\(kBaseURL)/\(id)")
            .map { (response, sprint: Sprint) in
                return sprint
            }
    }
    
    static func getAll() -> Observable<[Sprint]> {
        return RxAlamofire
            .requestDecodable(.get, "\(kBaseURL)")
            .map { (response, sprints: [Sprint]) in
                return sprints
            }
    }
    
    static func delete(by id: Int) -> Observable<String> {
        return RxAlamofire
            .requestDecodable(.delete, "\(kBaseURL)/\(id)")
            .map { (response, result: String) in
                return result
            }
    }
    
}

