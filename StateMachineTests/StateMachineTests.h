//
//  StateMachineTests.h
//  StateMachineTests
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "StateMachine.h"
#import "BaseTestState.h"
#import "State1.h"
#import "State2.h"

@interface StateMachineTests : SenTestCase {
@private
	StateMachine * stateMachine_;
	State1 * state1_;
	State2 * state2_;
}

@end
