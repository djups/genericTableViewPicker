
import UIKit

struct CellDescriptor {
    var cellViewAnyModel: CellViewAnyModel
    let reuseIdentifier: String
    let cellId: Int
}

protocol CellViewAnyModel {
    static var CellAnyType: UIView.Type {get}
    func setupAny(cell: UIView)
}

protocol CellViewModel: CellViewAnyModel {
    associatedtype CellType: UIView
    func setup(cell: CellType)
}

extension CellViewModel {
    static var CellAnyType: UIView.Type {
        return CellType.self
    }
    func setupAny(cell: UIView) {
        setup(cell: cell as! CellType)
    }
}

extension UITableView {
    func dequeueReusableCell(with model: CellViewAnyModel, for indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: type(of: model).CellAnyType)
        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        model.setupAny(cell: cell)
        return cell
    }
}

extension UICollectionView {
    func dequeueReusableCell(with model: CellViewAnyModel, for indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: type(of: model).CellAnyType)
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        model.setupAny(cell: cell)
        return cell
    }
}
