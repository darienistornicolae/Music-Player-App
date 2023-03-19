//
//  SongsListView.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//

import SwiftUI

struct SongsListView: View {
    @StateObject var viewModel: SongsListViewModel
    @State private var isMusicPlayerPresented: Bool = false
    
    init(viewModel: SongsListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    
    var body: some View {
        if viewModel.items.isEmpty {
            EmptyStateView()
        } else {
            NavigationView {
                List {
                    ForEach(viewModel.filteredSongs) { song in
                            SongListRowView(song: song)
                            .onTapGesture {
                                MusicPlayerController.shared.playNewSong(song)
                                isMusicPlayerPresented = true
                        }
                    }
                }
                .searchable(text: $viewModel.searchTerm)
                .listStyle(.plain)
                .background(
                    NavigationLink(
                        isActive: $isMusicPlayerPresented,
                        destination: {
                            MusicPlayerView(viewModel: MusicPlayerViewModel())
                    }, label: {
                        EmptyView()
                    })
                )
            }
            
            .navigationTitle("Music Player")
            
            
        }
    }
}

struct PlayerView_List_Previews: PreviewProvider {
    static var previews: some View {
        SongsListView(viewModel: SongsListViewModel())
    }
}
