/*
* Copyright (C) 2015 - 2018, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.com>.
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

class PurpleViewController: UIViewController {
	fileprivate var label = UILabel()
	
	open override func viewDidLoad() {
		super.viewDidLoad()
		prepareView()
		prepareLabel()
		prepareTransition()
		
		Motion.delay(2) { [weak self] in
			self?.dismiss(animated: true)
		}
	}
}

extension PurpleViewController {
	fileprivate func prepareView() {
		isMotionEnabled = true
		view.backgroundColor = Color.pink.base
	}
	
	fileprivate func prepareLabel() {
		view.layout(label).edges()
		label.text = "2"
		label.textAlignment = .center
		label.font = RobotoFont.medium(with: 400)
	}
	
	fileprivate func prepareTransition() {
		//        transitionPush()
		//        transitionPull()
		//        transitionCover()
		//        transitionUncover()
		//        transitionSlide()
		//        transitionZoomSlide()
		//        transitionPageIn()
		//        transitionPageOut()
		//        transitionFade()
		//        transitionZoom()
		transitionZoomOut()
	}
}

extension PurpleViewController {
	fileprivate func transitionPush() {
		motionTransitionType = .autoReverse(presenting: .push(direction: .left))
	}
}

extension PurpleViewController {
	fileprivate func transitionPull() {
		motionTransitionType = .autoReverse(presenting: .pull(direction: .right))
	}
}

extension PurpleViewController {
	fileprivate func transitionCover() {
		motionTransitionType = .autoReverse(presenting: .cover(direction: .up))
	}
}

extension PurpleViewController {
	fileprivate func transitionUncover() {
		motionTransitionType = .autoReverse(presenting: .uncover(direction: .down))
	}
}

extension PurpleViewController {
	fileprivate func transitionSlide() {
		motionTransitionType = .autoReverse(presenting: .slide(direction: .right))
	}
}

extension PurpleViewController {
	fileprivate func transitionZoomSlide() {
		motionTransitionType = .autoReverse(presenting: .zoomSlide(direction: .right))
	}
}

extension PurpleViewController {
	fileprivate func transitionPageIn() {
		motionTransitionType = .autoReverse(presenting: .pageIn(direction: .left))
	}
}

extension PurpleViewController {
	fileprivate func transitionPageOut() {
		motionTransitionType = .autoReverse(presenting: .pageOut(direction: .right))
	}
}

extension PurpleViewController {
	fileprivate func transitionFade() {
		motionTransitionType = .autoReverse(presenting: .fade)
	}
}

extension PurpleViewController {
	fileprivate func transitionZoom() {
		motionTransitionType = .autoReverse(presenting: .zoom)
	}
}

extension PurpleViewController {
	fileprivate func transitionZoomOut() {
		motionTransitionType = .autoReverse(presenting: .zoomOut)
	}
}
