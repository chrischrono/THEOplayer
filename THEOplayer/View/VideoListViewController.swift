//
//  VideoListViewController.swift
//  THEOplayer
//
//  Created by Christian  Huang on 07/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

class VideoListViewController: UIViewController {
    /** to show all avaliable video */
    @IBOutlet weak var videosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

// MARK: - UITableViewDelegate
extension VideoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "playerSegue", sender: indexPath)
    }
}

