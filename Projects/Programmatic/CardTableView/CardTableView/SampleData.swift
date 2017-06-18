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
import Graph

extension UIImage {
    public class func load(contentsOfFile name: String, ofType type: String) -> UIImage? {
        return UIImage(contentsOfFile: Bundle.main.path(forResource: name, ofType: type)!)
    }
}

struct SampleData {
    public static func createSampleData() {
        let graph = Graph()
        graph.clear()
        
        let c1 = Entity(type: "Category")
        c1["name"] = "Yoga"
        
        let a1 = Entity(type: "Article")
        a1["title"] = "Anti-Stress Yoga"
        a1["detail"] = "facebook.com/healthymind.io"
        a1["photo"] = UIImage.load(contentsOfFile: "photo1", ofType: "jpg")?.resize(toHeight: 300)
        a1["content"] = "Yoga is a wonderful practice for your body and soul. It benefits you tremendously in physical and mental ways. I'd like to point out that yoga practice is mainly for your mind, rather than your body."
        
        a1.is(relationship: "Post").in(object: c1)
        
        let a2 = Entity(type: "Article")
        a2["title"] = "Pranayama Breath: Purify and Energize your Body and Mind with Kapalabhati"
        a2["detail"] = "facebook.com/healthymind.io"
        a2["photo"] = UIImage.load(contentsOfFile: "photo6", ofType: "jpg")?.resize(toHeight: 300)
        a2["content"] = "To wake yourself up and get energized in the morning for the day ahead, you need to spend just about 5 minutes doing this wonderful breathing exercise!"
        
        a2.is(relationship: "Post").in(object: c1)
        
        let c2 = Entity(type: "Category")
        c2["name"] = "Beauty"
        
        let a3 = Entity(type: "Article")
        a3["title"] = "Natural DIY Face Scrubs"
        a3["detail"] = "facebook.com/healthymind.io"
        a3["photo"] = UIImage.load(contentsOfFile: "photo7", ofType: "jpg")?.resize(toHeight: 300)
        a3["content"] = "Exfoliation plays a significant role in keeping your skin youthful and glowing, as it removes dead skin cells from your skin's surface leaving it fresh and flawless."
        
        a3.is(relationship: "Post").in(object: c2)
        
        let a4 = Entity(type: "Article")
        a4["title"] = "Natural Face Mask For Clean Youthful Skin"
        a4["detail"] = "facebook.com/healthymind.io"
        a4["photo"] = UIImage.load(contentsOfFile: "photo8", ofType: "jpg")?.resize(toHeight: 300)
        a4["content"] = "The more I use natural oils and simple food for my skin and hair, the more I'm amazed with its goodness and wonderful effects! Who needs to buy cosmetics, when you can just get groceries? :)"
        
        a4.is(relationship: "Post").in(object: c2)
        
        let c3 = Entity(type: "Category")
        c3["name"] = "Recipes"
        
        let a5 = Entity(type: "Article")
        a5["title"] = "Three Amazing Natural Teeth Whiteners"
        a5["detail"] = "facebook.com/healthymind.io"
        a5["photo"] = UIImage.load(contentsOfFile: "photo2", ofType: "jpg")?.resize(toHeight: 300)
        a5["content"] = "Looking at the numerous amount of teeth whitening products on the market, which ones actually work?"
        
        a5.is(relationship: "Post").in(object: c3)
        
        let a6 = Entity(type: "Article")
        a6["title"] = "Avocado Beauty Oil"
        a6["detail"] = "facebook.com/healthymind.io"
        a6["photo"] = UIImage.load(contentsOfFile: "photo3", ofType: "jpg")?.resize(toHeight: 300)
        a6["content"] = "My recently developed passion for essential oils led me to another wonderful discovery- avocado oil. Unaware of its existence, I was in a pharmacy in Russia looking at their essential oils selection. The pharmacist kindly suggested for me to try the avocado oil due to its important properties."
        
        a6.is(relationship: "Post").in(object: c3)
        
        let a7 = Entity(type: "Article")
        a7["title"] = "Breakfast Smoothie"
        a7["detail"] = "facebook.com/healthymind.io"
        a7["photo"] = UIImage.load(contentsOfFile: "photo4", ofType: "jpg")?.resize(toHeight: 300)
        a7["content"] = "Wake up to a delicious smoothie that will provide you with much needed nutrients!"

        a7.is(relationship: "Post").in(object: c3)
        
        let a8 = Entity(type: "Post")
        a8["title"] = "Get Obsessed with this Vegan French Toast!"
        a8["detail"] = "facebook.com/healthymind.io"
        a8["photo"] = UIImage.load(contentsOfFile: "photo5", ofType: "jpg")?.resize(toHeight: 300)
        a8["content"] = "If you are reading this, it means that I wasn't the only person who had no idea how easy it is to make a mind-blowing delicious Vegan French Toast! :)"
        
        a8.is(relationship: "Post").in(object: c3)
        
        graph.sync()
    }
}
