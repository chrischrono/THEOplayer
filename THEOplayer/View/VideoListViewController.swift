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
    /** data source for the tableView */
    var videoDataSource = VideoDataSource()
    /** view model that handle the communication fom data to view */
    var videoListViewModel: VideoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initVM()
    }


}

// MARK: - View Model
extension VideoListViewController {
    /**
     Initialize the view model
     */
    func initVM() {
        videosTableView.dataSource = videoDataSource
        videoDataSource.videos.listener = {([Video])->() in
            self.videosTableView.reloadData()
        }
        videoListViewModel = VideoListViewModel(dataSource: videoDataSource)
        videoListViewModel.loadVideoList(filename: "videoList")
    }
}

// MARK: - UITableViewDelegate
extension VideoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "playerSegue", sender: indexPath)
    }
}

