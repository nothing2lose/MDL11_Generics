//
//  TableViewController.swift
//  TableTest
//
//  Created by Igors Nemenonoks on 27/08/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    internal let viewModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 50
        self.tableView.tableFooterView = UIView()
        
//        viewModel.cellTypes.forEach({
//            self.tableView.register($0, forCellReuseIdentifier: )
//        })
        
        self.tableView.register(Test1Config.cellType, forCellReuseIdentifier: Test1Config.reuseId)
        self.tableView.register(Test2Config.cellType, forCellReuseIdentifier: Test2Config.reuseId)
        
//        let v = Custom1View(frame: .zero)
//        v.configure(data: <#T##Custom1View.ViewModel#>)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]
                

        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
        item.configure(cell: cell)

        return cell
    }
}
