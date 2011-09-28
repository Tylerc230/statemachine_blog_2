//
//  StateMachineTests.m
//  StateMachineTests
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import "StateMachineTests.h"


@implementation StateMachineTests

- (void)setUp
{
    [super setUp];
	stateMachine_ = [[StateMachine alloc] init];
	state1_ = [[State1 alloc] init];
	state2_ = [[State2 alloc] init];
}

- (void)tearDown
{
	[state1_ release];
	[state2_ release];
	[stateMachine_ release];
    [super tearDown];
}

- (void)testActivateDeactivateMethod
{
	stateMachine_.currentState = state1_;
	STAssertTrue([state1_ activateCalled], @"Activate was not called after setting as current state");
	STAssertFalse([state1_ deactivateCalled], @"Deactivate called while state still active");
	stateMachine_.currentState = state2_;
	STAssertTrue([state_ deactivateCalled], @"Deactivate not called after removal from current state");
}

- (void)testCorrectStateMethodCall
{
	state1_.substate = state2_;
	stateMachine_.currentState = state1_;
	//Sub state handles callA
	[stateMachine_ callA];
	STAssertTrue([state2_ aCalled], @"Substate didn't handle the message first");
	STAssertFalse([state1_ aCalled], @"Parent class handled method first");
	
	//Parent state handles callB (sub state doesn't implement callB)
	[stateMachine_ callB];
	STAssertTrue([state1_ bCalled], @"Parent didn't handle message substate didn't implement");
	
	//Child state implements method but doesn't handle it, so it passes the message to the parent
	[stateMachine callC];
	STAssertTrue([state2_ cCalled], @"Substate didn't handle method");
	STAssertTrue([state1_ cCalled], @"Message not passed to parent");
}



@end
