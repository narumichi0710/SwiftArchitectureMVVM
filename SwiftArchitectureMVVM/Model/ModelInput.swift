//
//  ModelInput.swift
//  SwiftArchitectureMVVM
//
//  Created by Narumichi Kubo on 2022/03/30.
//

import Foundation

protocol ModelInput {
    func fetchUser(
        query: String,
        completion: @escaping (Result<[User], ModelError>) -> Void
    )
}
