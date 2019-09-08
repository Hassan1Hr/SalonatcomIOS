//
//  segCell.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 8/26/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit


class segCell: UITableViewCell {
    
    let view = UIView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stack1 = UIStackView(arrangedSubviews: [time , salary])
        stack1.distribution = .fillEqually
         stack1.spacing = 5
        let stack2 = UIStackView(arrangedSubviews: [name , stack1])
        stack2.axis = .vertical
        stack2.distribution = .fillEqually
        stack2.spacing = 5
        
        let stack3 = UIStackView(arrangedSubviews: [imIcon , stack2 , imProfile])
        stack3.spacing = 12
        stack3.alignment = .center
        
        setupView(stack3 : stack3)
        
        // image constraints
        setupImProfile(ImProfile: imProfile , stack3 : stack3)
      
        //icons
        setupImIcon(imIcon: imIcon)
      
       // stack2
        setupStack2(stack2: stack2)
        
    }
    fileprivate func setupView(stack3 : UIStackView){
        addSubview(view)
        view.addSubview(stack3)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = UIColor.init(white: 2.5, alpha: 1)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        stack3.translatesAutoresizingMaskIntoConstraints = false
        stack3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        stack3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        stack3.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        stack3.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: -8).isActive = true
        
    }
    
    fileprivate func setupImProfile(ImProfile : UIImageView , stack3 : UIStackView){
        imProfile.translatesAutoresizingMaskIntoConstraints = false
        imProfile.trailingAnchor.constraint(greaterThanOrEqualTo: stack3.trailingAnchor, constant: -5).isActive = true
        imProfile.topAnchor.constraint(greaterThanOrEqualTo: stack3.topAnchor, constant: 5).isActive = true
        imProfile.bottomAnchor.constraint(greaterThanOrEqualTo: stack3.bottomAnchor, constant: -5).isActive = true
        imProfile.widthAnchor.constraint(equalTo: stack3.widthAnchor, multiplier: 0.25).isActive = true
    }
    
    fileprivate func setupImIcon(imIcon : UIButton){
        imIcon.translatesAutoresizingMaskIntoConstraints = false
        imIcon.widthAnchor.constraint(equalToConstant: 65).isActive = true
        imIcon.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant:
            30).isActive = true
        imIcon.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant:
            -30).isActive = true
    }
    
    fileprivate func setupStack2(stack2 : UIStackView){
        stack2.translatesAutoresizingMaskIntoConstraints = false
        stack2.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant:
            20).isActive = true
        stack2.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant:
            -20).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    var name : UILabel = {
        let lb = UILabel()
         lb.backgroundColor = .white
         lb.textAlignment = .right
        lb.font = lb.font.withSize(25)
        return lb
    }()
    
    let salary : UILabel = {
        let lb = UILabel()
         lb.textAlignment = .right
        lb.backgroundColor = .white
        return lb
    }()
    
    let time : UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white
        lb.textAlignment = .right
        return lb
    }()
    var imProfile : UIImageView = {
       let iv = UIImageView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
       return iv
    }()
    let imIcon : UIButton = {
        let iv = UIButton()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 5
        iv.clipsToBounds = true
        return iv
    }()
   
}
