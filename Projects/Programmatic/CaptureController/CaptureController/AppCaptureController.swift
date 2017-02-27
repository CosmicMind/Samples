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
import AVFoundation
import Material

class AppCaptureController: CaptureController {
    /// A reference to the focusView used in focus animations.
    fileprivate var focusView: UIView?
    
    /// A reference to the exposureView used in exposure animations.
    fileprivate var exposureView: UIView?
    
    /// A reference to the resetView used in reset animations.
    fileprivate var resetView: UIView?
    
    /// A reference to the captureButton.
    fileprivate var captureButton: FABButton!
    
    /// A reference to the changeModeButton.
    fileprivate var changeModeButton: IconButton!
    
    /// A reference to the switchCameraButton.
    fileprivate var changeCameraButton: IconButton!
    
    /// A reference to the flashButton.
    fileprivate var flashButton: IconButton!
    
    /// A reference to the bottom bar.
    fileprivate var bar: Bar!
    
    open override func prepare() {
        super.prepare()
        prepareChangeModeButton()
        prepareSwitchCameraButton()
        prepareFlashButton()
        
        prepareBar()
        prepareVisualEffectView()
        prepareCaptureButton()
        
        prepareStatusBar()
        prepareToolbar()
        prepareCapture()
        
        prepareFocusView()
        prepareExposureView()
        prepareResetView()
    }
}

extension AppCaptureController {
    fileprivate func prepareChangeModeButton() {
        changeModeButton = IconButton(image: Icon.cm.videocam, tintColor: .white)
        changeModeButton.pulseColor = .white
        changeModeButton.pulseAnimation = .centerRadialBeyondBounds
    }
    
    fileprivate func prepareSwitchCameraButton() {
        changeCameraButton = IconButton(image: Icon.cameraFront, tintColor: .white)
        changeCameraButton.pulseColor = .white
        changeCameraButton.pulseAnimation = .centerRadialBeyondBounds
    }
    
    fileprivate func prepareFlashButton() {
        flashButton = IconButton(image: Icon.flashAuto, tintColor: .white)
        flashButton.pulseColor = .white
        flashButton.pulseAnimation = .centerRadialBeyondBounds
    }
    
    fileprivate func prepareBar() {
        bar = Bar()
        bar.heightPreset = .xxlarge
        bar.backgroundColor = nil
        bar.interimSpacePreset = .interimSpace7
        bar.contentEdgeInsetsPreset = .square4
        bar.contentViewAlignment = .center
        
        bar.leftViews = [changeModeButton, flashButton]
        bar.rightViews = [changeCameraButton]
        view.layout(bar).horizontally().bottom()
    }
    
    fileprivate func prepareVisualEffectView() {
        let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        let v = View()
        v.backgroundColor = nil
        v.shapePreset = .circle
        v.clipsToBounds = true
        v.layout(blurEffect).edges()
        bar.contentView.layout(v).width(64).height(64).center()
    }
    
    fileprivate func prepareCaptureButton() {
        captureButton = FABButton()
        captureButton.backgroundColor = .white
        captureButton.depthPreset = .none
        bar.contentView.layout(captureButton).width(48).height(48).center()
    }
    
    fileprivate func prepareStatusBar() {
        guard let sc = captureController else {
            return
        }
        
        sc.isStatusBarHidden = true
    }
    
    fileprivate func prepareToolbar() {
        toolbar.backgroundColor = nil
        
        toolbar.title = "00:00:00"
        toolbar.titleLabel.isHidden = true
        toolbar.titleLabel.textColor = .white
        
        toolbar.detail = "Recording"
        toolbar.detailLabel.isHidden = true
        toolbar.detailLabel.textColor = Color.red.accent1
    }
    
    fileprivate func prepareCapture() {
        capture.captureButton = captureButton
        capture.changeModeButton = changeModeButton
        capture.changeModeButton = changeModeButton
        capture.changeCameraButton = changeCameraButton
        capture.flashButton = flashButton
    }
    
    fileprivate func prepareFocusView() {
        guard nil == focusView else {
            return
        }
        
        focusView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        focusView!.isHidden = true
        focusView!.borderWidth = 2
        focusView!.borderColor = .white
        view.addSubview(focusView!)
    }
    
    fileprivate func prepareExposureView() {
        guard nil == exposureView else {
            return
        }
        
        exposureView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        exposureView!.isHidden = true
        exposureView!.borderWidth = 2
        exposureView!.borderColor = Color.yellow.darken1
        view.addSubview(exposureView!)
    }
    
    fileprivate func prepareResetView() {
        guard nil == resetView else {
            return
        }
        
        resetView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        resetView!.isHidden = true
        resetView!.borderWidth = 2
        resetView!.borderColor = Color.red.accent1
        view.addSubview(resetView!)
    }
}

