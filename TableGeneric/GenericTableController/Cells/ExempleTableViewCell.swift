//
//  ViewController.swift
//  TableGeneric
//
//  Created by Alexei Jovmir on 8/12/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

class ExempleTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var exempleName: UILabel!
}

struct ExempleTableViewCellModel {
    let exemple: ExempleModel
}

extension ExempleTableViewCellModel: CellViewModel {
    func setup(cell: ExempleTableViewCell) {
        cell.exempleName.text = exemple.exempleName
    }
}
