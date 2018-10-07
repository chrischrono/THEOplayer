//
//  VideoListVMTest.swift
//  THEOplayerTests
//
//  Created by Christian  Huang on 07/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import XCTest
@testable import THEOplayer

class VideoListVMTest: XCTestCase {
    var dataSource = VideoDataSource()
    var videoListVM: VideoListViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        videoListVM = VideoListViewModel(dataSource: dataSource)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadVideoList() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        videoListVM.loadVideoList(filename: "videoList")
        XCTAssertEqual(videoListVM.videoDataSource?.videos.value.count, 4)
    }
    
    func testGetPlayerViewModel() {
        videoListVM.loadVideoList(filename: "videoList")
        var playerVM = videoListVM.getPlayerViewModel(for: IndexPath(row: 1, section: 0))
        XCTAssertEqual(playerVM.video!.title, "Video stream with multiple audio tracks")
        playerVM = videoListVM.getPlayerViewModel(for: IndexPath(row: 2, section: 0))
        XCTAssertEqual(playerVM.video!.title, "Picture-in-picture")
    }

}
