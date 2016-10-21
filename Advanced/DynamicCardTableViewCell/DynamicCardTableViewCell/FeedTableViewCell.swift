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

class FeedTableViewCell: TableViewCell {
    private let padding: CGFloat = 10
    
    public lazy var card: PresenterCard = PresenterCard()
    
    /// Toolbar views.
    private var toolbar: Toolbar!
    private var moreButton: IconButton!
    
    /// Presenter area.
    private var presenterImageView: UIImageView!
    
    /// Content area.
    private var contentLabel: UILabel!
    
    /// Bottom Bar views.
    private var bottomBar: Bar!
    private var dateFormatter: DateFormatter!
    private var dateLabel: UILabel!
    private var favoriteButton: IconButton!
    private var shareButton: IconButton!
    
    public var data: Entity? {
        didSet {
            layoutSubviews()
        }
    }
    
    /// Calculating dynamic height.
    open override var height: CGFloat {
        get {
            var h = 2 * padding
            
            h += toolbar.height
            h += bottomBar.height
            
            var imageH = presenterImageView.image?.size.height ?? 0
            if 300 < imageH {
                imageH = 300
            }
            
            h += imageH
            
            if let v = contentLabel.text {
                h += contentLabel.font.stringSize(string: v, constrainedToWidth: Double(bounds.width - card.contentViewEdgeInsets.left - card.contentViewEdgeInsets.right)).height
                h += card.contentViewEdgeInsets.top + card.contentViewEdgeInsets.bottom
            }
            
            return h
        }
        set(value) {
            super.height = value
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let d = data else {
            return
        }
        
        toolbar.title = d["title"] as? String
        toolbar.detail = d["detail"] as? String
        presenterImageView.image = d["photo"] as? UIImage
        contentLabel.text = d["content"] as? String
        dateLabel.text = dateFormatter.string(from: d.createdDate)
        
        card.layoutSubviews()
    }
    
    open override func prepare() {
        super.prepare()
        layer.rasterizationScale = Device.scale
        layer.shouldRasterize = true
        
        pulseAnimation = .none
        backgroundColor = .clear
        
        prepareDateFormatter()
        prepareDateLabel()
        prepareMoreButton()
        prepareToolbar()
        prepareFavoriteButton()
        prepareShareButton()
        preparePresenterImageView()
        prepareContentLabel()
        prepareBottomBar()
        preparePresenterCard()
    }
    
    private func prepareDateFormatter() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }
    
    private func prepareDateLabel() {
        dateLabel = UILabel()
        dateLabel.font = RobotoFont.regular(with: 12)
        dateLabel.textColor = Color.blueGrey.base
        dateLabel.textAlignment = .center
    }
    
    private func prepareMoreButton() {
        moreButton = IconButton(image: Icon.cm.moreVertical, tintColor: Color.blueGrey.base)
    }
    
    private func prepareFavoriteButton() {
        favoriteButton = IconButton(image: Icon.favorite, tintColor: Color.red.base)
    }
    
    private func prepareShareButton() {
        shareButton = IconButton(image: Icon.cm.share, tintColor: Color.blueGrey.base)
    }
    
    private func prepareToolbar() {
        toolbar = Toolbar()
        toolbar.contentEdgeInsets.left = 16
        toolbar.titleLabel.textAlignment = .left
        toolbar.detailLabel.textAlignment = .left
        toolbar.rightViews = [moreButton]
    }
    
    private func preparePresenterImageView() {
        presenterImageView = UIImageView()
        presenterImageView.clipsToBounds = true
        presenterImageView.contentMode = .scaleAspectFill
    }
    
    private func prepareContentLabel() {
        contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.font = RobotoFont.regular(with: 14)
    }
    
    private func prepareBottomBar() {
        bottomBar = Bar()
        bottomBar.contentViewAlignment = .center
        bottomBar.centerViews = [dateLabel]
        bottomBar.leftViews = [favoriteButton]
        bottomBar.rightViews = [shareButton]
    }
    
    private func preparePresenterCard() {
        card.toolbar = toolbar
        card.presenterView = presenterImageView
        card.contentView = contentLabel
        card.contentViewEdgeInsetsPreset = .square3
        card.bottomBar = bottomBar
        card.isShadowPathAutoSizing = true
        
        layout(card).edges(top: padding, left: padding, bottom: padding / 2, right: padding)
    }
}
