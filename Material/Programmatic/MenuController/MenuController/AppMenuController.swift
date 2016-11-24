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

import UIKit
import Material

class AppMenuController: UIViewController {
    fileprivate let menu = Menu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        prepareMenu()
        
        view.layout(menu).size(menu.baseSize).bottom(24).right(24)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showingButtons()
    }
    
    func showingButtons() {
        menu.animate(animation: Motion.animate(group: [
            Motion.rotate(rotation: 3),
            Motion.translateY(by: -120)
            ]))
    }
    
    func handleMenu(_ open: Bool = false) {
        print("handled")
    }
    
    func helpAction() {
        print("helpAction")
    }
    
    func prepareMenu() {
        let btn1 = FabButton()
        btn1.depthPreset = .depth2
        btn1.pulseAnimation = .centerWithBacking
        btn1.backgroundColor = Color.red
        btn1.tintColor = Color.white
        btn1.addTarget(self, action: #selector(handleMenu(_:)), for: .touchUpInside)
        
        let btn2 = FabButton()
        btn2.tag = 1
        btn2.clipsToBounds = true
        btn2.contentMode = .scaleToFill
        btn2.depthPreset = .depth1
        btn2.pulseColor = Color.white
        btn2.backgroundColor = Color.indigo.darken1
        btn2.borderColor = Color.white
        btn2.borderWidth = 2
        
        let btn3 = FabButton()
        btn3.tag = 2
        btn3.contentMode = .scaleToFill
        btn3.clipsToBounds = true
        btn3.depthPreset = .depth1
        btn3.backgroundColor = Color.lightBlue.base
        btn3.pulseColor = Color.white
        btn3.borderColor = Color.white
        btn3.borderWidth = 2
        
        menu.direction = .up
        menu.views = [btn1, btn2, btn3]
    }
}
