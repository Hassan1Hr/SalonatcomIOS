//
//  profileCell.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 9/6/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class PrfileCell : UITableViewCell {
    let nameService = creatImagAndLable().label
    let detailService = creatImagAndLable().label
    let imageService = creatImagAndLable().image
    let icon = creatImagAndLable().Button
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stack1 = UIStackView(arrangedSubviews: [nameService , detailService])
        stack1.distribution = .fillEqually
        stack1.axis = .vertical
        stack1.spacing = 5
        
        let stack2 = UIStackView(arrangedSubviews: [icon , stack1 , imageService])
        stack2.spacing = 12
        stack2.alignment = .center
        
        setupStack2(Stack2: stack2)
        setupimageService(stack2: stack2)
        setupIcon(stack2: stack2)
        backgroundColor = UIColor.init(white: 2.5, alpha: 1)
       
    }
    fileprivate func setupimageService(stack2  : UIStackView){
        imageService.translatesAutoresizingMaskIntoConstraints = false
        imageService.widthAnchor.constraint(equalTo: stack2.widthAnchor, multiplier: 0.18).isActive = true
        imageService.heightAnchor.constraint(equalTo: stack2.heightAnchor, multiplier: 0.60).isActive = true
    }
    fileprivate func setupIcon(stack2  : UIStackView){
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.widthAnchor.constraint(equalTo: stack2.widthAnchor, multiplier:
            0.10).isActive = true
        icon.heightAnchor.constraint(equalTo: stack2.heightAnchor, multiplier:
            0.30).isActive = true
    
    
    }
    fileprivate func setupStack2(Stack2 : UIStackView){
        addSubview(Stack2)
        Stack2.translatesAutoresizingMaskIntoConstraints = false
        Stack2.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 2).isActive = true
        Stack2.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        Stack2.topAnchor.constraint(equalTo:  self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        Stack2.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
