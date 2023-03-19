//
//  MusicPlayerController.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 21.01.2022.
//

import Foundation
import MediaPlayer


class MusicPlayerController: ObservableObject {
    
    @Published var currentlyPLayingItem: SongModel
    @Published var isPlaying: Bool = false
    var songsInQueue = [SongModel]()
    
    private var musicPlayer: MPMusicPlayerController {
        return MPMusicPlayerController.systemMusicPlayer
    }
    
    
    static let shared = MusicPlayerController()
    private init() {
        self.currentlyPLayingItem = SongModel(id: "", artistName: "", songName: "", mediaItem: MPMediaItem())
    }
    
    
    func play() {
        isPlaying = true
        musicPlayer.play()
        assertCurentlyPayingItem()
    }
        
    
    func pause() {
        isPlaying = false
        musicPlayer.pause()
    }
    
    func playNewSong(_ song: SongModel) {
        guard song.mediaItem != musicPlayer.nowPlayingItem else {
            self.play()
            return
        }
        
        if songsInQueue.contains(song) {
            guard let songIndex = songsInQueue.firstIndex(where: { $0 == song }) else { return }
            songsInQueue.remove(at: songIndex)
        }
        

        // Daca MPMusicPlayerController.systemMusicPlayer canta de la primul element la ultimul
        self.songsInQueue.insert(song, at: 0)

        
        let mediaItemsArray = songsInQueue.map({ $0.mediaItem })
        
        
        musicPlayer.setQueue(with: MPMediaItemCollection(items: mediaItemsArray))
        self.play()
    }
    
    func next() {
        guard let currentSongIndex = songsInQueue.lastIndex(where: { $0.mediaItem == musicPlayer.nowPlayingItem }) else { return }
        if currentSongIndex == songsInQueue.count - 0  {
            
            
            
        } else {
            // play next song
            musicPlayer.skipToNextItem()
            assertCurentlyPayingItem()
        
            
            
        }
    }
    
    
    func back() {
        musicPlayer.skipToPreviousItem()
        assertCurentlyPayingItem()
        
    }
    
    func toggleShuffle() {
        
    }
    
    func toggleRepeat() {
        
    }
    
    private func assertCurentlyPayingItem() {
        guard let currentlyPlayingMediaItem = musicPlayer.nowPlayingItem else {return}
        self.currentlyPLayingItem = SongModel(mediaItem: currentlyPlayingMediaItem)
    }
}


