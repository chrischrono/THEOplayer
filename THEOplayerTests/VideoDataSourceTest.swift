//
//  VideoDataSourceTest.swift
//  THEOplayerTests
//
//  Created by Christian  Huang on 07/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import XCTest
@testable import THEOplayer

class VideoDataSourceTest: XCTestCase {
    var tableView = UITableView()
    var videoDataSource = VideoDataSource()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let data = Helpers.loadDataFromBundle(withName: "videoList", extension: "json")
        let videoList = try! JSONDecoder().decode([Video].self, from: data!)
        videoDataSource.videos.value = videoList
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "videoCellIdentifier")
        tableView.dataSource = videoDataSource
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataCount() {
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 4)
    }
    
    func testLoadedCell() {
        var cell = videoDataSource.tableView(tableView, cellForRowAt: IndexPath(row: 1, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Video stream with multiple audio tracks")
        cell = videoDataSource.tableView(tableView, cellForRowAt: IndexPath(row: 2, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Picture-in-picture")
    }

}
