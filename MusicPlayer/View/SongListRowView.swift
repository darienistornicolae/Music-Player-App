//
//  SongListRowView.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//

import SwiftUI
import MediaPlayer



struct SongListRowView: View {
    
    let song: SongModel
     
    
    var body: some View {
        HStack(spacing: 10) {
            
            ArtworkImageView(artWork: song.mediaItem.artwork)
                .frame(width: 50, height: 50)
                .cornerRadius(18)
            
            Text(song.artistName)
                .font(.callout)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .allowsTightening(true)
                
            Text(song.songName)
                .multilineTextAlignment(.leading)
                .allowsTightening(true)
                
            
            Spacer()
        }
    }
}

struct PlayerView_Item_Previews: PreviewProvider {
    
    static var previews: some View {
         
        SongListRowView(song: SongModel(artistName: "Lux sfdfdsfsfsdfsfsdfsfsfsfsfsfsfsfssdf", songName: "Google dfasjfdfsfsdjkfhsfhsfsdfsfsdfsjhsdfhssfsdfsdffs", mediaItem: MPMediaItem()))
            .previewLayout(.sizeThatFits)
    }
}
