//
//  SongModel.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//
import Foundation
import MediaPlayer

struct SongModel: Identifiable, Equatable {
    let id: String
    let artistName: String
    let songName: String
    let mediaItem: MPMediaItem
    
    
    
    init(id: String = UUID().uuidString, artistName: String, songName: String, mediaItem: MPMediaItem) {
        self.id = id
        self.artistName = artistName
        self.songName = songName
        self.mediaItem = mediaItem
    }
    
    init(mediaItem: MPMediaItem) {
        self.id = UUID().uuidString
        self.artistName = mediaItem.artist ?? "Unknown Artist"
        self.songName = mediaItem.title ?? "Unknown Song"
        self.mediaItem = mediaItem
    }
}
