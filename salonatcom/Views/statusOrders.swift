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
    let date = creatImagAndLable().label
    let status = creatImagAndLable().label
    let nameSallon = creatImagAndLable().label
    let deletIcon = creatImagAndLable().Button
    let view = UIView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        let stackTop = UIStackView(arrangedSubviews: [deletIcon , nameSallon])
        stackTop.spacing = 5
        stackTop.backgroundColor = .white
        let stackBotton = UIStackView(arrangedSubviews: [status , date , dateIcon])
        stackBotton.spacing = 5
        stackBotton.backgroundColor = .white
        let allStackLeft = UIStackView(arrangedSubviews: [stackTop , stackBotton])
        allStackLeft.distribution = .fillEqually
        allStackLeft.axis = .vertical
        allStackLeft.spacing = 5
        
        let allViewStack = UIStackView(arrangedSubviews: [allStackLeft , imageSallon])
        allViewStack.spacing = 10
        
        setupallViewStack(allViewStack: allViewStack, allStackLeft: allStackLeft)
        setupImageSallon(allViewStack: allViewStack)
        setupDeletIcons(stackTop: stackTop)
        setupDateIcon(stackBotton: stackBotton)
    }
    fileprivate func setupDeletIcons(stackTop : UIStackView){
        deletIcon.translatesAutoresizingMaskIntoConstraints = false
        deletIcon.widthAnchor.constraint(equalTo: stackTop.widthAnchor, multiplier: 0.10).isActive = true
        deletIcon.heightAnchor.constraint(equalTo: stackTop.heightAnchor , multiplier: 0.60).isActive = true
        //deletIcon.centerYAnchor.constraint(equalTo: stackTop.centerYAnchor).isActive = true
        
        nameSallon.translatesAutoresizingMaskIntoConstraints = false
        nameSallon.topAnchor.constraint(equalTo: stackTop.topAnchor).isActive = true
    }
    fileprivate func setupallViewStack(allViewStack : UIStackView , allStackLeft : UIStackView){
        addSubview(view)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = UIColor.init(white: 2.5, alpha: 1)
       // view.backgroundColor = .red
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
        allViewStack.topAnchor.constraint(equalTo: view.topAnchor , constant: 8).isActive = true
        allViewStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        
    }
    fileprivate func setupImageSallon(allViewStack : UIStackView){
        imageSallon.translatesAutoresizingMaskIntoConstraints = false
        imageSallon.trailingAnchor.constraint(equalTo: allViewStack.trailingAnchor).isActive = true
        imageSallon.topAnchor.constraint(equalTo: allViewStack.topAnchor).isActive = true
        imageSallon.bottomAnchor.constraint(equalTo: allViewStack.bottomAnchor).isActive = true
        imageSallon.widthAnchor.constraint(equalTo: allViewStack.widthAnchor, multiplier: 0.30).isActive = true
        imageSallon.clipsToBounds = true
        imageSallon.layer.cornerRadius = 12
        imageSallon.layer.borderColor = UIColor.white.cgColor
        imageSallon.layer.borderWidth = 1
    }
 
    fileprivate func setupDateIcon(stackBotton : UIStackView ){
        dateIcon.translatesAutoresizingMaskIntoConstraints = false
        dateIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dateIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dateIcon.centerYAnchor.constraint(equalTo: stackBotton.centerYAnchor).isActive = true
//        dateIcon.trailingAnchor.constraint(equalTo: imageSallon.leadingAnchor , constant: -5).isActive = true
        
        date.translatesAutoresizingMaskIntoConstraints = false
        date.widthAnchor.constraint(equalTo: stackBotton.widthAnchor, multiplier: 0.40).isActive = true
        date.trailingAnchor.constraint(equalTo: dateIcon.leadingAnchor , constant: -10).isActive = true
        
        status.translatesAutoresizingMaskIntoConstraints = false
        let deviceType = UIDevice.current.deviceText
        if deviceType == "iPad" {
            status.leadingAnchor.constraint(equalTo: stackBotton.leadingAnchor, constant: 50).isActive = true
        }else{
           status.leadingAnchor.constraint(equalTo: stackBotton.leadingAnchor, constant: 10).isActive = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

