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

class PhotoCollectionViewController: UIViewController {
  fileprivate var collectionView: UICollectionView!
  fileprivate var images = [UIImage]()
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    preparePhotos()
    prepareTabBar()
    prepareCollectionView()
    prepareToolbar()
  }
}

fileprivate extension PhotoCollectionViewController {
  func preparePhotos() {
    PhotosDataSource.forEach { [weak self] in
      guard let image = UIImage(named: $0) else {
        return
      }
      self?.images.append(image)
    }
  }
  
  func prepareTabBar() {
    tabsController?.tabBar.motionIdentifier = "options"
  }
  
  func prepareCollectionView() {
    let columns: CGFloat = .phone == Device.userInterfaceIdiom ? 4 : 11
    let w: CGFloat = (view.bounds.width - columns - 1) / columns
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 1
    layout.minimumInteritemSpacing = 1
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: w, height: w)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    collectionView.backgroundColor = .clear
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.showsHorizontalScrollIndicator = false
    view.layout(collectionView).horizontally().top().bottom()
    
    collectionView.reloadData()
  }
  
  func prepareToolbar() {
    guard let toolbar = toolbarController?.toolbar else {
      return
    }
    
    toolbar.titleLabel.text = "@NatuarllyCosmic"
    toolbar.detailLabel.text = "natuarllycosmic.com"
    toolbar.leftViews = []
  }
}

extension PhotoCollectionViewController: UICollectionViewDataSource {
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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
    
    cell.imageView.image = images[indexPath.item]
    cell.imageView.motionIdentifier = "photo_\(indexPath.item)"
    cell.transition(.fadeOut, .scale(0.75))
    
    return cell
  }
}

extension PhotoCollectionViewController: UICollectionViewDelegate {
  @objc
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    toolbarController?.transition(to: PhotoViewController(index: indexPath.item))
  }
}

