//
//  VideoDataSource.swift
//  THEOplayer
//
//  Created by Christian  Huang on 06/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

/** Class that hold videoList and also handle the UITableViewDataSource */
class VideoDataSource: NSObject, UITableViewDataSource {
    /** hold the videoList */
    let videos: Dynamic<[Video]> = Dynamic([])
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos.value[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCellIdentifier", for: indexPath)
        cell.textLabel?.text = video.title
        
        return cell
    }
}
