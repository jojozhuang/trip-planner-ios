//
//  ContinentViewCell.swift
//  johnny.portfolio.tripplanner
//
//  Created by Johnny on 5/14/15.
//  Copyright (c) 2015 JoJoStudio. All rights reserved.
//

import UIKit

class ContinentViewCell: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var txtName: UILabel = UILabel()
    var txtDetails: UILabel = UILabel()
    var imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let margin: CGFloat = 10
        let imageHeight: CGFloat = frame.size.height-margin
        let imageY: CGFloat = (frame.size.height-imageHeight)/2
        
        imageView = UIImageView(frame: CGRect(x: frame.size.width-imageHeight-imageY, y: imageY, width: imageHeight, height: imageHeight))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(imageView)
        
        let nameFrame = CGRect(x: 5, y: 0, width: frame.size.width, height: frame.size.height)
        txtName = UILabel(frame: nameFrame)
        txtName.font = UIFont.boldSystemFont(ofSize: 12.0)
        txtName.textColor = UIColor.yellow
        txtName.textAlignment = .left
        contentView.addSubview(txtName)
        
        let detailsFrame = CGRect(x: 5, y: 20, width: frame.size.width, height: frame.size.height)
        txtDetails = UILabel(frame: detailsFrame)
        txtDetails.font = UIFont.boldSystemFont(ofSize: 10.0)
        txtDetails.textColor = UIColor.white
        txtDetails.textAlignment = .left
        contentView.addSubview(txtDetails)
    }
}
