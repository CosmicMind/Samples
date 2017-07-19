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

class PurpleViewController: UIViewController {
    fileprivate var v1 = View()
    fileprivate var v2 = View()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareTransitionViews()
        prepareAnimation()
        
        Motion.delay(2) { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}

extension PurpleViewController {
    fileprivate func prepareView() {
        isMotionEnabled = true
        view.backgroundColor = .white
    }
    
    fileprivate func prepareTransitionViews() {
        v1.backgroundColor = Color.deepOrange.base
        v2.backgroundColor = Color.blueGrey.lighten3
    }
    
    fileprivate func prepareAnimation() {
        animationMatch()
//        animationScale()
//        animationTranslate()
//        animationRotate()
//        animationArc()
    }
}

extension PurpleViewController {
    fileprivate func animationMatch() {
        v1.motionIdentifier = "v1"
        view.layout(v1).top().horizontally().height(200)
        
        v2.motionIdentifier = "v2"
        view.layout(v2).bottom().horizontally().height(70)
    }
    
    fileprivate func animationScale() {
        v1.cornerRadius = 15
        view.layout(v1).center(offsetY: 50).width(200).height(200)
        v1.transition(.scale(0.3), .corner(radius: 15))
        
        v2.motionIdentifier = "v2"
        v2.cornerRadius = 15
        view.layout(v2).center(offsetY: -100).width(200).height(50)
    }
    
    fileprivate func animationTranslate() {
        v1.cornerRadius = 15
        view.layout(v1).center(offsetY: 50).width(200).height(200)
        v1.transition(.translate(x: -200), .corner(radius: 15))
        
        v2.motionIdentifier = "v2"
        v2.cornerRadius = 15
        view.layout(v2).center(offsetY: -100).width(200).height(50)
    }
    
    fileprivate func animationRotate() {
        v1.cornerRadius = 15
        view.layout(v1).center(offsetY: 50).width(200).height(200)
        v1.transition(.translate(x: -200, y: 100), .rotate(270), .corner(radius: 15))
        
        v2.motionIdentifier = "v2"
        v2.cornerRadius = 15
        view.layout(v2).center(offsetY: -100).width(200).height(50)
    }
    
    fileprivate func animationArc() {
        v2.motionIdentifier = "v2"
        v2.shapePreset = .circle
        v2.transition(.arc())
        view.layout(v2).center(offsetX: -100, offsetY: -100).width(100).height(100)
    }
}
