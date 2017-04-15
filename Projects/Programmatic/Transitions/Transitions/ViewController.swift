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

class ViewController: UIViewController {
    fileprivate var panGesture: UIPanGestureRecognizer!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        isInteractiveMotionEnabled = true
        view.backgroundColor = .orange
        
        let v1 = UIView(frame: CGRect(x: 0, y: view.bounds.height - 50, width: view.bounds.width, height: 50))
        v1.motionIdentifier = "v1"
        v1.backgroundColor = .yellow
        view.addSubview(v1)
        
        preparePanGesture()
    }
}

extension ViewController {
    fileprivate func preparePanGesture() {
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(gestureRecognizer:)))
        view.addGestureRecognizer(panGesture)
    }
}

extension ViewController {
    @objc
    fileprivate func handlePanGesture(gestureRecognizer: UIGestureRecognizer) {
        if .began == gestureRecognizer.state {
            present(PurpleViewController(), animated: true)
        }
    }
}
