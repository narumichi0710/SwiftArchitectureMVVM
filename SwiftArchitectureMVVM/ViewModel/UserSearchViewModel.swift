//
//  UserController.swift
//  SwiftUIArchitectureMVC
//
//  Created by Narumichi Kubo on 2022/03/06.
//

import Combine

class UserSearchViewModel : ObservableObject {
    
    @Published var searchText: String
    @Published var users: [User]
    @Published var isNotFound: Bool
    @Published var error: ModelError?

    init(
        searchText: String = "",
        users: [User] = [User](),
        isNotFound: Bool = false,
        error: ModelError? = nil
    ){
        self.searchText = searchText
        self.users = users
        self.isNotFound = isNotFound
        self.error = error
    }

    
    public func loadStart() {
        model.fetchUser(query: searchText)
    }
}
