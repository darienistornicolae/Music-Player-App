//
//  MusicPlayerViewModel.swift
//  MusicPlayer
//
//  Created by Tudor Andreescu on 24.12.2021.
//

import Foundation
import MediaPlayer
import SwiftUI

class MusicPlayerViewModel: ObservableObject {
    
//    // MARK: - Properties
//    @Published var isPlaying: Bool
//    let item: SongModel
//
//    // MARK: - Init
//    init(
//        isPlaying: Bool = false,
//        item: SongModel
//    ) {
//        self.isPlaying = isPlaying
//        self.item = item
//    }
    
    func playToggle() {
        
        if MusicPlayerController.shared.isPlaying {
            MusicPlayerController.shared.pause()
        } else {
            MusicPlayerController.shared.play()
        }
        
    }
}
