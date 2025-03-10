//
//  CharacterListViewModel.swift
//  DragonBallApp
//
//  Created by fabian zarate on 03/03/2025.
//

import Foundation
@MainActor
class CharacterListViewModel: ObservableObject {
    private let getCharacterList: GetCharacterListType
    @Published var characterList: [Character] = []
    @Published var state: ViewState = .loading
    
    init(getCharacterList: GetCharacterListType) {
        self.getCharacterList = getCharacterList
    }
    
    func onAppear() {
        state = .loading
        Task {
            defer {
                state = .loaded
            }
            
            do throws(NetworkError) {
                let characters = try await getCharacterList.execute()
                self.characterList = characters
            } catch {
                state = .error(error.localizedDescription)
            }
        }
    }
}

enum ViewState {
    case loading
    case loaded
    case error(String)
}
