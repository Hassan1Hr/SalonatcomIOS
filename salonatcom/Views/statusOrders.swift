//
//  statusOrders.swift
//  salonatcom
//
//  Created by Bassam Ramadan on 9/4/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class statusOrders: UITableViewCell {

    let imageSallon = creatImagAndLable().image
    let dateIcon = creatImagAndLable().image
    let data = creatImagAndLable().label
    let status = creatImagAndLable().label
    let nameSallon = creatImagAndLable().label
    let deletIcon = creatImagAndLable().Button
    let view = UIView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        let stackTop = UIStackView(arrangedSubviews: [deletIcon , nameSallon])
        stackTop.spacing = 5
        stackTop.backgroundColor = .white
        let stackBotton = UIStackView(arrangedSubviews: [status , data , dateIcon])
        stackBotton.spacing = 5
        stackBotton.backgroundColor = .white
        let allStackLeft = UIStackView(arrangedSubviews: [stackTop , stackBotton])
        allStackLeft.distribution = .fillEqually
        allStackLeft.axis = .vertical
        allStackLeft.spacing = 5
        
        let allViewStack = UIStackView(arrangedSubviews: [allStackLeft , imageSallon])
        allViewStack.spacing = 10
        setupallViewStack(allViewStack: allViewStack)
        setupImageSallon(allViewStack: allViewStack)
        setupIcons(stackTop: stackTop)
        setupDateIcon(stackBotton: stackBotton)
    }
    fileprivate func setupIcons(stackTop : UIStackView){
        deletIcon.translatesAutoresizingMaskIntoConstraints = false
        deletIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        deletIcon.topAnchor.constraint(equalTo: stackTop.topAnchor).isActive = true
        deletIcon.bottomAnchor.constraint(equalTo: stackTop.bottomAnchor).isActive = true
        deletIcon.leadingAnchor.constraint(equalTo: stackTop.leadingAnchor).isActive = true
    }
    fileprivate func setupallViewStack(allViewStack : UIStackView){
        addSubview(view)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = UIColor.init(white: 2.5, alpha: 1)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant:
            8).isActive = true
        view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant:
            -8).isActive = true
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant:
            8).isActive = true
        view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant:
            -8).isActive = true
        
        
        view.addSubview(allViewStack)
        allViewStack.translatesAutoresizingMaskIntoConstraints = false
        allViewStack.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 8).isActive = true
        allViewStack.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -8).isActive = true
        allViewStack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        allViewStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    fileprivate func setupImageSallon(allViewStack : UIStackView){
        imageSallon.translatesAutoresizingMaskIntoConstraints = false
        imageSallon.trailingAnchor.constraint(equalTo: allViewStack.trailingAnchor ,constant:
            -8).isActive = true
        imageSallon.topAnchor.constraint(equalTo: allViewStack.topAnchor, constant:
            8).isActive = true
        imageSallon.bottomAnchor.constraint(equalTo: allViewStack.bottomAnchor ,constant: -8).isActive = true
        imageSallon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageSallon.clipsToBounds = true
        imageSallon.layer.cornerRadius = 12
        imageSallon.layer.borderColor = UIColor.white.cgColor
        imageSallon.layer.borderWidth = 1
    }
 
    fileprivate func setupDateIcon(stackBotton : UIStackView){
        dateIcon.translatesAutoresizingMaskIntoConstraints = false
        dateIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dateIcon.topAnchor.constraint(equalTo: stackBotton.topAnchor , constant: 10).isActive = true
        dateIcon.bottomAnchor.constraint(equalTo: stackBotton.bottomAnchor, constant: -10).isActive = true
        dateIcon.trailingAnchor.constraint(equalTo: imageSallon.leadingAnchor , constant: -5).isActive = true
        
        data.translatesAutoresizingMaskIntoConstraints = false
        data.widthAnchor.constraint(equalToConstant: 100).isActive = true
        data.topAnchor.constraint(equalTo: stackBotton.topAnchor).isActive = true
        data.bottomAnchor.constraint(equalTo: stackBotton.bottomAnchor).isActive = true
        data.trailingAnchor.constraint(equalTo: dateIcon.leadingAnchor , constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

