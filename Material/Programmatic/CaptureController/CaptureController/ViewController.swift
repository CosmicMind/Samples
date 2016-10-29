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
    open internal(set) var focusView: UIView?
    
    /// A reference to the exposureView used in exposure animations.
    open internal(set) var exposureView: UIView?
    
    /// A reference to the resetView used in reset animations.
    open internal(set) var resetView: UIView?
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Device.isStatusBarHidden = true
        
        prepareCapture()
        prepareFocusView()
        prepareExposureView()
        prepareResetView()
        prepareCaptureButton()
        prepareCameraButton()
        prepareVideoButton()
        prepareToolbar()
    }
    
    open func prepareCapture() {
        guard let capture = captureController?.capture else {
            return
        }
        
        view.layout(capture).edges()
    }
    
    private func prepareToolbar() {
        guard let cc = captureController else {
            return
        }
        
        cc.toolbar.titleLabel.isHidden = true
        cc.toolbar.titleLabel.textColor = .white
        
        cc.toolbar.detailLabel.isHidden = true
        cc.toolbar.detail = "Recording"
        cc.toolbar.detailLabel.textColor = Color.red.accent1
        
        cc.toolbar.leftViews = [cc.switchCamerasButton]
        cc.toolbar.rightViews = [cc.flashButton]
    }
    
    private func prepareCaptureButton() {
        guard let captureButton = captureController?.captureButton else {
            return
        }
        
        captureButton.width = 72
        captureButton.height = 72
        captureButton.backgroundColor = Color.red.darken1.withAlphaComponent(0.3)
        captureButton.borderColor = .white
        captureButton.borderWidthPreset =  .border3
        captureButton.depthPreset = .none
    }
    
    private func prepareCameraButton() {
        guard let cameraButton = captureController?.cameraButton else {
            return
        }
        
        cameraButton.width = 72
        cameraButton.height = 72
        cameraButton.pulseAnimation = .centerRadialBeyondBounds
    }
    
    private func prepareVideoButton() {
        guard let videoButton = captureController?.videoButton else {
            return
        }
        
        videoButton.width = 72
        videoButton.height = 72
        videoButton.pulseAnimation = .centerRadialBeyondBounds
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

/// CaptureSessionDelegate.
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
//        cameraButton.isHidden = true
//        videoButton.isHidden = true
//        switchCamerasButton.isHidden = true
//        flashButton.isHidden = true
    }
    
    public func captureSessionDidFinishRecordingToOutputFileAtURL(session: CaptureSession, captureOutput: AVCaptureFileOutput, outputFileURL: NSURL, fromConnections connections: [Any], error: Error!) {
        print("Capture Stopped Recording \(outputFileURL)")
//        cameraButton.isHidden = false
//        videoButton.isHidden = false
//        switchCamerasButton.isHidden = false
//        flashButton.isHidden = false
    }
    
    public func captureDidStartRecordTimer(capture: Capture) {
//        toolbar.titleLabel.text = "00:00:00"
//        toolbar.titleLabel.isHidden = false
//        toolbar.detailLabel.isHidden = false
    }
    
    public func captureDidUpdateRecordTimer(capture: Capture, hours: Int, minutes: Int, seconds: Int) {
//        toolbar.title = String(format: "%02i:%02i:%02i", arguments: [hours, minutes, seconds])
    }
    
    public func captureDidStopRecordTimer(capture: Capture, hours: Int, minutes: Int, seconds: Int) {
//        toolbar.titleLabel.isHidden = true
//        toolbar.detailLabel.isHidden = true
    }
    
    public func captureSessionWillSwitchCameras(session: CaptureSession, position: AVCaptureDevicePosition) {
        // ... do something
    }
    
    public func captureSessionDidSwitchCameras(session: CaptureSession, position: AVCaptureDevicePosition) {
//        if .back == position {
//            capture.session.flashMode = .auto
//            flashButton.image = UIImage(named: "ic_flash_auto_white")
//            switchCamerasButton.image = UIImage(named: "ic_camera_front_white")
//        } else {
//            capture.session.flashMode = .off
//            flashButton.image = UIImage(named: "ic_flash_off_white")
//            switchCamerasButton.image = UIImage(named: "ic_camera_rear_white")
//        }
    }
}

/// CaptureDelegate.
extension ViewController: CaptureControllerDelegate {
    public func captureDidPressFlashButton(capture: Capture, button: UIButton) {
//        guard .back == capture.session.position else {
//            return
//        }
//        
//        guard let b = button as? Button else {
//            return
//        }
//        
//        switch capture.session.flashMode {
//        case .off:
//            b.image = UIImage(named: "ic_flash_on_white")
//            capture.session.flashMode = .on
//        case .on:
//            b.image = UIImage(named: "ic_flash_auto_white")
//            capture.session.flashMode = .auto
//        case .auto:
//            b.image = UIImage(named: "ic_flash_off_white")
//            capture.session.flashMode = .off
//        }
    }
    
    public func captureDidPressCameraButton(capture: Capture, button: UIButton) {
//        captureButton.backgroundColor = Color.blue.darken1.withAlphaComponent(0.3)
    }
    
    public func captureDidPressVideoButton(capture: Capture, button: UIButton) {
//        captureButton.backgroundColor = red.darken1.withAlphaComponent(0.3)
    }
    
    public func captureDidPressCaptureButton(capture: Capture, button: UIButton) {
//        if .photo == capture.captureMode {
//            // ... do something
//        } else if .video == capture.captureMode {
//            // ... do something
//        }
    }
    
    public func captureDidPressSwitchCamerasButton(capture: Capture, button: UIButton) {
        // ... do something
    }
}
