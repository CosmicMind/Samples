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
    fileprivate var menu: Menu!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        prepareMenu()
    }
}

extension ViewController {
    fileprivate func prepareMenu() {
        menu = Menu(image: Icon.cm.moreVertical)
        menu.delegate = self
        menu.shapePreset = .circle
        menu.direction = .topLeft
        menu.collectionViewCard.width = view.bounds.width / 2 - 16
        
        view.layout(menu).width(32).height(32).center()
        
        let toolbar = Toolbar()
        toolbar.title = "Menu"
        
        let m1 = MenuItem()
        let iv1 = UIImageView(image: Icon.cm.audio?.tint(with: Color.grey.base))
        iv1.contentMode = .center
        
        m1.title = "Save Content"
        m1.leftViews = [iv1]
        
        let m2 = MenuItem()
        let iv2 = UIImageView(image: Icon.cm.audio?.tint(with: Color.grey.base))
        iv2.contentMode = .center
        
        m2.title = "Save Content"
        m2.leftViews = [iv2]
        
        menu.items = [m1, m2]
//        menu.collectionViewCard.toolbar = toolbar
    }
}

extension ViewController: MenuDelegate {
    @objc
    func menu(menu: Menu, didSelect menuItem: MenuItem, at indexPath: IndexPath) {
        print(menuItem, indexPath)
    }
}
