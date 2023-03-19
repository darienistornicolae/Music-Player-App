//
//  SongsListViewModel.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//

import Foundation
import MediaPlayer

//var player: AVAudioPlayer!

class SongsListViewModel: ObservableObject {
    @Published var items: [SongModel] = []
    @Published var isLoading = false
    @Published var searchTerm: String = " "

    var filteredSongs: [SongModel] {
        searchTerm.isEmpty ? items : items.filter({
            $0.songName.contains(searchTerm)
        })
    }
    
    init() {
        
        MPMediaLibrary.requestAuthorization { status in
            switch status {
            case .notDetermined:
                return
            case .denied:
                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {

                    DispatchQueue.main.async {
                        UIApplication.shared.open(settingsUrl)
                    }

                 }
            case .restricted:
                return
            case .authorized:
                
                guard let songsFromQuerry = MPMediaQuery.songs().items else { return }
                let songModelArray = songsFromQuerry.map(SongModel.init)
                
                DispatchQueue.main.async {
                    self.items = songModelArray
                    self.isLoading = false
                }
            @unknown default:
                return
            }
        }
        
        
    }
   
}
