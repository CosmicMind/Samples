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
    fileprivate let editor = Editor()
    
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
        doneButton.addTarget(self, action: #selector(handleDoneButton(button:)), for: .touchUpInside)
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
        editor.textView.inputAccessoryView = inputBar
        editor.delegate = self
        view.layout(editor).edges()
    }
}

extension ViewController {
    @objc
    fileprivate func handleDoneButton(button: UIButton) {
        editor.textView.resignFirstResponder()
    }
}


extension ViewController: EditorDelegate {
    @objc
    open func editor(editor: Editor, willProcessEditing textStorage: TextStorage, text: String, range: NSRange) {
        textStorage.updateAttributes(characterAttributes: [.font: RobotoFont.regular, .forgroundColor: Color.black], range: range)
    }
    
    @objc
    open func editor(editor: Editor, didProcessEditing textStorage: TextStorage, text: String, range: NSRange) {
        textStorage.updateAttributes(characterAttributes: [.font: RobotoFont.bold, .forgroundColor: Color.lightBlue.lighten1], range: range)
        tags = editor.uniqueMatches
    }
    
    @objc
    open func editor(editor: Editor, shouldBeginEditing textView: UITextView) -> Bool {
        return true
    }
    
    @objc
    open func editor(editor: Editor, shouldEndEditing textView: UITextView) -> Bool {
        return true
    }
    
    @objc
    open func editor(editor: Editor, didBeginEditing textView: UITextView) {
        
    }
    
    @objc
    open func editor(editor: Editor, didEndEditing textView: UITextView) {
     
    }
    
    @objc
    open func editor(editor: Editor, textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    @objc
    open func editor(editor: Editor, didChange textView: UITextView) {
        
    }
    
    @objc
    open func editor(editor: Editor, didChangeSelection textView: UITextView) {
        
    }
    
    @objc
    open func editor(editor: Editor, willShowKeyboard value: NSValue) {
        print(value)
    }
    
    @objc
    open func editor(editor: Editor, willHideKeyboard value: NSValue)
    {
        print(value)
    }
}
