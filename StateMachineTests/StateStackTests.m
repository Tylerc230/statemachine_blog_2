//
//  StateStackTests.m
//  StateMachine
//
//  Created by Tyler Casselman on 10/31/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "StateStackTests.h"

@implementation StateStackTests
- (void)setUp
{
	[super setUp];
	state1_ = [[State1 alloc] init];
	state2_ = [[State2 alloc] init];
	stateMachine_ = [[StateMachine alloc] init];
}

- (void)tearDown
{
	[state1_ release];
	[state2_ release];
	[stateMachine_ release];
	[super tearDown];
}

- (void)testSimpleNullAddition
{
	[stateMachine_ pushState:state1_];
	STAssertEquals(stateMachine_.currentState, state1_, @"Pushing a state should set state machines current state to that state");
	[stateMachine_ pushState:nil];
	STAssertNil(stateMachine_.currentState, @"Pushing nil should set the current state to nil");
	[stateMachine_ popState];
	STAssertEquals(stateMachine_.currentState, state1_, @"Popping nil state should set current state to previous state");
	[stateMachine_ popState];
	STAssertNil(stateMachine_.currentState, @"Popping all states should return nil for current state");
	[stateMachine_ popState];
	STAssertNil(stateMachine_.currentState, @"Popping beyond last state should return nil for current state");
}

- (void)testNullMessagePassing
{
	
}


@end
