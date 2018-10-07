//
//  Video.swift
//  THEOplayer
//
//  Created by Christian  Huang on 06/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import Foundation

/** struct to handle the video content */
struct Video: Codable {
    let title: String
    let source: String
    let type: String
    let PiP: Bool?
    let VR: Bool?
}
