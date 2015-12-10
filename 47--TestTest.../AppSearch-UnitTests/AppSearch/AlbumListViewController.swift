//
//  AppsListViewController.swift
//  AppSearch
//
//  Created by Ben Gohlke on 10/25/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class AlbumListViewController: UITableViewController
{
    
//    var api: APIController!
    var dataProvider: AlbumDataProviderProtocol?
//    var imageCache = [String:UIImage]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        assert(dataProvider != nil, "dataProvider is not allowed to be nil at this point")
        tableView.dataSource = dataProvider
        dataProvider?.tableView = tableView
        
//        api = APIController(delegate: self)
//        api.searchItunesFor("Beatles")
//        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "AlbumCell")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView Data Source
    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
//    {
//        return 1
//    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return albums.count
//    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        let cell = tableView.dequeueReusableCellWithIdentifier("AlbumCell", forIndexPath: indexPath)
//        cell
//        
//        let album = albums[indexPath.row]
////        cell.detailTextLabel?.text = album.price
//        cell.imageView?.image = UIImage(named: "Blank52")
//        cell.textLabel?.text = album.title
//        
//        if let img = imageCache[album.thumbnailImageURL]
//        {
//            cell.imageView?.image = img
//        }
//        else
//        {
//            let request = NSURLRequest(URL: NSURL(string: album.thumbnailImageURL)!)
//            let session = NSURLSession.sharedSession()
//            let task = session.dataTaskWithRequest(request, completionHandler: {
//                data, response, error -> Void in
//                if error == nil
//                {
//                    let image = UIImage(data: data!)
//                    self.imageCache[album.thumbnailImageURL] = image
//                    dispatch_async(dispatch_get_main_queue(), {
//                        if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath)
//                        {
//                            cellToUpdate.imageView?.image = image
//                        }
//                    })
//                }
//                else
//                {
//                    print("Error: \(error?.localizedDescription)")
//                }
//                
//            })
//            task.resume()
//        }
//        
//        return cell
//    }
    
//    func didReceiveAPIResults(results: NSArray)
//    {
//        dispatch_async(dispatch_get_main_queue(), {
//            self.albums = Album.albumsWithJSON(results)
//            self.tableView.reloadData()
//            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//        })
//    }
}
