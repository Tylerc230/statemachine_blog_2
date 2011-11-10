//
//  StateMachineAppDelegate.h
//  StateMachine
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExampleAppViewController.h"
@interface StateMachineAppDelegate : NSObject <UIApplicationDelegate> {
	ExampleAppViewController * exampleAppViewController_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
