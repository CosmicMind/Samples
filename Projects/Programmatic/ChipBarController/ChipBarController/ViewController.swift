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

class ViewController: UIViewController {
    let chips = ChipBar()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        prepareChips()
    }
}

fileprivate extension ViewController {
    func prepareChips() {
        let c1 = ChipItem(title: "Chip 1")
        c1.backgroundColor = Color.blue.base
        c1.titleColor = .white
        c1.pulseColor = .white
        
        let c2 = ChipItem(title: "Chip 2")
        c2.backgroundColor = Color.blue.base
        c2.titleColor = .white
        c2.pulseColor = .white
        
        let c3 = ChipItem(title: "Chip 3")
        c3.backgroundColor = Color.blue.base
        c3.titleColor = .white
        c3.pulseColor = .white
        
        let c4 = ChipItem(title: "Chip 4")
        c4.backgroundColor = Color.blue.base
        c4.titleColor = .white
        c4.pulseColor = .white
        
        let c5 = ChipItem(title: "Chip 5")
        c5.backgroundColor = Color.blue.base
        c5.titleColor = .white
        c5.pulseColor = .white
        
        let c6 = ChipItem(title: "Chip 6")
        c6.backgroundColor = Color.blue.base
        c6.titleColor = .white
        c6.pulseColor = .white
        
        let c7 = ChipItem(title: "Chip 7")
        c7.backgroundColor = Color.blue.base
        c7.titleColor = .white
        c7.pulseColor = .white
        
        chips.chipItems = [c1, c2, c3, c4, c5, c6, c7]
        
        view.layout(chips).center().horizontally()
    }
}

