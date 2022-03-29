//
//  ContentView.swift
//  SwiftUIArchitectureMVC
//
//  Created by Narumichi Kubo on 2022/03/04.
//

import SwiftUI

struct SearchMainView: View {
    @StateObject var viewModel: UserSearchViewModel
    
    init(viewModel: UserSearchViewModel = UserSearchViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(
                    "Search User Name",
                    text: self.$viewModel.searchText
                )
                    .onChange(
                        of: viewModel.searchText,
                        perform: { newValue in
                            viewModel.loadStart()
                        }
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.asciiCapable)
                    .padding()
                
                Spacer()
                
                if let error = viewModel.error {
                    Text(error.localizedDescription)
                } else {
                    List(viewModel.users) { user in
                        NavigationLink(
                            destination: RepositoryView(
                                repositoryUrlString: user.reposUrl
                            )
                        ) {
                            UserCard(user: user)
                        }
                    }
                    .refreshable {
                        viewModel.loadStart()
                    }
                }
            }
            .navigationTitle("🔍Search Github User")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
