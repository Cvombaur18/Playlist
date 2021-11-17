//
//  SongTableViewController.swift
//  PLaylist
//
//  Created by chris vombaur on 11/8/21.
//

import UIKit

class SongTableViewController: UITableViewController {

    
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    // MARK: - Properties
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    @IBAction func addSongButtonTap(_ sender: Any) {
        guard let title = songTitleTextField.text,
        let artistName = artistNameTextField.text,
        !title.isEmpty,
        !artistName.isEmpty,
        let playlist = playlist else { return }
        SongController.createSong(title: title, artistName: artistName, playlist: playlist)
        songTitleTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
        
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        guard let playlist = playlist else { return cell }

        
        let song = playlist.songs[indexPath.row]
        
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artistName
        
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist else { return }
            let songToDelete = playlist.songs[indexPath.row]
            SongController.deleteSong(song: songToDelete, playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }   
    }
  

}
