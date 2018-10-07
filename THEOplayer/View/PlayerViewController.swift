//
//  PlayerViewController.swift
//  THEOplayer
//
//  Created by Christian  Huang on 06/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}

