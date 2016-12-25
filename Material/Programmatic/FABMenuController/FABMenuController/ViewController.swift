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

class ViewController: UIViewController {
    fileprivate var toggleFABMenuItem: FABMenuItem!
    fileprivate var notesFABMenuItem: FABMenuItem!
    fileprivate var reminderFABMenuItem: FABMenuItem!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        prepareToggleFABMenuItem()
        prepareNotesFABMenuItem()
        prepareRemindersItem()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        prepareFABMenuController()
    }
}

extension ViewController {
    fileprivate func prepareToggleFABMenuItem() {
        toggleFABMenuItem = FABMenuItem()
        toggleFABMenuItem.title = "Add Button"
        toggleFABMenuItem.button.image = Icon.cm.add
        toggleFABMenuItem.button.tintColor = .white
        toggleFABMenuItem.button.pulseColor = .white
        toggleFABMenuItem.button.backgroundColor = Color.red.base
        toggleFABMenuItem.button.depthPreset = .depth1
        toggleFABMenuItem.button.addTarget(self, action: #selector(handleToggleMenu), for: .touchUpInside)
    }
    
    fileprivate func prepareNotesFABMenuItem() {
        notesFABMenuItem = FABMenuItem()
        notesFABMenuItem.button.image = Icon.cm.pen
        notesFABMenuItem.button.tintColor = .white
        notesFABMenuItem.button.pulseColor = .white
        notesFABMenuItem.button.backgroundColor = Color.green.base
        notesFABMenuItem.button.depthPreset = .depth1
        notesFABMenuItem.title = "Audio Library"
    }
    
    fileprivate func prepareRemindersItem() {
        reminderFABMenuItem = FABMenuItem()
        reminderFABMenuItem.button.image = Icon.cm.bell
        reminderFABMenuItem.button.tintColor = .white
        reminderFABMenuItem.button.pulseColor = .white
        reminderFABMenuItem.button.backgroundColor = Color.blue.base
        reminderFABMenuItem.title = "Reminders"
    }
    
    fileprivate func prepareFABMenuController() {
        guard let mc = fabMenuController as? AppFABMenuController else {
            return
        }
        
        mc.menu.delegate = self
        mc.menu.buttons = [toggleFABMenuItem, notesFABMenuItem, reminderFABMenuItem]
    }
}

extension ViewController {
    @objc
    fileprivate func handleToggleMenu(button: Button) {
        guard let mc = fabMenuController as? AppFABMenuController else {
            return
        }
        
        if mc.menu.isOpened {
            mc.closeMenu { (view) in
                (view as? FABMenuItem)?.hideTitleLabel()
            }
        } else {
            mc.openMenu { (view) in
                (view as? FABMenuItem)?.showTitleLabel()
            }
        }
    }
}

extension ViewController: FABMenuDelegate {
    @objc
    func fabMenu(fabMenu: FABMenu, tappedAt point: CGPoint, isOutside: Bool) {
        guard isOutside else {
            return
        }
        
        guard let mc = fabMenuController as? AppFABMenuController else {
            return
        }
        
        mc.closeMenu { (view) in
            (view as? FABMenuItem)?.hideTitleLabel()
        }
    }
}
