# TableView picker with generic view models in swift.

It is simple example of viewcontroller with one tableView, which is initialized by generic type of model. Inside generic model is encapsulated all information about data and cell description (reusable identifier as well).


Example of model, which is populating tableview. In our case, it is Codable, because it is mapping json response from backend.
```
struct ExempleModel: Codable {
	var name: String
	var tid: Int
}

extension ExempleModel: GenericCellModel {
	var descriptor: CellDescriptor {
		return CellDescriptor(cellViewAnyModel: ExempleTableViewCellModel(category: self), reuseIdentifier: "ExempleTableViewCell", cellId: self.tid)
	}
}
```

Also about your cells, they should implement CellViewModel protocol with setup function. ExempleTableViewCellModel describe all info that must be presented in UITableViewCell.
```
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
   ```

Now, after your model is ready and implemented GenericCellModel protocol, you can initialize and push generic picker controller somewhere from you router/wireframe class.
```
   
     func openTableView(tableGeneric: TableGenericPicker<ExempleModel>, didSelect: @escaping (ExempleModel) -> Void) {
        let tableGeneric = TableGenericPicker<ExempleModel>(nibName:"TableGenericPicker", source: exempleModels, selectedSource: selectedModel)
        tableGeneric.didSelect = didSelect
        self.navigationController?.pushViewController(tableGeneric, animated: true)
    }
   ```