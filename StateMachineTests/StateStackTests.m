//
//  StateStackTests.m
//  StateMachine
//
//  Created by Tyler Casselman on 10/31/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "StateStackTests.h"
#import "NullState.h"

@implementation StateStackTests
- (void)setUp
{
	[super setUp];
	state1_ = [[State1 alloc] init];
	state2_ = [[State1 alloc] init];
	state3_ = [[State1 alloc] init];
	state4_ = [[State1 alloc] init];

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

- (void)testNullSubstateMessagePassing
{
	[stateMachine_ pushState:state1_];
	[state1_ pushState:nil];
	[stateMachine_ performSelector:@selector(callB)];
	STAssertTrue([state1_ bCalled], @"If we push nil to a state, it should handle the call itself.");
}

- (void)testSetCurrentNullMessagePassing
{
	[stateMachine_ setCurrentState:state1_];
	[state1_ setSubstate:nil];
	[stateMachine_ performSelector:@selector(callB)];
	STAssertTrue([state1_ bCalled], @"If we set substate to nil, parent state should handle message");
}

- (void)testNullExistance
{
	STAssertNotNil([NullState nullState], @"Null state singleton should exist");
}

- (void)testStackMessagePassing
{
	state1_.substate = state2_;
	state3_.substate = state4_;
	stateMachine_.currentState = state1_;
	[stateMachine_ pushState:state3_];
	[stateMachine_ performSelector:@selector(callB)];
	STAssertTrue([state3_ bCalled], @"State on top of stack should handle message");
	STAssertFalse([state1_ bCalled], @"State below top state should not handle message");
	[stateMachine_ popState];
	[stateMachine_ performSelector:@selector(callB)];
	STAssertTrue([state1_ bCalled], @"Once top is popped, next state should handle messages");
}


@end
