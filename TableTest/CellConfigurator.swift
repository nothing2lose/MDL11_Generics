//
//  CellConfigurator.swift
//  TableTest
//
//  Created by Igors Nemenonoks on 30/08/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import UIKit

// MARK: - Default Implementations
protocol ConfigurableCell {
//    associatedtype DataType
//    func configure(data: DataType)
    associatedtype ViewType: ConfigurableCellContainerView
    var view: ViewType { get }
}
extension ConfigurableCell {
    static var reuseId: String {
        return String(describing: ViewType.self)
    }
}

protocol ConfigurableCellContainerView: UIView {
    associatedtype DataType
    func configure(data: DataType)
}

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView)
}

class TableCellConfigurator<CellType: ConfigurableCell, ViewType>: CellConfigurator where CellType.ViewType == ViewType, CellType: UITableViewCell {
    
    static var cellType: CellType.Type { return CellType.self }
    static var reuseId: String { return CellType.reuseId }
    
    let item: ViewType.DataType
    
    init(item: ViewType.DataType) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        (cell as! CellType).view.configure(data: item)
    }
}
