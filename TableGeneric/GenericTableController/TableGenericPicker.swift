//
//  ViewController.swift
//  TableGeneric
//
//  Created by Alexei Jovmir on 8/12/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

protocol GenericCellModel {
    var descriptor: CellDescriptor { get }
}

class TableGenericPicker<T: GenericCellModel>: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
  
    var didSelect: (T) -> () = { _ in }
    var source: [T] = [T]()
    var selectedSource: T?
    
    init(nibName: String, source: [T], selectedSource: T?) {
        self.source = source
        self.selectedSource = selectedSource
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        register()
    }
 
    private func register() {
        source.compactMap({$0.descriptor.reuseIdentifier}).forEach({
            tableView.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model: CellViewAnyModel
        let genericModel = source[indexPath.row]
        model = genericModel.descriptor.cellViewAnyModel
        let cell = tableView.dequeueReusableCell(with: model, for: indexPath)

        if let selectedCell = selectedSource {
            cell.backgroundColor = (selectedCell.descriptor.cellId == genericModel.descriptor.cellId) ? UIColor.gray : UIColor.white
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = source[indexPath.row]
        selectedSource = item
        didSelect(item)
        tableView.reloadData()
    }
}
