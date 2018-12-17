//
//  ViewSongs.swift
//  SQLite_Music
//
//  Created by Viet Asc on 12/11/18.
//  Copyright © 2018 Viet Asc. All rights reserved.
//

import UIKit

// SelectedItem
class ViewSongs: ViewControllerTableBase {
    
    var dataSong = { (_ statement: String, _ controller: ViewSongs) in
        
        controller.items = controller.dataBase.viewDataBase("SONGS", ["*"], statement, controller.dataBase.getPath())
        controller.myTableView.reloadData()
        
    }
    
    @objc override func chooseOrder() {
        dataSong("Order by SongName ASC", self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txt_Search.delegate = self
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(TableViewCellSong.self, forCellReuseIdentifier: "Cell")
        
        dataSong("", self)
        artistBySongID(self)
        
    }
    
}

extension ViewSongs: UITableViewDataSource {
    
    // Number of Cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    // Data For Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCellSong
        let currentItem = items[indexPath.row]
        cell.img_Detail.image = UIImage(named: currentItem["UrlImg"] as! String)
        cell.lbl_name.text = currentItem.object(forKey: "SongName") as? String
        cell.lbl_info.text = artists[indexPath.row]
        return cell
        
    }
    
    
}

extension ViewSongs: UITableViewDelegate {
    
    // Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
        
    }
    
}

extension ViewSongs: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var statement = ""
        if string == "" {
            if !(textField.text?.isEmpty)! {
                statement = (textField.text! as NSString).substring(to: (textField.text?.count)! - 1)
            } else {
                statement = ""
            }
        } else {
            statement = "\(textField.text!)\(string)"
        }
        if statement == "A" {
            statement = "Á"
        }
        dataSong("Where SongName Like '\(statement)%'", self)
        return true
        
    }
    
}
