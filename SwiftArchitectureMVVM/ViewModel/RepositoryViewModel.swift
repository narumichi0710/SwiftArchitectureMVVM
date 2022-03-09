//
//  RepositoryController.swift
//  SwiftUIArchitectureMVC
//
//  Created by Narumichi Kubo on 2022/03/06.
//

import Combine

class RepositoryViewModel: ObservableObject {

    @Published var repositories: [Repository]
    @Published var isLoading: Bool
    @Published var error: ModelError?

    init(
        repositories: [Repository] = [Repository](),
        isLoading: Bool = false,
        error: ModelError? = nil
    ){
        self.repositories = repositories
        self.isLoading = isLoading
        self.error = error
    }
    public func loadStart(url: String) {
        model.fetchRepositories(urlString: url)
    }

}
