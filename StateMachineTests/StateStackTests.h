//
//  StateStackTests.h
//  StateMachine
//
//  Created by Tyler Casselman on 10/31/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

//  Logic unit tests contain unit test code that is designed to be linked into an independent test executable.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import "StateMachine.h"
#import "State1.h"

@interface StateStackTests : SenTestCase
{
	StateMachine * stateMachine_;
	State1 * state1_;
	State1 * state2_;
	State1 * state3_;
	State1 * state4_;

}
@end
