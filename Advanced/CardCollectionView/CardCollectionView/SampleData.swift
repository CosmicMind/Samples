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
import Material
import Graph

extension UIImage {
    public class func load(contentsOfFile name: String, ofType type: String) -> UIImage? {
        return UIImage(contentsOfFile: Bundle.main.path(forResource: name, ofType: type)!)
    }
}

struct SampleData {
    public static func createSampleData() {
        let graph = Graph()
        
        let e1 = Entity(type: "Item")
        e1["title"] = "Anti-Stress Yoga"
        e1["detail"] = "facebook.com/healthymind.io"
        e1["photo"] = UIImage.load(contentsOfFile: "photo1", ofType: "jpg")?.crop(toWidth: 500, toHeight: 300)
        e1["content"] = "Yoga is a wonderful practice for your body and soul. It benefits you tremendously in physical and mental ways. I'd like to point out that yoga practice is mainly for your mind, rather than your body"
        
        let e2 = Entity(type: "Item")
        e2["title"] = "Three Amazing Natural Teeth Whiteners"
        e2["detail"] = "facebook.com/healthymind.io"
        e2["photo"] = UIImage.load(contentsOfFile: "photo2", ofType: "jpg")?.crop(toWidth: 500, toHeight: 300)
        e2["content"] = "Looking at the numerous amount of teeth whitening products on the market, which ones actually work?"
        
        let e3 = Entity(type: "Item")
        e3["title"] = "Avocado Beauty Oil"
        e3["detail"] = "facebook.com/healthymind.io"
        e3["photo"] = UIImage.load(contentsOfFile: "photo3", ofType: "jpg")?.crop(toWidth: 500, toHeight: 300)
        e3["content"] = "My recently developed passion for essential oils led me to another wonderful discovery- avocado oil. Unaware of its existence, I was in a pharmacy in Russia looking at their essential oils selection. The pharmacist kindly suggested for me to try the avocado oil due to its important properties."
        
        let e4 = Entity(type: "Item")
        e4["title"] = "Breakfast Smoothie"
        e4["detail"] = "facebook.com/healthymind.io"
        e4["photo"] = UIImage.load(contentsOfFile: "photo4", ofType: "jpg")?.crop(toWidth: 500, toHeight: 300)
        e4["content"] = "Wake up to a delicious smoothie that will provide you with much needed nutrients!"
        
        let e5 = Entity(type: "Item")
        e5["title"] = "Get Obsessed with this Vegan French Toast!"
        e5["detail"] = "facebook.com/healthymind.io"
        e5["photo"] = UIImage.load(contentsOfFile: "photo5", ofType: "jpg")?.crop(toWidth: 500, toHeight: 300)
        e5["content"] = "If you are reading this, it means that I wasn't the only person who had no idea how easy it is to make a mind-blowing delicious Vegan French Toast! :)"
        
        graph.sync()
    }
}
