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
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
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
        
        
        let card1 = ImageCard()
        card1.pulseAnimation = .none
        card1.toolbar = Toolbar()
        card1.toolbar?.backgroundColor = nil

        card1.toolbar?.title = "Test"
        card1.toolbar?.titleLabel.textColor = .white
        
        let imageView1 = UIImageView()
        imageView1.image = UIImage(named: "LaLuna")?.resize(toWidth: view.width)
        imageView1.clipsToBounds = true
        imageView1.contentMode = .scaleToFill
        imageView1.backgroundColor = .black
        card1.imageView = imageView1
        
        let card2 = ImageCard()
        card2.pulseAnimation = .none
        card2.toolbar = Toolbar()
        card2.toolbar?.backgroundColor = nil
        
        card2.toolbar?.title = "Test"
        card2.toolbar?.titleLabel.textColor = .white
        
        let imageView2 = UIImageView()
        imageView2.image = UIImage(named: "LaLuna")?.resize(toWidth: view.width)
        imageView2.clipsToBounds = true
        imageView2.contentMode = .scaleToFill
        imageView2.backgroundColor = .black
        card2.imageView = imageView2
        
        collectionViewCard.dataSourceItems.append(DataSourceItem(data: card1))
//        collectionViewCard.dataSourceItems.append(DataSourceItem(data: card2))
        collectionViewCard.collectionView.reloadData()
        
        view.layout(collectionViewCard).edges()
    }
    
    fileprivate func prepareFABButton() {
        fabButton = FABButton(image: Icon.cm.play, tintColor: .white)
        fabButton.backgroundColor = Color.blue.base
        fabButton.depthPreset = .depth1
        fabButton.pulseColor = .white
        fabButton.width = 64
        fabButton.height = 64
    }
    
    fileprivate func prepareBottomSheet() {
        guard let v = bottomSheetController else {
            return
        }
        
        v.bottomSheetStyle = .persistent
        v.bottomSheet.fabButton = fabButton
        v.bottomSheet.backgroundColor = Color.green.base
        v.setBottomSheetHeight(height: view.bounds.height - collectionViewCard.height, isHidden: false, animated: false)
    }
}
