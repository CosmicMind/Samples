/*
 * Copyright (C) 2015 - 2016, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.io>.
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

class ViewController: UIViewController {
    /// A reference to the focusView used in focus animations.
    internal var focusView: UIView?
    
    /// A reference to the exposureView used in exposure animations.
    internal var exposureView: UIView?
    
    /// A reference to the resetView used in reset animations.
    internal var resetView: UIView?
    
    /// A reference to the captureButton.
    internal var captureButton: FabButton!
    
    /// A reference to the cameraButton.
    internal var cameraButton: IconButton!
    
    /// A reference to the videoButton.
    internal var videoButton: IconButton!
    
    /// A reference to the switchCameraButton.
    internal var switchCamerasButton: IconButton!
    
    /// A reference to the flashButton.
    internal var flashButton: IconButton!
    
    /// A reference to the visualEffectView .
    internal var visualEffectView: View!
    
    /// A reference to the bottom bar.
    internal var bar: Bar!
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareCameraButton()
        prepareVideoButton()
        prepareSwitchCamerasButton()
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
    
    private func prepareCameraButton() {
        cameraButton = IconButton(image: Icon.cm.photoCamera, tintColor: .white)
        cameraButton.width = 72
        cameraButton.height = 72
        cameraButton.pulseAnimation = .centerRadialBeyondBounds
    }
    
    private func prepareVideoButton() {
        videoButton = IconButton(image: Icon.cm.videocam, tintColor: .white)
        videoButton.width = 72
        videoButton.height = 72
        videoButton.pulseAnimation = .centerRadialBeyondBounds
    }
    
    private func prepareSwitchCamerasButton() {
        switchCamerasButton = IconButton(image: Icon.cameraFront, tintColor: .white)
    }
    
    private func prepareFlashButton() {
        flashButton = IconButton(image: Icon.flashAuto, tintColor: .white)
    }
    
    private func prepareBar() {
        bar = Bar()
        bar.height = 110
        bar.backgroundColor = nil
        bar.contentEdgeInsetsPreset = .wideRectangle7
        bar.leftViews = [flashButton]
        bar.rightViews = [switchCamerasButton]
        view.layout(bar).horizontally().bottom()
    }
    
    private func prepareVisualEffectView() {
        let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        
        visualEffectView = View()
        visualEffectView.backgroundColor = nil
        visualEffectView.shapePreset = .circle
        visualEffectView.clipsToBounds = true
        visualEffectView.layout(blurEffect).edges()
        bar.contentView.layout(visualEffectView).width(64).height(64).center()
    }
    
    private func prepareCaptureButton() {
        captureButton = FabButton()
        captureButton.backgroundColor = .white
        captureButton.depthPreset = .none
        bar.contentView.layout(captureButton).width(48).height(48).center()
    }
    
    private func prepareStatusBar() {
        guard let sc = captureController else {
            return
        }
        
        sc.isStatusBarHidden = true
    }
    
    private func prepareToolbar() {
        guard let toolbar = captureController?.toolbar else {
            return
        }
        
        toolbar.backgroundColor = Color.black.withAlphaComponent(0.3)
        
        toolbar.title = "00:00:00"
        toolbar.titleLabel.isHidden = true
        toolbar.titleLabel.textColor = .white
        
        toolbar.detail = "Recording"
        toolbar.detailLabel.isHidden = true
        toolbar.detailLabel.textColor = Color.red.accent1
        
        toolbar.centerViews = [switchCamerasButton, flashButton]
    }
    
    private func prepareCapture() {
        guard let capture = captureController?.capture else {
            return
        }
        
        capture.delegate = self
        capture.session.delegate = self
        
        capture.captureButton = captureButton
        capture.cameraButton = cameraButton
        capture.videoButton = videoButton
        capture.switchCamerasButton = switchCamerasButton
        capture.flashButton = flashButton
        
        view.layout(capture).edges()
        view.sendSubview(toBack: capture)
    }
    
    /// Prepares the focusLayer.
    private func prepareFocusView() {
        guard nil == focusView else {
            return
        }
        
        focusView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        focusView!.isHidden = true
        focusView!.borderWidth = 2
        focusView!.borderColor = .white
        view.addSubview(focusView!)
    }
    
    /// Prepares the exposureLayer.
    private func prepareExposureView() {
        guard nil == exposureView else {
            return
        }
        
        exposureView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        exposureView!.isHidden = true
        exposureView!.borderWidth = 2
        exposureView!.borderColor = Color.yellow.darken1
        view.addSubview(exposureView!)
    }
    
    /// Prepares the resetLayer.
    private func prepareResetView() {
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

extension ViewController: CaptureSessionDelegate {
    public func captureSessionFailedWithError(session: CaptureSession, error: Error) {
        print(error)
    }
    
    public func captureSessionStillImageAsynchronously(session: CaptureSession, image: UIImage) {
        print("captureStillImageAsynchronously")
    }
    
    public func captureSessionCreateMovieFileFailedWithError(session: CaptureSession, error: Error) {
        print("Capture Failed \(error)")
    }
    
    public func captureSessionDidStartRecordingToOutputFileAtURL(session: CaptureSession, captureOutput: AVCaptureFileOutput, fileURL: NSURL, fromConnections connections: [Any]) {
        print("Capture Started Recording \(fileURL)")
        cameraButton.isHidden = true
        videoButton.isHidden = true
        switchCamerasButton.isHidden = true
        flashButton.isHidden = true
    }
    
    public func captureSessionDidFinishRecordingToOutputFileAtURL(session: CaptureSession, captureOutput: AVCaptureFileOutput, outputFileURL: NSURL, fromConnections connections: [Any], error: Error!) {
        print("Capture Stopped Recording \(outputFileURL)")
        cameraButton.isHidden = false
        videoButton.isHidden = false
        switchCamerasButton.isHidden = false
        flashButton.isHidden = false
    }
    
    public func captureSessionWillSwitchCameras(session: CaptureSession, position: AVCaptureDevicePosition) {
        // ... do something
    }
    
    public func captureSessionDidSwitchCameras(session: CaptureSession, position: AVCaptureDevicePosition) {
        guard let capture = captureController?.capture else {
            return
        }
        
        if .back == position {
            capture.session.flashMode = .auto
            flashButton.image = Icon.flashAuto
            switchCamerasButton.image = Icon.cameraFront
        } else {
            capture.session.flashMode = .off
            flashButton.image = Icon.flashOff
            switchCamerasButton.image = Icon.cameraRear
        }
    }
}

extension ViewController: CaptureDelegate {
    public func captureDidStartRecordTimer(capture: Capture) {
        guard let toolbar = captureController?.toolbar else {
            return
        }
        
        toolbar.title = "00:00:00"
        toolbar.titleLabel.isHidden = false
        toolbar.detailLabel.isHidden = false
    }
    
    public func captureDidUpdateRecordTimer(capture: Capture, hours: Int, minutes: Int, seconds: Int) {
        guard let toolbar = captureController?.toolbar else {
            return
        }
        
        toolbar.title = String(format: "%02i:%02i:%02i", arguments: [hours, minutes, seconds])
    }
    
    public func captureDidStopRecordTimer(capture: Capture, hours: Int, minutes: Int, seconds: Int) {
        guard let toolbar = captureController?.toolbar else {
            return
        }
        
        toolbar.titleLabel.isHidden = true
        toolbar.detailLabel.isHidden = true
    }
    
    public func captureDidPressFlashButton(capture: Capture, button: UIButton) {
        guard .back == capture.session.position else {
            return
        }
        
        guard let b = button as? Button else {
            return
        }
        
        switch capture.session.flashMode {
        case .off:
            b.image = Icon.flashOn
            capture.session.flashMode = .on
        case .on:
            b.image = Icon.flashAuto
            capture.session.flashMode = .auto
        case .auto:
            b.image = Icon.flashOff
            capture.session.flashMode = .off
        }
    }
    
    public func captureDidPressCameraButton(capture: Capture, button: UIButton) {
        captureButton.backgroundColor = Color.blue.darken1.withAlphaComponent(0.3)
    }
    
    public func captureDidPressVideoButton(capture: Capture, button: UIButton) {
        captureButton.backgroundColor = .white
    }
    
    public func captureDidPressCaptureButton(capture: Capture, button: UIButton) {
        switch capture.mode {
        case .photo:
            return
        case .video:
            return
        }
    }
    
    public func captureDidPressSwitchCamerasButton(capture: Capture, button: UIButton) {
        // ... do something
    }
}
