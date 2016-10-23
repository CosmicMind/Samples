/*
 * Copyright (C) 2015 - 2016, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.io>.
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
import Graph

class BeautyViewController: UIViewController {
    /// Model.
    internal var graph: Graph!
    internal var search: Search<Entity>!
    
    internal var data: [Entity] {
        var d = search.sync()
        
        if 0 == d.count {
            SampleData.createSampleData()
            d = search.sync()
        }
        
        return d.sorted { (a, b) -> Bool in
            return a.createdDate < b.createdDate
        }
    }
    
    /// View.
    internal var tableView: CardTableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        preparePageTabBarItem()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        preparePageTabBarItem()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.blueGrey.lighten5
        
        // Model.
        prepareGraph()
        prepareSearch()
        
        // Feed.
        prepareCardTableView()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.reloadData()
    }
    
    private func reloadData() {
        tableView.data = data
        
        guard let toolbar = toolbarController?.toolbar else {
            return
        }
        
        toolbar.detail = "\(tableView.data.count) Items"
    }
}

/// Model.
extension BeautyViewController {
    internal func prepareGraph() {
        graph = Graph()
        
        // Uncomment to clear the Graph data.
//        graph.clear()
    }
    
    internal func prepareSearch() {
        search = Search<Entity>(graph: graph).for(types: "Item")
    }
}

/// PageTabBar.
extension BeautyViewController {
    internal func preparePageTabBarItem() {
        pageTabBarItem.title = "Beauty"
        pageTabBarItem.titleColor = .white
    }
}

/// Feed.
extension BeautyViewController {
    internal func prepareCardTableView() {
        tableView = CardTableView()
        view.layout(tableView).edges()
    }
}
