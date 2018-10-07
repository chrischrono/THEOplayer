//
//  VideoListViewModel.swift
//  THEOplayer
//
//  Created by Christian  Huang on 06/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

class VideoListViewModel: NSObject {
    /** hold the videoList */
    weak var videoDataSource: VideoDataSource?
    
    /**
     Initialize with dataSource
     - Parameter dataSource: dataSource that will hold the videoList.
     */
    init(dataSource: VideoDataSource?) {
        self.videoDataSource = dataSource
    }
}

extension VideoListViewModel {
    
    /**
     Load videoData from JSON file
     - Parameter filename: JSON filename that content videoData.
     */
    func loadVideoList(filename: String) {
        if let videoData = Helpers.loadDataFromBundle(withName: filename, extension: "json") {
            if let videoList = try? JSONDecoder().decode([Video].self, from: videoData) {
                self.videoDataSource?.videos.value = videoList
            }
        }
    }
    
    /**
     Generate PlayerViewModel for selected Video
     - Parameter indexPath: selected index of video data from videoList .
     */
    func getPlayerViewModel(for indexPath: IndexPath) -> PlayerViewModel {
        let playerVM = PlayerViewModel()
        if let dataSource = videoDataSource {
            playerVM.video = dataSource.videos.value[indexPath.row]
        }
        return playerVM
    }
}
