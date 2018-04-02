//
//  CollectionViewCell.swift
//  VideoConnect
//
//  Created by Protocol on 25/06/16.
//  Copyright © 2016 VideoConn. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var bgView: UIImageView!
    
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblVideoDate: UILabel!
    
    @IBOutlet weak var viewBackground: UIView!
    
    @IBOutlet weak var btnWatchedCount: UIButton!
    @IBOutlet weak var btnLikedCount: UIButton!
    @IBOutlet weak var btnDislikedCount: UIButton!
    @IBOutlet weak var btnFavouritedCount: UIButton!
    @IBOutlet weak var btnCommentedCount: UIButton!
}
