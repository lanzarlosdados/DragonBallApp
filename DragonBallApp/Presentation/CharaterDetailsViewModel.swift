//
//  CharaterDetailsViewModel.swift
//  DragonBallApp
//
//  Created by fabian zarate on 04/03/2025.
//

import Foundation

@MainActor
class CharaterDetailsViewModel: ObservableObject {
    private let getCharacterDetails: GetCharacterDetailsType
    @Published var character: Character? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    private let charaterId: Int
    
    init(getCharacterDetails: GetCharacterDetailsType,charaterId: Int) {
        self.getCharacterDetails = getCharacterDetails
        self.charaterId = charaterId
    }
    
    func onAppear() {
        isLoading = true
        Task {
            defer {
                isLoading = false
            }
            do {
                let response =  try await getCharacterDetails.execute(id: charaterId)
                self.character = response
            } catch {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
