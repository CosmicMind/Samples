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

class PhotoViewController: UIViewController {
  fileprivate var closeButton: IconButton!
  
  fileprivate var collectionView: UICollectionView!
  fileprivate var index: Int
  
  var dataSourceItems = [DataSourceItem]()
  
  public required init?(coder aDecoder: NSCoder) {
    index = 0
    super.init(coder: aDecoder)
  }
  
  public init(index: Int) {
    self.index = index
    super.init(nibName: nil, bundle: nil)
  }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    prepareCloseButton()
    preparePhotos()
    prepareCollectionView()
    prepareToolbar()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
}

extension PhotoViewController {
  func prepareCloseButton() {
    closeButton = IconButton(image: Icon.cm.close)
    closeButton.addTarget(self, action: #selector(handleCloseButton(button:)) , for: .touchUpInside)
  }
  
  fileprivate func preparePhotos() {
    PhotosDataSource.forEach { [weak self, w = view.bounds.width] in
      guard let image = UIImage(named: $0) else {
        return
      }
      
      self?.dataSourceItems.append(DataSourceItem(data: image, width: w))
    }
  }
  
  fileprivate func prepareCollectionView() {
    let w = view.bounds.width
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: w, height: w)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.isPagingEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = false
    collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    view.layout(collectionView).center(offsetY: -44).width(w).height(w)
    collectionView.scrollRectToVisible(CGRect(x: w * CGFloat(index), y: 0, width: w, height: w), animated: false)
  }
  
  func prepareToolbar() {
    guard let toolbar = toolbarController?.toolbar else {
      return
    }
    
    toolbar.titleLabel.text = "Photo Name"
    toolbar.detailLabel.text = "July 19 2017"
    toolbar.leftViews = [closeButton]
  }
}

extension PhotoViewController: CollectionViewDataSource {
  @objc
  open func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  @objc
  open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSourceItems.count
  }
  
  @objc
  open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
    
    guard let image = dataSourceItems[indexPath.item].data as? UIImage else {
      return cell
    }
    
    cell.imageView.image = image
    cell.imageView.motionIdentifier = "photo_\(indexPath.item)"
    
    return cell
  }
}

extension PhotoViewController: CollectionViewDelegate {}


fileprivate extension PhotoViewController {
  @objc
  func handleCloseButton(button: UIButton) {
    toolbarController?.transition(to: PhotoCollectionViewController())
  }
}
