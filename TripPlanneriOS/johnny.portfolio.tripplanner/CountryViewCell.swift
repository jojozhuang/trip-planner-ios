//
//  CountryViewCell.swift
//  johnny.portfolio.tripplanner
//
//  Created by Johnny on 5/19/15.
//  Copyright (c) 2015 JoJoStudio. All rights reserved.
//

import UIKit

class CountryViewCell: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var txtName: UILabel = UILabel()
    var txtDetails: UILabel = UILabel()
    var imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(imageView)
        
        //Country Name
        let nameFrame = CGRect(x: 5, y: frame.size.height-20, width: frame.size.width, height: 20)
        txtName = UILabel(frame: nameFrame)
        txtName.font = UIFont.boldSystemFont(ofSize: 12.0)
        txtName.textColor = UIColor.white
        txtName.textAlignment = .left
        contentView.addSubview(txtName)
        
        //Count of cities with this country
        let detailsFrame = CGRect(x: frame.size.width-10, y: frame.size.height-20, width: frame.size.width, height: 20)
        txtDetails = UILabel(frame: detailsFrame)
        txtDetails.font = UIFont.boldSystemFont(ofSize: 12.0)
        txtDetails.textColor = UIColor.white
        txtDetails.textAlignment = .left
        contentView.addSubview(txtDetails)
    }
    
    /*
    func updateLayout(frame: CGRect) {
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        txtName.frame = CGRect(x: 5, y: frame.size.height-20, width: frame.size.width, height: 20)
        txtDetails.frame = CGRect(x: frame.size.width-10, y: frame.size.height-20, width: frame.size.width, height: 20)
    }*/
}
