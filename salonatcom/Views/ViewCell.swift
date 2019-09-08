//
//  ViewCell.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 8/20/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit


class ViewCell: UICollectionViewCell {
    
  
    let image : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 16
        iv.clipsToBounds = true
        return iv
    }()
    let label : UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .black
        lb.textColor = .white
        lb.layer.cornerRadius = 20
       
        lb.lineBreakMode = .byTruncatingTail
        lb.sizeToFit()
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.font = lb.font.withSize(20)
       // lb.font = lb.font.withSize(15)
        lb.clipsToBounds = true
       return lb
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .green
        //let stack1 = UIStackView(arrangedSubviews: [image])
       // let stack2 = UIStackView(arrangedSubviews: [button])
        
        let totstacks = UIStackView(arrangedSubviews: [image , label])
        totstacks.axis = .vertical
        totstacks.backgroundColor = .red
        totstacks.spacing = -20
        addSubview(totstacks)
        
        // totstacks
        
        totstacks.translatesAutoresizingMaskIntoConstraints = false
        totstacks.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 8 ).isActive = true
        totstacks.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -8).isActive = true
        totstacks.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 8).isActive = true
        totstacks.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8).isActive = true
        
        // image
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: totstacks.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: totstacks.trailingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: totstacks.topAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: totstacks.heightAnchor, multiplier: 0.85).isActive = true
        
        
        //button
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: totstacks.leadingAnchor ).isActive = true
        label.trailingAnchor.constraint(equalTo: totstacks.trailingAnchor  ).isActive = true
      
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
