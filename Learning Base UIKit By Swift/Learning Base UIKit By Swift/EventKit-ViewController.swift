//
//  EventKit-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/12.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import EventKit

class EventKit_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let eventStore:EKEventStore = EKEventStore();
        
        eventStore.requestAccessToEntityType(.Event) { (granted, error) -> Void in
            if granted && error == nil{
                
                //新建事件
                let event:EKEvent = EKEvent(eventStore: eventStore);
                event.title = "新建一个测试事件";
                event.startDate = NSDate();
                event.endDate = NSDate();
                event.notes = "这个是备注";
                event.calendar = eventStore.defaultCalendarForNewEvents;
                do{
                    try eventStore.saveEvent(event, span: .ThisEvent);
                }
                catch{
                }
                
                //读取事件
                let startDate = NSDate().dateByAddingTimeInterval(-3600 * 24 * 90);
                let endDate = NSDate().dateByAddingTimeInterval(3600 * 24 * 90);
                let pridicate = eventStore.predicateForEventsWithStartDate(startDate, endDate: endDate, calendars: nil);
                let ev = eventStore.eventsMatchingPredicate(pridicate) as [EKEvent]!
                if ev != nil{
                    for i in ev
                    {
                        print("标题:\(i.title)");
                        print("开始:\(i.startDate)");
                        print("结束:\(i.endDate)");
                        print("备注:\(i.notes)");
                    }
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
