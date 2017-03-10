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
    fileprivate let textView = TextView()
    
    fileprivate var tags = [String]()
    
    fileprivate var doneButton: FlatButton!
    fileprivate var inputBar: Bar!
    fileprivate var bottomToolbar: Toolbar!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        isMotionEnabled = true
        view.backgroundColor = .white
        
        prepareDoneButton()
        prepareInputBar()
        prepareBottomToolbar()
        prepareEditor()
    }
}

extension ViewController {
    fileprivate func prepareDoneButton() {
        doneButton = FlatButton(title: "Done")
        doneButton.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
    }
    
    fileprivate func prepareInputBar() {
        inputBar = Bar()
        inputBar.depthPreset = .none
        inputBar.dividerColor = Color.grey.lighten3
        inputBar.dividerAlignment = .top
        inputBar.rightViews = [doneButton]
    }
    
    fileprivate func prepareBottomToolbar() {
        bottomToolbar = Toolbar()
        view.layout(bottomToolbar).bottom().horizontally()
    }
    
    fileprivate func prepareEditor() {
        textView.delegate = self
        textView.placeholder = "Placeholder"
        textView.inputAccessoryView = inputBar
        textView.backgroundColor = Color.purple.base
        textView.textContainerInsetsPreset = .square5
        view.layout(textView).left().right().top(100).height(100)
        textView.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    }
}

extension ViewController {
    @objc
    fileprivate func handleDoneButton() {
        textView.resignFirstResponder()
    }
}

extension ViewController: TextViewDelegate {
    @objc
    open func textView(textView: TextView, willProcessEditing textStorage: TextStorage, text: String, range: NSRange) {
        textStorage.updateAttributes(characterAttributes: [.font: RobotoFont.regular, .forgroundColor: Color.black], range: range)
    }
    
    @objc
    open func textView(textView: TextView, didProcessEditing textStorage: TextStorage, text: String, range: NSRange) {
        textStorage.updateAttributes(characterAttributes: [.font: RobotoFont.medium, .forgroundColor: Color.lightBlue.lighten1], range: range)
        tags = textView.uniqueMatches
    }
    
    @objc
    open func textView(textView: TextView, willShowKeyboard value: NSValue) {
        
    }
    
    @objc
    open func textView(textView: TextView, willHideKeyboard value: NSValue) {
        
    }
}
