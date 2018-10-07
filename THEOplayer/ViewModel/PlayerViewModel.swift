//
//  PlayerViewModel.swift
//  THEOplayer
//
//  Created by Christian  Huang on 06/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit
import THEOplayerSDK

class PlayerViewModel: NSObject {
    /** THEOplayer for playing the video content */
    fileprivate var player: THEOplayer!
    /** hold the listeners of THEOplayer's event */
    fileprivate var listeners = [String: EventListener]()
    /** hold the videoList */
    fileprivate var onResize: ((EventProtocol)->())?
    
    /** Closure to update the player view's height */
    var updateSizeClosure: ((CGFloat)->())?
    /** Closure to simulate longer scrollview to test Picture-in-Picture mode */
    var pictureInPictureClosure: (()->())?
    
    /** videoContent that upon setting will configure the THEOplayer */
    var video: Video? {
        didSet{
            if let video = video {
                if let pipMode = video.PiP, pipMode == true {
                    let playerConfig = THEOplayerConfiguration(pictureInPicture: true)
                    player = THEOplayer(configuration: playerConfig)
                    player.pip!.configure(movable: false, defaultCorner: .bottomLeft, scale: 0.5)
                } else {
                    player = THEOplayer()
                }
                self.attachEventListeners()
                let source = SourceDescription(source: TypedSource(src: video.source, type: video.type))
                player.source = source
            }
        }
    }
    /** view that will hold the player, that upon setting will set the size of THEOplayer */
    var playerPanel: UIView? {
        didSet {
            if let playerPanel = playerPanel {
                player.frame = playerPanel.bounds
                player.addAsSubview(of: playerPanel)
            }
        }
    }
    
}

// MARK: - public func
extension PlayerViewModel {
    /**
     Function to Stop the player and remove all listeners
     */
    func stopPlayer() {
        player.stop()
        removeEventListeners()
    }
}

// MARK: - THEOplayer event related func
extension PlayerViewModel {
    fileprivate func attachEventListeners() {
        if onResize != nil {
            return
        }
        onResize = {(event: EventProtocol)->() in
            print("onResize event occured")
            self.updateSizeClosure?(self.player.bounds.height)
            if let _ = self.video!.PiP {
                self.pictureInPictureClosure?()
            }
        }
        listeners["resize"] = player.addEventListener(type: PlayerEventTypes.RESIZE, listener: onResize!)
    }
    
    fileprivate func removeEventListeners() {
        if onResize == nil {
            return
        }
        player.removeEventListener(type: PlayerEventTypes.RESIZE, listener: listeners["resize"]!)
        listeners["resize"] = nil
        onResize = nil
    }
    
}
