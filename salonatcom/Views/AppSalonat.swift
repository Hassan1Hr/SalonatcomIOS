//
//  AppSalonat.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 8/25/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit
import Cosmos

class AppSalonat: UICollectionViewCell {
    
    let myCosmosView : CosmosView = {
        let cv = CosmosView()
        cv.text = " التقييم"
        cv.settings.updateOnTouch = false
        cv.settings.starMargin = 5
       
        return cv
    }()
    let image : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 16
        iv.clipsToBounds = true
        return iv
    }()
    
    
    let name : UILabel = {
       let lb = UILabel()
      //  lb.text = "صالون اوكيد العالمي"
        lb.textAlignment = .right
        lb.textColor = .black
        lb.font = lb.font.withSize(30)
        return lb
    }()
    
    let address : UILabel = {
        let lb = UILabel()
       // lb.text = "جدة - شمال المسجد"
        lb.textAlignment = .right
        lb.textColor = .gray
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackLabels = UIStackView(arrangedSubviews: [myCosmosView , address])
        stackLabels.axis = .horizontal
        stackLabels.distribution = .fillEqually
        
        
        let stackView =  UIStackView(arrangedSubviews: [image, name, stackLabels])
        stackView.axis = .vertical
        stackView.spacing = 15
        
         addSubview(stackView)
        
        // stack constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        
        // image constraints
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.75).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
