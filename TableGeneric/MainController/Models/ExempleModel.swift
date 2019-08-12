struct ExempleModel {
    var exempleName: String
    var exempleID: Int
}

extension ExempleModel: GenericCellModel {
    var descriptor: CellDescriptor {
        return CellDescriptor(cellViewAnyModel: ExempleTableViewCellModel(exemple: self), reuseIdentifier: "ExempleTableViewCell", cellId: self.exempleID)
    }
}
