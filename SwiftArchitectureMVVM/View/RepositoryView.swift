//
//  RepositoryView.swift
//  SwiftUIArchitectureMVC
//
//  Created by Narumichi Kubo on 2022/03/05.
//

import SwiftUI

struct RepositoryView: View {
    let repositoryUrlString: String
    @StateObject var viewModel: RepositoryViewModel
    
    init(
        viewModel: RepositoryViewModel = RepositoryViewModel(),
        repositoryUrlString: String
    ){
        _viewModel = StateObject(wrappedValue: viewModel)
        self.repositoryUrlString = repositoryUrlString
    }
    
    var body: some View {
        if let error = viewModel.error {
            Text(error.localizedDescription)
        } else {
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(x: 3, y: 3, anchor: .center)
                    .onAppear {
                        viewModel.loadStart(url: repositoryUrlString)
                    }
            } else {
                if viewModel.repositories.isEmpty {
                    Text("No Repository")
                } else {
                    List(viewModel.repositories) { repository in
                        RepositoryCard(repository: repository)
                    }
                }
            }
        }
    }
}


struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(repositoryUrlString: "https://api.github.com/users/narumichi0710/repos")
    }
}
