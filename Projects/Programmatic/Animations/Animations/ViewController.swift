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
        animateSpin()
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
        animatedView.animate(.delay(1), .duration(1), .backgroundColor(Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .backgroundColor(Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateBorderColor() {
        animatedView.shapePreset = .circle
        animatedView.borderColor = Color.blue.base
        animatedView.borderWidthPreset = .border3
        animatedView.animate(.delay(1), .duration(1), .borderColor(Color.green.base), .borderWidth(CGFloat(BorderWidthPreset.border8.rawValue * 2)))
        animatedView.animate(.delay(3), .duration(1), .borderColor(Color.blue.base), .borderWidth(CGFloat(BorderWidthPreset.border3.rawValue)))
    }
}

extension ViewController {
    fileprivate func animateCornerRadius() {
        animatedView.backgroundColor = Color.blue.base
        animatedView.animate(.delay(1), .duration(1), .cornerRadius(50), .backgroundColor(Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .cornerRadius(0), .backgroundColor(Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateRotate() {
        animatedView.backgroundColor = Color.blue.base
        animatedView.animate(.delay(1), .duration(1), .rotate(x: 180, y: 0, z: 135), .backgroundColor(Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .rotate(x: 0, y: 0, z: 0), .backgroundColor(Color.blue.base))
    }
}

extension ViewController {
    fileprivate func animateSpin() {
        animatedView.backgroundColor = Color.blue.base
        animatedView.animate(.delay(1), .duration(1), .rotate(x: 180, y: 0, z: 135), .backgroundColor(Color.green.base))
        animatedView.animate(.delay(3), .duration(1), .rotate(x: 0, y: 0, z: 0), .backgroundColor(Color.blue.base))
    }
}
