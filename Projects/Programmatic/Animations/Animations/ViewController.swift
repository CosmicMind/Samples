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
import Motion

class ViewController: UIViewController {
    fileprivate var animatedView = UIView()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareAnimatedView()
        
//        animateBackgroundColor()
//        animateBorderColor()
//        animateCornerRadius()
//        animateRotate()
//        animateSpin()
//        animateScale()
//        animateTranslate()
//        animatePosition()
//        animateFade()
//        animateZPosition()
//        animateSize()
//        animateDepth()
        animateSpring()
    }
}

extension ViewController {
    fileprivate func prepareView() {
        view.backgroundColor = .white
    }
    
    fileprivate func prepareAnimatedView() {
        view.layout(animatedView).center().width(100).height(100)
    }
}

extension ViewController {
    fileprivate func animateBackgroundColor() {
        animatedView.shapePreset = .circle
        animatedView.backgroundColor = Color.blue.base
        animatedView.animate(.delay(1), .duration(1), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .background(color: Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateBorderColor() {
        animatedView.shapePreset = .circle
        animatedView.borderColor = Color.blue.base
        animatedView.borderWidthPreset = .border3
        animatedView.animate(.delay(1), .duration(1), .border(color: Color.green.base), .border(width: CGFloat(BorderWidthPreset.border8.rawValue * 2)))
        animatedView.animate(.delay(3), .duration(1), .border(color: Color.blue.base), .border(width: CGFloat(BorderWidthPreset.border3.rawValue)))
    }
}

extension ViewController {
    fileprivate func animateCornerRadius() {
        animatedView.backgroundColor = Color.blue.base
        animatedView.animate(.delay(1), .duration(1), .corner(radius: 50), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .corner(radius: 0), .background(color: Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateRotate() {
        animatedView.backgroundColor = Color.blue.base
        animatedView.animate(.delay(1), .duration(1), .rotate(180), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .rotate(0), .background(color: Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateSpin() {
        animatedView.backgroundColor = Color.blue.base
        animatedView.animate(.delay(1), .duration(1), .spin(x: 1, y: 1, z: 1), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .spin(-1), .background(color: Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateScale() {
        animatedView.backgroundColor = Color.blue.base
        animatedView.shapePreset = .circle
        animatedView.animate(.delay(1), .duration(1), .scale(3), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .scale(), .background(color: Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateTranslate() {
        let point = animatedView.center
        
        animatedView.backgroundColor = Color.blue.base
        animatedView.shapePreset = .circle
        animatedView.animate(.delay(1), .translate(x: 20, y: 100), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .translate(point), .background(color: Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animatePosition() {
        let point = view.center
        
        animatedView.backgroundColor = Color.blue.base
        animatedView.shapePreset = .circle
        animatedView.animate(.delay(1), .duration(1), .position(CGPoint(x: 100, y: 100)), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .position(point), .background(color: Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateFade() {
        animatedView.backgroundColor = Color.blue.base
        animatedView.shapePreset = .circle
        animatedView.animate(.delay(1), .duration(1), .fadeOut, .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .fadeIn, .background(color: Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateZPosition() {
        let v = UIView()
        v.zPosition = 10
        v.backgroundColor = Color.red.base
        view.layout(v).center().width(150).height(150)
        
        animatedView.backgroundColor = Color.blue.base
        animatedView.shapePreset = .circle
        animatedView.animate(.delay(1), .duration(1), .zPosition(v.zPosition + 1), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .zPosition(v.zPosition - 1), .background(color: Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateSize() {
        let size = animatedView.bounds.size
        
        animatedView.backgroundColor = Color.blue.base
        animatedView.animate(.delay(1), .duration(1), .size(CGSize(width: 200, height: 200)), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .size(size), .background(color: Color.blue.base))
    }
}

extension ViewController {
    /**
     The depth animation is made up of the following animations:
     
     .shadow(offset:)
     .shadow(opacity:)
     .shadow(radius:)
     */
    fileprivate func animateDepth() {
        animatedView.depthPreset = .depth5
        
        animatedView.backgroundColor = Color.blue.base
        animatedView.animate(.delay(1), .duration(1), .depth(.depth1), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .depth(.depth5), .background(color: Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateSpring() {
        let size = animatedView.bounds.size
        
        animatedView.backgroundColor = Color.blue.base
        animatedView.animate(.delay(1), .duration(1), .size(CGSize(width: 200, height: 200)), .background(color: Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .size(size), .spring(stiffness: 250, damping: 30), .background(color: Color.blue.base))
    }
}
