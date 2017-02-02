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

open class TransitionedViewController: UIViewController {
    let fabButton = FABButton(image: Icon.cm.add)
    
    let bar = Bar()
    
    let container = UIView()
    
    let imageView = UIImageView()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        isMotionTransitionEnabled = true
        
        view.backgroundColor = Color.purple.lighten3
        view.motionTransitionAnimations = [.duration(3)]
        
        let d = view.bounds.width
        
        container.backgroundColor = Color.red.base
        container.motionTransitionIdentifier = "container"
        view.layout(container).width(d)
        
        imageView.image = UIImage(named: "surf")
        imageView.backgroundColor = Color.red.base
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.motionTransitionIdentifier = "card"
        view.layout(imageView).width(d).height(d).top()
        
        view.layout(container).height(view.bounds.height - imageView.bounds.height - bar.bounds.height).top(d)
        
        let b1 = IconButton(image: Icon.cm.videocam)
        b1.opacity = 0
        b1.motion(.delay(0.5), .duration(1), .fade(1))
        
        let b2 = IconButton(image: Icon.cm.videocam)
        b2.opacity = 0
        b2.motion(.delay(0.5), .duration(1), .fade(1))
        
        let b3 = IconButton(image: Icon.cm.videocam)
        b3.opacity = 0
        b3.motion(.delay(0.5), .duration(1), .fade(1))
        
        let b4 = IconButton(image: Icon.cm.videocam)
        b4.opacity = 0
        b4.motion(.delay(0.5), .duration(1), .fade(1))
        
        let b5 = IconButton(image: Icon.cm.videocam)
        b5.opacity = 0
        b5.motion(.delay(0.5), .duration(1), .fade(1))
        
        bar.centerViews = [b1, b2, b3, b4, b5]
        bar.motionTransitionIdentifier = "button"
        bar.backgroundColor = Color.purple.lighten5
        view.layout(bar).bottom().horizontally()
        
        Motion.delay(3) { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}
