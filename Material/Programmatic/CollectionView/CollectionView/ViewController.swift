/*
 * Copyright (C) 2015 - 2016, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.com>.
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

class ViewController: CollectionViewController {
    
    open override func prepare() {
        super.prepare()
        prepareDataSourceItems()
        prepareCollectionView()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
}

extension ViewController {
    fileprivate func prepareDataSourceItems() {
        let data = ["Daniel", "Eve", "John"]
        
        data.forEach { [unowned self] (item) in
            let card = Card()
//            let label = UILabel()
//            label.text = item
//            card.contentView = label
            let imageView = UIImageView()
            imageView.image = UIImage(named: "daniel")
            imageView.height = 300
            card.contentView = imageView
            self.dataSourceItems.append(CollectionViewDataSourceItem(data: card, height: card.height))
        }
    }
    
    fileprivate func prepareCollectionView() {
        collectionView.interimSpacePreset = .interimSpace4
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCollectionViewCell")
    }
}

extension ViewController {
    @objc
    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        let dataSourceItem = dataSourceItems[indexPath.item]
        let card = dataSourceItem.data as! Card
        cell.card = card
        return cell
    }
}
