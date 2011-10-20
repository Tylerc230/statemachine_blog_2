//
//  ResponderStateMachineTests.h
//  StateMachine
//
//  Created by Tyler Casselman on 10/19/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import "StateMachine.h"
#import "ResponderState1.h"
#import "ResponderState2.h"

@interface ResponderStateMachineTests : SenTestCase
{
	StateMachine * stateMachine_;
	ResponderState1 * responderState1_;
	ResponderState2 * responderState2_;
}
@end
