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
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(getCharacterList: GetCharacterListType) {
        self.getCharacterList = getCharacterList
    }
    
    func onAppear() {
        isLoading = true
        Task {
            defer {
                isLoading = false            }
            
            do throws(NetworkError) {
                let characters = try await getCharacterList.execute()
                self.characterList = characters
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
