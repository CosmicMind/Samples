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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        prepareHorizontalExample()
        prepareVerticalExample()
    }
}

extension ViewController {
    fileprivate func prepareHorizontalExample() {
        let container = View()
        container.backgroundColor = nil
        container.shapePreset = .square
        
        container.grid.interimSpacePreset = .interimSpace3
        
        view.layout(container).center().left(20).right(20).height(300)
        
        for _ in 0..<12 {
            let v = View()
            v.grid.columns = 1
            v.backgroundColor = Color.blue.base
            container.grid.views.append(v)
        }
    }
    
    fileprivate func prepareVerticalExample() {
        let container = View()
        container.backgroundColor = nil
        container.shapePreset = .square
        
        container.grid.axis.direction = .vertical
        container.grid.interimSpacePreset = .interimSpace3
        
        view.layout(container).center().left(20).right(20).height(300)
        
        for _ in 0..<12 {
            let v = View()
            v.grid.rows = 1
            v.backgroundColor = Color.blue.base
            container.grid.views.append(v)
        }
    }
}

