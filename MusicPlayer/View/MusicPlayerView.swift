//
//  MusicPlayerView.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//

import SwiftUI
import MediaPlayer


struct MusicPlayerView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: MusicPlayerViewModel
    @ObservedObject var musicController: MusicPlayerController = MusicPlayerController.shared
    
    // MARK: - Init
    init(viewModel: MusicPlayerViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    
    // MARK: - Body
    var body: some View {
            VStack {
                Spacer()
                defaultImage
                Spacer()
                
                songName
                artistName
                    .padding(.bottom, 40)
                Spacer()
                
                ZStack {
                    
                    controlSheet
                        .padding()
                    playButton
                    nextButton
                        .padding(.leading, 130)
                    backwardButton
                        .padding(.trailing, 130)    
                    
                }
            }
            .navigationTitle("Playing now")
                
    }
}


// MARK: - Previews
struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MusicPlayerView(viewModel: MusicPlayerViewModel())
        }
    }
}


// MARK: - Extracted Views
fileprivate extension MusicPlayerView {
    private var defaultImage: some View {
        ArtworkImageView(artWork: musicController.currentlyPLayingItem.mediaItem.artwork)
            .cornerRadius(20)
            .frame(maxWidth: 250, maxHeight: 350)
    }
    
     var songName: some View {
         Text(musicController.currentlyPLayingItem.songName)
            .font(.title)
            .fontWeight(.semibold)
    }
    
     var artistName: some View {
         Text(musicController.currentlyPLayingItem.artistName)
            .font(.title)
            .foregroundColor(.gray)
    }
    
     var controlSheet: some View {
        RoundedRectangle(cornerRadius: 20)
            .edgesIgnoringSafeArea(.bottom)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .foregroundColor(.accentColor)
            .shadow(color: Color.blue, radius: 21, x: 2, y: 0)
    }
    
     var playButton: some View {
        Button {
            viewModel.playToggle()
        } label: {
            Image(systemName: musicController.isPlaying ? "pause.fill" : "play.fill")
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.green)
                    
            )
        }
    }
    
    var nextButton: some View {
        Button {
            musicController.next()
        } label: {
            Image(systemName: "forward.fill")
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 70, height: 50)
                        .foregroundColor(.green)
                    
            )
        }
    }
    
    var backwardButton: some View {
        Button {
            musicController.back()
        } label: {
            Image(systemName: "backward.fill")
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 70, height: 50)
                        .foregroundColor(.green)
                    
            )
        }
    }
}
