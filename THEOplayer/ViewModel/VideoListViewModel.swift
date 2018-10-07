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
    var videoDataSource: VideoDataSource?
    
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
}