/// CaptureDelegate.
extension AppCaptureController {
    public func capture(capture: Capture, failedWith error: Error) {
        print(error)
    }
    
    public func capture(capture: Capture, asynchronouslyStill image: UIImage) {
        print("captureStillImageAsynchronously")
    }
    
    public func capture(capture: Capture, willChangeCamera devicePosition: AVCaptureDevicePosition) {
        guard .front == devicePosition else {
            return
        }
    }
    
    public func capture(capture: Capture, didChangeCamera devicePosition: AVCaptureDevicePosition) {
        if .front == devicePosition {
            flashButton.isHidden = false
            changeCameraButton.image = Icon.cameraFront
        } else {
            flashButton.isHidden = true
            changeCameraButton.image = Icon.cameraRear
        }
    }
    
    public func capture(capture: Capture, didChangeFrom previousVideoOrientation: AVCaptureVideoOrientation, to videoOrientation: AVCaptureVideoOrientation) {
        switch videoOrientation {
        case .portrait:
            updateToRotation(angle: 0)
        case .portraitUpsideDown:
            updateToRotation(angle: 180)
        case .landscapeLeft:
            updateToRotation(angle: -90)
        case .landscapeRight:
            updateToRotation(angle: 90)
        }
    }
    
    public func capture(capture: Capture, didStartRecord timer: Timer) {
        guard let toolbar = captureController?.toolbar else {
            return
        }
        
        toolbar.title = "00:00:00"
        toolbar.titleLabel.isHidden = false
        toolbar.detailLabel.isHidden = false
    }
    
    public func capture(capture: Capture, didUpdateRecord timer: Timer, hours: Int, minutes: Int, seconds: Int) {
        guard let toolbar = captureController?.toolbar else {
            return
        }
        
        toolbar.title = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    public func capture(capture: Capture, didStopRecord timer: Timer, hours: Int, minutes: Int, seconds: Int) {
        guard let toolbar = captureController?.toolbar else {
            return
        }
        
        toolbar.titleLabel.isHidden = true
        toolbar.detailLabel.isHidden = true
    }
    
    public func capture(capture: Capture, didPressFlash button: UIButton) {
        guard .back == capture.devicePosition else {
            return
        }
        
        guard let b = button as? Button else {
            return
        }
        
        switch capture.flashMode {
        case .off:
            b.image = Icon.flashOn
            capture.flashMode = .on
        case .on:
            b.image = Icon.flashAuto
            capture.flashMode = .auto
        case .auto:
            b.image = Icon.flashOff
            capture.flashMode = .off
        }
    }
    
    public func capture(capture: Capture, willChange mode: CaptureMode) {
        /// Do something ...
    }
    
    public func capture(capture: Capture, didChange mode: CaptureMode) {
        if .photo == mode {
            captureButton.backgroundColor = .white
            changeModeButton.image = Icon.cm.videocam
        } else {
            captureButton.backgroundColor = Color.red.base
            changeModeButton.image = Icon.cm.photoCamera
        }
    }
    
    public func capture(capture: Capture, didPressCapture button: UIButton) {
        switch capture.mode {
        case .photo:
            return
        case .video:
            return
        }
    }
    
    public func capture(capture: Capture, didPressChangeCamera button: UIButton) {
        // Do something ...
    }
    
    public func capture(capture: Capture, createMovieFileFailedWith error: Error) {
        print("Capture Failed \(error)")
    }
    
    public func capture(capture: Capture, captureOutput: AVCaptureFileOutput, didStartRecordingToOutputFileAt fileURL: NSURL, fromConnections connections: [Any]) {
        print("Capture Started Recording \(fileURL)")
        changeModeButton.isHidden = true
        changeCameraButton.isHidden = true
        flashButton.isHidden = true
    }
    
    public func capture(capture: Capture, captureOutput: AVCaptureFileOutput, didFinishRecordingToOutputFileAt outputFileURL: NSURL, fromConnections connections: [Any], error: Error!) {
        print("Capture Stopped Recording \(outputFileURL)")
        changeModeButton.isHidden = false
        changeCameraButton.isHidden = false
        flashButton.isHidden = .front == capture.devicePosition
    }
}

extension AppCaptureController {
    /**
     Updates the UI to the given rotation angle.
     - Parameter angle: A CGFloat.
     */
    fileprivate func updateToRotation(angle: CGFloat) {
        changeModeButton.motion(.rotationAngle(angle))
        flashButton.motion(.rotationAngle(angle))
        changeCameraButton.motion(.rotationAngle(angle))
    }
}
