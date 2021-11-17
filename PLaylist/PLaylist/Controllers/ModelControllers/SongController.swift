//
//  SongController.swift
//  PLaylist
//
//  Created by chris vombaur on 11/8/21.
//

import Foundation


class SongController {
    
    //CRUD
    
    //Create
    static func createSong(title: String, artistName: String, playlist: Playlist) {
        let newSong = Song(title: title, artistName: artistName)
        playlist.songs.append(newSong)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    //Delete
    static func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return }
        playlist.songs.remove(at: index)
        PlaylistController.shared.saveToPersistentStore()
    }
  
}

