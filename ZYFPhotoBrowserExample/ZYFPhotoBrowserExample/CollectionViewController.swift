//
//  CollectionViewController.swift
//  MYPhotoBrowserDemo
//
//  Created by 朱益锋 on 2017/2/21.
//  Copyright © 2017年 朱益锋. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionViewCell"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.rowNumber = indexPath.row
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var photos = [ZYFPhoto]()
        var i = 0
        for item in collectionView.visibleCells {
            guard let cell = item as? CollectionViewCell else {
                return
            }
            let photo = ZYFPhoto(image: cell.imageView.image!, index: i, sourceImageView: cell.imageView)
            i += 1
            photos.append(photo)
        }
        
        let photoBrowser = ZYFPhotoBrowser()
        photoBrowser.photos = photos
        photoBrowser.firstShowIndex = indexPath.row
        photoBrowser.show()
    }
}
