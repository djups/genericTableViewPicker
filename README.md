# TableView picker with generic view models in swift.

It is simple example of viewcontroller with one tableView, which is initialized by generic type of model. Inside generic model is encapsulated all information about data and cell description (reusable identifier as well).


Example of model, which is populating tableview
```
struct CategoryForm: Codable {
	var name: String
	var tid: Int
}

extension CategoryForm: GenericCellModel {
	var descriptor: CellDescriptor {
		return CellDescriptor(cellViewAnyModel: CategoryFormTableViewCellModel(category: self), reuseIdentifier: "CategoryFormTableViewCell", cellId: self.tid)
	}
}
```
