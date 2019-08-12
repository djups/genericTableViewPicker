//
//  ViewController.swift
//  TableGeneric
//
//  Created by Alexei Jovmir on 8/12/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var exempleModels = [ExempleModel]()
    var selectedModel: ExempleModel?
    @IBOutlet weak var pickerResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerResult.text = ""
        generateModels()
    }

    @IBAction func openPicker(_ sender: Any) {
        let tableGeneric = TableGenericPicker<ExempleModel>(nibName:"TableGenericPicker", source: exempleModels, selectedSource: selectedModel)
        
        openTableView(tableGeneric: tableGeneric) { [unowned self](exemple) in
            tableGeneric.navigationController?.popViewController(animated: true)
            self.pickerResult.text = exemple.exempleName
            self.selectedModel = exemple
        }
    }
    
    func openTableView(tableGeneric: TableGenericPicker<ExempleModel>, didSelect: @escaping (ExempleModel) -> Void) {
        tableGeneric.title = "Exemple Picker"
        tableGeneric.didSelect = didSelect
        self.navigationController?.pushViewController(tableGeneric, animated: true)
    }
    
    func generateModels() {
        let exemple1 = ExempleModel(exempleName: "exemple 1", exempleID: 1)
        let exemple2 = ExempleModel(exempleName: "exemple 2", exempleID: 2)
        let exemple3 = ExempleModel(exempleName: "exemple 3", exempleID: 3)
        let exemple4 = ExempleModel(exempleName: "exemple 4", exempleID: 4)
        exempleModels.append(contentsOf: [exemple1, exemple2, exemple3, exemple4])
    }
}

