/*
 * Copyright (C) 2015 - 2017, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.com>.
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

class AudioPlayerViewController: UIViewController {
    fileprivate var toolbar: Toolbar!
    
    fileprivate var collectionViewCard: CollectionViewCard!
    
    fileprivate var fabButton: FABButton!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        prepareToolbar()
        prepareFABButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareImageCollectionViewCard()
        prepareBottomSheet()
    }
}

extension AudioPlayerViewController {
    fileprivate func prepareToolbar() {
//        toolbar = Toolbar()
//        toolbar.backgroundColor = nil
    }
    
    fileprivate func prepareImageCollectionViewCard() {
        collectionViewCard = CollectionViewCard()
        collectionViewCard.backgroundColor = nil
        collectionViewCard.depthPreset = .none
//        imageCollectionViewCard.toolbar = toolbar
        
        
        let card = ImageCard()
        card.toolbar = Toolbar()
        card.toolbar?.title = "Test"
        
        card.bottomBar = Toolbar()
        card.bottomBar?.backgroundColor = nil
        (card.bottomBar as? Toolbar)?.detail = "Music song"
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LaLuna")?.resize(toWidth: view.width)
//        imageView.contentMode = .scaleAspectFit
        card.imageView = imageView
        
        collectionViewCard.dataSourceItems.append(DataSourceItem(data: card))
        collectionViewCard.collectionView.reloadData()
        
        view.layout(collectionViewCard).edges()
    }
    
    fileprivate func prepareFABButton() {
        fabButton = FABButton(image: Icon.cm.play)
        fabButton.width = 64
        fabButton.height = 64
    }
    
    fileprivate func prepareBottomSheet() {
        guard let v = bottomSheetController else {
            return
        }
        
        v.bottomSheetLayoutStyle = .flat
        v.bottomSheet.fabButton = fabButton
    }
}
