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
import EventKit

fileprivate func remindersStatusToString(_ status: RemindersAuthorizationStatus) -> String {
    return .authorized == status ? "authorized" : "denied"
}

class ViewController: RemindersController {
    open override func prepare() {
        super.prepare()
    
        requestRemindersAuthorization()
    }
}

extension ViewController {
    fileprivate func requestRemindersAuthorization() {
        reminders.requestAuthorization { (status) in
            print("Reminders request authorization:", remindersStatusToString(status))
        }
    }
}

extension ViewController {
    fileprivate func fetchCalendars() {
        print("Fetch Reminders lists.")
        
//        reminders.calendars { [weak self] (calendars) in
//            for calendar in calendars {
//                print(calendar.title, calendar)
//            }
        
//            self?.fetchReminders(calendars)
//        }
        
        reminders.create(calendar: "El Salvador") { [weak self] (calendar, error) in
            print("Create Calendar", calendar ?? "", error ?? "")
            
            guard let v = calendar else {
                return
            }
            
            self?.reminders.create(reminder: "Pick up #groceries", calendar: v, priority: .medium, notes: "Amazing!") { (reminder, error) in
                print("Create Reminder:", reminder ?? "", error ?? "")
            }
        }
    }
    
    fileprivate func fetchReminders(_ calendars: [EKCalendar]) {
        print("Fetch Reminders in lists.")

        reminders.reminders(in: calendars) { (reminders) in
            for reminder in reminders {
                print("Reminder", reminder)
            }
        }
        
        // Get the appropriate calendar.
        let calendar = NSCalendar.current
        
        // Create the start date components.
        var oneDayAgoComponents = DateComponents()
        oneDayAgoComponents.day = -1
        
        let oneDayAgo = calendar.date(byAdding: oneDayAgoComponents, to: Date())!
        
        // Create the start date components.
        var oneYearFromNowComponents = DateComponents()
        oneYearFromNowComponents.year = 1
        
        let oneYearFromNow = calendar.date(byAdding: oneYearFromNowComponents, to: Date())!
        
        reminders.incomplete(starting: oneDayAgo, ending: oneYearFromNow) { (reminders) in
            print(reminders)
        }
        
        reminders.completed(starting: oneDayAgo, ending: oneYearFromNow) { (reminders) in
            print(reminders)
        }
    }
}

extension ViewController {
    @objc
    func reminders(authorized reminders: Reminders) {
        print("Reminders access is authorized.")
        
        fetchCalendars()
    }
    
    @objc
    func reminders(denied reminders: Reminders) {
        print("Reminders access is denied.")
    }
    
    @objc
    func reminders(reminders: Reminders, status: RemindersAuthorizationStatus) {
        print("Reminders status:", remindersStatusToString(status))
    }
    
    @objc
    func reminders(reminders: Reminders, createdCalendar calendar: EKCalendar?, error: Error?) {
        print("Reminders created calendar:", calendar ?? "", error ?? "")
    }
    
    @objc
    func reminders(reminders: Reminders, removedCalendar calendar: EKCalendar, error: Error?) {
        print("Reminders removed calendar:", calendar, error ?? "")
    }
    
    @objc
    func reminders(reminders: Reminders, createdReminder reminder: EKReminder?, error: Error?) {
        print("Reminders created reminder:", reminder ?? "", error ?? "")
    }
    
    @objc
    func reminders(reminders: Reminders, removedReminder reminder: EKReminder, error: Error?) {
        print("Reminders removed reminder:", reminder, error ?? "")
    }
}


