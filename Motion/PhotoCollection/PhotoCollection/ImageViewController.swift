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

class ImageViewController: UIViewController {
    fileprivate let b1 = FlatButton(image: Icon.cm.photoLibrary, tintColor: .white)
    fileprivate let b2 = FlatButton(image: Icon.audio, tintColor: .white)
    fileprivate let b3 = FlatButton(image: Icon.cm.image, tintColor: .white)
    fileprivate let b4 = FlatButton(image: Icon.addCircle, tintColor: .white)
    fileprivate let b5 = FlatButton(image: Icon.cm.moreVertical, tintColor: .white)
    
    fileprivate let tabBar = TabBar()
    fileprivate var image: UIImage?
    open let imageView = UIImageView()
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        isMotionEnabled = true
        motionDelegate = self
        
        view.backgroundColor = .black
        
        prepareTabBar()
        prepareImageView()
        
        Motion.delay(time: 3) { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}

extension ImageViewController: MotionDelegate {
    func motion(transition: MotionTransition, willTransition toView: UIView, fromView: UIView) {
        b1.image = nil
        b2.image = nil
        b3.image = nil
        b4.image = nil
        b5.image = nil
    }
}

extension ImageViewController {
    fileprivate func prepareTabBar() {
        let animations: [MotionAnimation] = [.delay(0.5), .duration(1), .fade(1)]
        
        b1.opacity = 0
        b1.motion(animations)
        
        b2.opacity = 0
        b2.motion(animations)
        
        b3.opacity = 0
        b3.motion(animations)
        
        b4.opacity = 0
        b4.motion(animations)
        
        b5.opacity = 0
        b5.motion(animations)
        
        tabBar.buttons = [b1, b2, b3, b4, b5]
        tabBar.motionIdentifier = "options"
        tabBar.backgroundColor = Color.grey.darken4
        view.layout(tabBar).bottom().horizontally()
    }
    
    fileprivate func prepareImageView() {
        imageView.image = image
        imageView.clipsToBounds = true
        view.layout(imageView).horizontally().height(350).center()
    }
}
