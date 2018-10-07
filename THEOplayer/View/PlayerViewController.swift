//
//  PlayerViewController.swift
//  THEOplayer
//
//  Created by Christian  Huang on 06/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    /** view model that handle the communication from video content to player. */
    var playerViewModel: PlayerViewModel!
    
    /** scroll view that hold all the views. */
    @IBOutlet weak var contentScrollView: UIScrollView!
    /** resizable view that can simulate longer content. */
    @IBOutlet weak var contentView: UIView!
    /** constrant to adjust contentView's Height. */
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    /** view that will hold the THEOplayer. */
    @IBOutlet weak var playerPanel: UIView!
    /** constrant to adjust playerPanel Height. */
    @IBOutlet weak var playerPanelHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        initVM()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            playerViewModel.stopPlayer()
        }
    }
    
}

// MARK: - View Model
extension PlayerViewController {
    /**
     Initialize the view model
     */
    func initVM() {
        print("player width: \(playerPanel.bounds.width)")
        playerViewModel.playerPanel = playerPanel
        playerViewModel.updateSizeClosure = {(height: CGFloat)->() in
            self.playerPanelHeightConstraint.constant = height
        }
        playerViewModel.pictureInPictureClosure = {()->() in
            self.contentViewHeightConstraint.constant = self.contentScrollView.bounds.height * 2
        }
    }
}

