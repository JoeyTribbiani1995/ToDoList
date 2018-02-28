//
//  ToDoDetailTableViewCell.swift
//  ToDoList
//
//  Created by Dũng Võ on 2/28/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

@objc protocol ToDoCellDelegate : class {
    func checkmarkTapped(sender : ToDoTableViewCell)
}
class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate : ToDoCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCells(with toDo : ToDo){
        titleLabel.text = toDo.title
        isCompleteButton.isSelected = toDo.isComplete
        if isCompleteButton.isSelected {
            isCompleteButton.setImage(#imageLiteral(resourceName: "Checked"), for: .normal)
        }else {
            isCompleteButton.setImage(#imageLiteral(resourceName: "Unchecked"), for: .normal)
        }
    }
    
    @IBAction func completeButtonTapped() {
        delegate?.checkmarkTapped(sender: self)
    }
    
   
    
    

}
