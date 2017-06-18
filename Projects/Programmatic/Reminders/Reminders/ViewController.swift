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

fileprivate func remindersStatusToString(_ status: EventsReminderAuthorizationStatus) -> String {
    return .authorized == status ? "authorized" : "denied"
}

class ViewController: EventsController {
    open override func prepare() {
        super.prepare()
    
        requestRemindersAuthorization()
    }
}

extension ViewController {
    fileprivate func requestRemindersAuthorization() {
        events.requestAuthorizationForReminders { (status) in
            print("Reminders request authorization:", remindersStatusToString(status))
        }
    }
}

extension ViewController {
    fileprivate func fetchCalendars() {
        events.createCalendarForReminders(title: "El Salvador") { [weak self] (calendar, error) in
            print("Create Calendar", calendar ?? "", error ?? "")
            
            guard let c = calendar else {
                return
            }
            
            c.title = "Material Events API"
            
            self?.events.update(calendar: c) { [weak self, c = c] (reminder, error) in
            
                self?.events.createReminder(title: "Pick up #groceries", calendar: c, priority: .medium, notes: "Amazing!") { [weak self, c = c] (reminder, error) in
                    guard let s = self else {
                        return
                    }
                    
                    guard let r = reminder else {
                        return
                    }
                    
                    r.priority = EventsReminderPriority.low.rawValue
                    
                    let alarm = s.events.createAlarm(timeIntervalSinceNow: 10)
                    r.addAlarm(alarm)
                    
                    s.events.update(reminder: r) { [weak self] (success, error) in
                        
                       // self?.events.removeReminder(identifier: r.calendarItemIdentifier) { [weak self, c = c] (success, error) in
                         //   guard success else {
                           //     print(error ?? "")
                             //   return
                            //}
                            
                            //self?.events.removeCalendar(identifier: c.calendarIdentifier) { (success, error) in
                              //  print("Calendar removed:", success, error ?? "")
                            //}
                        //}
                    }
                }
            }
        }
    }
    
    fileprivate func fetchReminders(in calendars: [EKCalendar]) {
        print("Fetch Reminders in lists.")

        events.fetchReminders(in: calendars) { (reminders) in
            for reminder in reminders {
                print("Reminder", reminder)
            }
        }
        
        // Get the appropriate calendar.
        let calendar = Calendar.current
        
        // Create the start date components.
        var oneDayAgoComponents = DateComponents()
        oneDayAgoComponents.day = -1
        
        let oneDayAgo = calendar.date(byAdding: oneDayAgoComponents, to: Date())!
        
        // Create the start date components.
        var oneYearFromNowComponents = DateComponents()
        oneYearFromNowComponents.year = 1
        
        let oneYearFromNow = calendar.date(byAdding: oneYearFromNowComponents, to: Date())!
        
        events.fetchIncompleteReminders(starting: oneDayAgo, ending: oneYearFromNow) { (reminders) in
            print(reminders)
        }
        
        events.fetchCompletedReminders(starting: oneDayAgo, ending: oneYearFromNow) { (reminders) in
            print(reminders)
        }
    }
}

extension ViewController {
    @objc
    func eventsAuthorizedForReminders(events: Events) {
        fetchCalendars()
    }
    
    @objc
    func eventsDeniedForReminders(events: Events) {
    }
    
    @objc
    func events(events: Events, status: EventsReminderAuthorizationStatus) {
    }
    
    @objc
    func events(events: Events, createdCalendar calendar: EKCalendar?, error: Error?) {
    }
    
    @objc
    func events(events: Events, updatedCalendar calendar: EKCalendar, error: Error?) {
    }
    
    @objc
    func events(events: Events, removedCalendar calendar: EKCalendar, error: Error?) {
    }
    
    @objc
    func events(events: Events, createdReminder reminder: EKReminder?, error: Error?) {
    }
    
    @objc
    func events(events: Events, updatedReminder reminder: EKReminder, error: Error?) {
    }
    
    @objc
    func events(events: Events, removedReminder reminder: EKReminder, error: Error?) {
    }
    
    @objc
    func eventsShouldRefresh(events: Events) {
    }
}


