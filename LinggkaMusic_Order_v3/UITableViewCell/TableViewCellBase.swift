//
//  TableViewCellBase.swift
//  SQLITE_MUSIC
//
//  Created by Tuuu on 7/23/16.
//  Copyright © 2016 TuNguyen. All rights reserved.
//

import UIKit

class TableViewCellBase: UITableViewCell {
    
    var img_Detail: UIImageView!
    var lbl_name: UILabel!
    var lbl_info: UILabel!
    var cn_lblName = NSLayoutConstraint()
    var cn_lblInfo = NSLayoutConstraint()
    
    // Add Images To Cells
    var imgDetail = { (_ controller: TableViewCellBase) in
        
        controller.img_Detail = UIImageView()
        controller.img_Detail.contentMode = .scaleToFill
        controller.contentView.addSubview(controller.img_Detail)
        controller.img_Detail.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: controller.img_Detail, attribute: .leading, relatedBy: .equal, toItem: controller.contentView, attribute: .leading, multiplier: 1, constant: 5)
        let cn2 = NSLayoutConstraint(item: controller.img_Detail, attribute: .top, relatedBy: .equal, toItem: controller.contentView, attribute: .top, multiplier: 1, constant: 0)
        let cn3 = NSLayoutConstraint(item: controller.img_Detail, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let cn4 = NSLayoutConstraint(item: controller.img_Detail, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
        
    }
    
    // Add Song Names To Cells
    var name = { (_ controller: TableViewCellBase) in
        
        controller.lbl_name = UILabel()
        controller.contentView.addSubview(controller.lbl_name)
        controller.lbl_name.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: controller.lbl_name, attribute: .leading, relatedBy: .equal, toItem: controller.img_Detail, attribute: .trailing, multiplier: 1, constant: 2)
        let cn2 = NSLayoutConstraint(item: controller.lbl_name, attribute: .top, relatedBy: .equal, toItem: controller.contentView, attribute: .top, multiplier: 1, constant: 0)
        let cn3 = NSLayoutConstraint(item: controller.lbl_name, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 35)
        controller.cn_lblName = NSLayoutConstraint(item: controller.lbl_name, attribute: .trailing, relatedBy: .equal, toItem: controller.contentView, attribute: .trailing, multiplier: 1, constant: -100)
        NSLayoutConstraint.activate([cn1, cn2, cn3, controller.cn_lblName])
        
    }
    
    // Add Song Info
    var info = { (_ controller: TableViewCellBase) in
        
        controller.lbl_info = UILabel()
        controller.contentView.addSubview(controller.lbl_info)
        controller.lbl_info.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: controller.lbl_info, attribute: .leading, relatedBy: .equal, toItem: controller.img_Detail, attribute: .trailing, multiplier: 1, constant: 2)
        let cn2 = NSLayoutConstraint(item: controller.lbl_info, attribute: .top, relatedBy: .equal, toItem: controller.lbl_name, attribute: .bottom, multiplier: 1, constant: 0)
        let cn3 = NSLayoutConstraint(item: controller.lbl_info, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 35)
        controller.cn_lblInfo = NSLayoutConstraint(item: controller.lbl_info, attribute: .trailing, relatedBy: .equal, toItem: controller.contentView, attribute: .trailing, multiplier: 1, constant: -100)
        NSLayoutConstraint.activate([cn1, cn2, cn3, controller.cn_lblInfo])
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add Image
        imgDetail(self)
        
        // Add Name
        name(self)
        
        // Add Info
        info(self)
        
    }
    
}
