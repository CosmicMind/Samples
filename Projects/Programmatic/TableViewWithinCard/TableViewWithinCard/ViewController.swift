/*
 * Copyright (C) 2015 - 2018, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.com>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *	*	Redistributions of source code must retain the above copyright notice, this
 *		list of conditions and the following disclaimer.
 *
 *	*	Redistributions in binary form must reproduce the above copyright notice,
 *		this list of conditions and the following disclaimer in the documentation
 *		and/or other materials provided with the distribution.
 *
 *	*	Neither the name of CosmicMind nor the names of its
 *		contributors may be used to endorse or promote products derived from
 *		this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit
import Material

class ViewController: UIViewController {
    /**
     Retrieves the data source items for the tableView.
     - Returns: An Array of DataSourceItem objects.
     */
    open var dataSourceItems = [DataSourceItem]()

    fileprivate var toolbar: Toolbar!
    fileprivate var tableView: TableView!
    fileprivate var card: Card!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        prepareToolbar()
        prepareTableView()
        prepareCard()
        prepareData()
     }
}

extension ViewController {
    fileprivate func prepareToolbar() {
        toolbar = Toolbar()
        toolbar.title = "TableView Within Card"
        toolbar.detail = "Sample"
    }
    
    fileprivate func prepareTableView() {
        tableView = TableView()
        tableView.height = 300
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    fileprivate func prepareCard() {
        card = Card()
        card.toolbar = toolbar
        card.contentView = tableView
        view.layout(card).horizontally(left: 20, right: 20).center()
    }
    
    fileprivate func prepareData() {
        let persons = [["name": "Daniel"], ["name": "Sarah"]]
        for person in persons {
            dataSourceItems.append(DataSourceItem(data: person))
        }
        tableView.reloadData()
    }
}

extension ViewController: TableViewDelegate {}

extension ViewController: TableViewDataSource {
    @objc
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @objc
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    @objc
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        guard let data = dataSourceItems[indexPath.row].data as? [String: String] else {
            return cell
        }
        
        cell.textLabel?.text = data["name"]
        
        return cell
    }
}
