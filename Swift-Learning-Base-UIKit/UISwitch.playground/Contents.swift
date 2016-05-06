//: Playground - noun: a place where people can play

import UIKit

let uiswitch = UISwitch();
uiswitch.center = CGPointZero;

uiswitch.on = true;
uiswitch.addTarget(nil, action: Selector("switchDidChange"), forControlEvents: .TouchUpInside);


