//
//  AppSearchTests.swift
//  AppSearchTests
//
//  Created by Ben Gohlke on 12/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import XCTest
@testable import AppSearch

class AppSearchTests: XCTestCase
{
    
    var viewController: AlbumListViewController!
    
    override func setUp()
    {
        super.setUp()
        viewController = AlbumListViewController()
    }
    
    func testFetchingAlbumDataAndLoadingTable()
    {
        // given
        let mockDataProvider = MockDataProvider()
        viewController.dataProvider = mockDataProvider
        
        // when
        XCTAssertNil(mockDataProvider.tableView, "Before loading the tableview should be nil")
        
        // This will cause the datasource methods to be run since we are accessing the view
        let _ = viewController.view
        
        // then
        XCTAssertTrue(mockDataProvider.tableView != nil, "The tableview should be set")
        XCTAssert(mockDataProvider.tableView == viewController.tableView, "The tableView should be set to the tableView of the datasource")
        
    }
    
    
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockDataProvider: NSObject, AlbumDataProviderProtocol
    {
        weak var tableView: UITableView!
        var albums = [Album]()
        var api: APIController!
        var imageCache = [String:UIImage]()
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return 1
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
        {
            return UITableViewCell()
        }
        
        func didReceiveAPIResults(results: NSArray)
        {
            dispatch_async(dispatch_get_main_queue(), {
                self.albums = Album.albumsWithJSON(results)
                self.tableView.reloadData()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            })
        }
    }
}