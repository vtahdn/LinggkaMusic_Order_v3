//
//  TableViewCellSong.swift
//  SQLITE_MUSIC
//
//  Created by Tuuu on 7/23/16.
//  Copyright © 2016 TuNguyen. All rights reserved.
//

import UIKit

class TableViewCellSong: TableViewCellBase {
    
    var btn_Play: UIButton!
    var btn_AddPlayList: UIButton!
    
    // Add the play button
    var playButton = { (_ controller: TableViewCellSong) in
        
        controller.btn_Play = UIButton()
        controller.btn_Play.setImage(UIImage(named: "k_play"), for: .normal)
        controller.contentView.addSubview(controller.btn_Play)
        controller.btn_Play.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: controller.btn_Play, attribute: .trailing, relatedBy: .equal, toItem: controller.btn_AddPlayList, attribute: .trailing, multiplier: 1, constant: -36)
        let cn2 = NSLayoutConstraint(item: controller.btn_Play, attribute: .top, relatedBy: .equal, toItem: controller.contentView, attribute: .top, multiplier: 1, constant: controller.contentView.center.y - 15)
        let cn3 = NSLayoutConstraint(item: controller.btn_Play, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        let cn4 = NSLayoutConstraint(item: controller.btn_Play, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
        
    }
    
    @objc func clickAddPlayList() {
        print("clickAddPlayList")
    }
    
    // Add the play list button
    var playList = { (_ controller: TableViewCellSong) in
        
        controller.btn_AddPlayList = UIButton()
        controller.btn_AddPlayList.addTarget(controller, action: #selector(clickAddPlayList), for: .touchUpInside)
        controller.btn_AddPlayList.setImage(UIImage(named: "k_add"), for: .normal)
        controller.contentView.addSubview(controller.btn_AddPlayList)
        controller.btn_AddPlayList.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: controller.btn_AddPlayList, attribute: .trailing, relatedBy: .equal, toItem: controller.contentView, attribute: .trailing, multiplier: 1, constant: -12)
        let cn2 = NSLayoutConstraint(item: controller.btn_AddPlayList, attribute: .top, relatedBy: .equal, toItem: controller.contentView, attribute: .top, multiplier: 1, constant: controller.contentView.center.y - 15)
        let cn3 = NSLayoutConstraint(item: controller.btn_AddPlayList, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        let cn4 = NSLayoutConstraint(item: controller.btn_AddPlayList, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add The PlayList Button
        playList(self)
        
        // Add The Play Button
        playButton(self)
        
    }
    
}
