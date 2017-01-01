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

class AppFABMenuController: FABMenuController {
    fileprivate let fabMenuSize = CGSize(width: 56, height: 56)
    fileprivate let bottomInset: CGFloat = 24
    fileprivate let rightInset: CGFloat = 24
    
    fileprivate var fabButton: FABButton!
    fileprivate var notesFABMenuItem: FABMenuItem!
    fileprivate var reminderFABMenuItem: FABMenuItem!
    
    open override func prepare() {
        super.prepare()
        view.backgroundColor = .black
        
        prepareFABButton()
        prepareNotesFABMenuItem()
        prepareRemindersItem()
        prepareFABMenu()
    }
}

extension AppFABMenuController {
    fileprivate func prepareFABButton() {
        fabButton = FABButton(image: Icon.cm.add, tintColor: .white)
        fabButton.pulseColor = .white
        fabButton.depthPreset = .depth1
        fabButton.backgroundColor = Color.red.base
    }
    
    fileprivate func prepareNotesFABMenuItem() {
        notesFABMenuItem = FABMenuItem()
        notesFABMenuItem.title = "Audio Library"
        notesFABMenuItem.button.image = Icon.cm.pen
        notesFABMenuItem.button.tintColor = .white
        notesFABMenuItem.button.pulseColor = .white
        notesFABMenuItem.button.depthPreset = .depth1
        notesFABMenuItem.button.backgroundColor = Color.green.base
    }
    
    fileprivate func prepareRemindersItem() {
        reminderFABMenuItem = FABMenuItem()
        reminderFABMenuItem.title = "Reminders"
        reminderFABMenuItem.button.image = Icon.cm.bell
        reminderFABMenuItem.button.tintColor = .white
        reminderFABMenuItem.button.pulseColor = .white
        reminderFABMenuItem.button.backgroundColor = Color.blue.base
    }
    
    fileprivate func prepareFABMenu() {
        fabMenu.fabButton = fabButton
        fabMenu.items = [notesFABMenuItem, reminderFABMenuItem]
        
        fabMenuBackingBlurEffectStyle = .light
        
        view.layout(fabMenu)
            .size(fabMenuSize)
            .bottom(bottomInset)
            .right(rightInset)
    }
}

extension AppFABMenuController {
    @objc
    open override func fabMenuWillOpen(fabMenu: FABMenu) {
        super.fabMenuWillOpen(fabMenu: fabMenu)
        fabMenu.fabButton?.animate(animation: Motion.rotate(angle: 45))
    }
    
    @objc
    open override func fabMenuDidOpen(fabMenu: FABMenu) {
        super.fabMenuDidOpen(fabMenu: fabMenu)
    }
    
    @objc
    open override func fabMenuWillClose(fabMenu: FABMenu) {
        super.fabMenuWillClose(fabMenu: fabMenu)
        fabMenu.fabButton?.animate(animation: Motion.rotate(angle: 0))
    }
    
    @objc
    open override func fabMenuDidClose(fabMenu: FABMenu) {
        super.fabMenuDidClose(fabMenu: fabMenu)
    }
    
    @objc
    open override func fabMenu(fabMenu: FABMenu, tappedAt point: CGPoint, isOutside: Bool) {
        super.fabMenu(fabMenu: fabMenu, tappedAt: point, isOutside: isOutside)
        guard isOutside else {
            return
        }
        
        // Do something ...
    }
}
