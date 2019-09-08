//
//  CartBooking.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 9/2/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class CartBooking : UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    func setupboot(boot : UIView , view : UIView){
        view.addSubview(boot)
        boot.translatesAutoresizingMaskIntoConstraints = false
        boot.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        boot.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        boot.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        boot.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor , multiplier: 0.12).isActive = true
        boot.backgroundColor = UIColor.init(white: 1.9, alpha: 5)
    }
    
    func setupStackFooter(stackFooter : UIStackView , boot : UIView){
        stackFooter.spacing = 12
        stackFooter.distribution = .fillEqually
        boot.addSubview(stackFooter)
        stackFooter.translatesAutoresizingMaskIntoConstraints = false
        stackFooter.leadingAnchor.constraint(equalTo: boot.leadingAnchor , constant: 8).isActive = true
        stackFooter.trailingAnchor.constraint(equalTo: boot.trailingAnchor, constant: -8).isActive = true
        stackFooter.bottomAnchor.constraint(equalTo: boot.bottomAnchor, constant: -8).isActive = true
        stackFooter.topAnchor.constraint(equalTo: boot.topAnchor, constant: 8).isActive = true
    }
    
    
    func setFeaturesOfSubviewsOfStackFooter(button : UIButton , imgTime : UIImageView , imgCart : UIImageView ,labelTime : UILabel , LabelCart : UILabel){
        button.setImage(UIImage(named: "next"), for: .normal)
        button.backgroundColor = .brown
        imgTime.image = UIImage(named: "time")
        imgCart.image = UIImage(named: "carticon")
        labelTime.text = "50"
        LabelCart.text = "50"
        labelTime.textAlignment = .right
        LabelCart.textAlignment = .right
        LabelCart.font = UIFont(name:"HelveticaNeue-bold", size: 16)
        labelTime.font = UIFont(name:"HelveticaNeue-bold", size: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
