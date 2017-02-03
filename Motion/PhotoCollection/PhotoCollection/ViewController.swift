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
import Motion

class ViewController: UIViewController {
    fileprivate var collectionView: UICollectionView!
    
    fileprivate let data = ["daniel", "surf_crow", "surf_handstand"]
    fileprivate var images = [UIImage]()
    
    fileprivate var fabButton: FabButton!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        isMotionEnabled = true
        motionDelegate = self
        
        view.backgroundColor = .white
        
        prepareDataSourceItems()
        prepareCollectionView()
        prepareFABButton()
    }
}

extension ViewController {
    fileprivate func prepareDataSourceItems() {
        data.forEach {
            guard let image = UIImage(named: $0) else {
                return
            }
            self.images.append(image)
        }
    }
    
    fileprivate func prepareCollectionView() {
        let columns: CGFloat = .phone == Device.userInterfaceIdiom ? 3 : 11
        let w: CGFloat = (view.bounds.width - (columns - 1)) / columns
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: w, height: w)
        layout.sectionHeadersPinToVisibleBounds = true
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        view.layout(collectionView).horizontally().height(w).center()
        collectionView.reloadData()
    }
    
    fileprivate func prepareFABButton() {
        fabButton = FabButton(image: Icon.cm.photoCamera, tintColor: .white)
        fabButton.backgroundColor = Color.blue.base
        fabButton.motionIdentifier = "options"
        view.layout(fabButton).width(64).height(64).bottom(24).right(24)
    }
}

extension ViewController: MotionDelegate {
    func motion(transition: MotionTransition, willTransition toView: UIView, fromView: UIView) {
        fabButton.image = nil
    }
    
    func motion(transition: MotionTransition, didTransition toView: UIView, fromView: UIView) {
        fabButton.image = Icon.cm.photoCamera
    }
}

extension ViewController: UICollectionViewDataSource {
    @objc
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    @objc
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    @objc
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = images[indexPath.item]
        cell.motionIdentifier = data[indexPath.item]
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    @objc
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ImageViewController(image: images[indexPath.item])
        vc.imageView.motionIdentifier = data[indexPath.item]
        present(vc, animated: true)
    }
}
