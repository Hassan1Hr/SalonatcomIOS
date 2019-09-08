//
//  ProfileCells.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 9/3/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class ProfileCells: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stack1 = UIStackView(arrangedSubviews: [label , textLabel])
        stack1.distribution = .fillEqually
        stack1.axis = .vertical
        stack1.spacing = 0
    
        let imageViewBackground = UIView()
        let stack2 = UIStackView(arrangedSubviews: [stack1 , imageViewBackground])
        stack2.axis = .horizontal
        stack2.spacing = 15
        
        setupStack1AndStack2(stack1: stack1, stack2: stack2)
       
      
        //icons
        imageViewBackground.translatesAutoresizingMaskIntoConstraints = false
        imageViewBackground.widthAnchor.constraint(equalToConstant: 40).isActive = true
       // imageViewBackground.backgroundColor = .yellow
        
        imageViewBackground.addSubview(imIcon)
        imIcon.translatesAutoresizingMaskIntoConstraints = false
        imIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imIcon.centerYAnchor.constraint(equalTo: imageViewBackground.centerYAnchor).isActive = true
       // imIcon.backgroundColor = .red
        
    }
    fileprivate func setupStack1AndStack2(stack1 : UIStackView , stack2 : UIStackView){
        addSubview(stack2)
        stack2.translatesAutoresizingMaskIntoConstraints = false
        stack2.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stack2.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor , constant: -8).isActive = true
        stack2.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        stack2.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var label : UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textAlignment = .right
        return lb
    }()
    var textLabel : UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textAlignment = .right
        lb.textColor = UIColor.black
        return lb
    }()
    let imIcon : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white
        return iv
    }()
}
