//
//  ResponderStateMachineTests.m
//  StateMachine
//
//  Created by Tyler Casselman on 10/19/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "ResponderStateMachineTests.h"


@implementation ResponderStateMachineTests

- (void)setUp
{
	[super setUp];
	stateMachine_ = [[StateMachine alloc] init];
	responderState1_ = [[ResponderState1 alloc] init];
	responderState2_ = [[ResponderState2 alloc] init];
}

- (void)tearDown
{
	[responderState1_ release];
	[responderState2_ release];
	[stateMachine_ release];
	[super tearDown];
}

#pragma Test Responder message passing
- (void)testBasicMethodCalls
{
	[responderState1_ touchesBegan:nil withEvent:nil];
	STAssertTrue([responderState1_ touchBeganCalled], @"Touch began not called on state");
}

- (void)testCorrectResponderMessagePassing
{
	responderState1_.substate = responderState2_;
	stateMachine_.currentState = responderState1_;
	
	/* Parent class implements method, child does not */
	[stateMachine_.currentState touchesBegan:nil withEvent:nil];
	STAssertTrue([responderState1_ touchBeganCalled], @"Touches began should only be called on the parent state");
	STAssertFalse([responderState2_ touchBeganCalled], @"Touches began should only be called on the parent state");
	
	/* Parent and child both implement method */
	[stateMachine_.currentState touchesMoved:nil withEvent:nil];
	STAssertTrue([responderState1_ touchMovedCalled], @"Touches moved should only be called on the parent state");
	STAssertFalse([responderState2_ touchMovedCalled], @"Touches moved should only be called on the parent state");
	
	/* Child implments method, parent does not (The base class of both implements this method though)*/
	[stateMachine_.currentState touchesEnded:nil withEvent:nil];
	STAssertFalse([responderState1_ touchEndedCalled], @"Parent should not handle method");
	STAssertTrue([responderState2_ touchEndedCalled], @"Child state should handle method");
	
	/* Both child and parent implement method, parent allows child to handle method after it does */
	[stateMachine_.currentState touchesCancelled:nil withEvent:nil];
	STAssertTrue([responderState1_ touchCancelledCalled], @"Parent method should have been called");
	STAssertTrue([responderState2_ touchCancelledCalled], @"Parent method should have been called");
	
}

@end
