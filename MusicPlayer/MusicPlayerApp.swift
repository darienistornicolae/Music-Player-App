//
//  MusicPlayerApp.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//

import SwiftUI

@main
struct MusicPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            SongsListView(viewModel: SongsListViewModel())
        }
    }
}
