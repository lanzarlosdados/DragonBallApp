//
//  CharacterView.swift
//  DragonBallApp
//
//  Created by fabian zarate on 08/03/2025.
//

import SwiftUI

struct CharacterView: View {
    let character: Character
    
    var body: some View {
        VStack(spacing: 0) {
            RemoteImage(
                urlString:character.image,
                placeholder: Image("image-goku"),
                errorImage: Image(systemName: "xmark.circle")
            )
            
            .frame( height: 300)
            .scaledToFit()
            Rectangle()
                .frame(height: 12)
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Name:")
                    Text(character.name)
                }
                HStack {
                    Text("Race:")
                    Text(character.race)
                }
                HStack {
                    Text("Ki:")
                    Text(character.ki)
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}
