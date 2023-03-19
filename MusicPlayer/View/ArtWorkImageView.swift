//
//  ArtWorkImageView.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 16.01.2022.
//

import SwiftUI
import MediaPlayer

struct ArtworkImageView: View {
    let artWork: MPMediaItemArtwork?
    var body: some View {
        
            if let artWorkImage = artWork?.image(at: CGSize(width: 50, height: 50)) {
                return Image(uiImage: artWorkImage)
                    .resizable()
                    .scaledToFit()
            } else {
                return Image("Test")
                    .resizable()
                    .scaledToFit()
            }
    }
}

struct ArtWorkImageView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkImageView(artWork: nil)
    }
}
