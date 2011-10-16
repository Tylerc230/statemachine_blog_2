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

#pragma Test Lifecycle (activate/deactive) methods
- (void)testActivateDeactivateMethod
{
	stateMachine_.currentState = state1_;
	STAssertTrue([state1_ activateCalled], @"Activate was not called after setting as current state");
	STAssertFalse([state1_ deactivateCalled], @"Deactivate called while state still active");
	stateMachine_.currentState = state2_;
	STAssertTrue([state1_ deactivateCalled], @"Deactivate not called after removal from current state");
}

- (void)testSubstateActivateDeactivateMethod
{
	state1_.substate = state2_;
	STAssertTrue([state2_ activateCalled], @"Substate activate not called");
	state1_.substate = nil;
	STAssertTrue([state2_ deactivateCalled], @"Substate deactivate not called");
}

/* It is valid to set the sub state on a state first, and then assign it as the current state. 
   It is also valid to set the current state of the state machine first, then set its substate.
   We must make sure the lifecycle and initialization work in both scenarios */
- (void)lifecycleMethodTest:(NSString *)testName
{
	STAssertTrue([state1_ activateCalled], @"Test: %@ Parent state activate should be called", testName);
	STAssertTrue([state2_ activateCalled], @"Test: %@ Child state activate should be called", testName);
	stateMachine_.currentState = nil;
	STAssertTrue([state1_ deactivateCalled], @"Test: %@ Parent state deactivate should be called", testName);
	STAssertTrue([state2_ deactivateCalled], @"Test: %@ Child state deactivate should be called", testName);
}

- (void)testPresetLifecycleMethods
{
	state1_.substate = state2_;
	stateMachine_.currentState = state1_;
	[self lifecycleMethodTest:@"Substate first"];
}

- (void)testPostLifecycleMethods
{
	stateMachine_.currentState = state1_;
	state1_.substate = state2_;
	[self lifecycleMethodTest:@"Current state first"];
}

#pragma Test StateMachine assignment
- (void)stateMachineSetTest:(NSString *)testName
{
	STAssertTrue([state1_ stateMachineSet], @"Test: %@ Parent state machine not set", testName);
	STAssertTrue([state2_ stateMachineSet], @"Test: %@ Chile state machine not set", testName);
}

- (void)testPreStateMachineSet
{
	state1_.substate = state2_;
	stateMachine_.currentState = state1_;
	[self stateMachineSetTest:@"Substate first"];
}

- (void)testPostStateMachineSet
{
	stateMachine_.currentState = state1_;
	state1_.substate = state2_;
	[self stateMachineSetTest:@"Current state first"];
}


#pragma  Test Basic message passing
- (void)testCorrectStateMethodCall
{
	state1_.substate = state2_;
	stateMachine_.currentState = state1_;
	//Both state and substate handle the message
	[stateMachine_ performSelector:@selector(callA)];
	STAssertFalse([state2_ aCalled], @"Parent state should handle message first. If parent implements method, child implementation should not be called");
	STAssertTrue([state1_ aCalled], @"Parent state should handle message first. Parent should have handled 'callA'");
	
	//Parent state implments callB, child does not
	[stateMachine_ performSelector:@selector(callB)];
	STAssertTrue([state1_ bCalled], @"Parent didn't handle message substate didn't implement");
	
	//Child state implements method but doesn't handle it, so it passes the message to the parent
	[stateMachine_ performSelector:@selector(callC)];
	STAssertTrue([state2_ cCalled], @"Substate didn't handle method");
	STAssertFalse([state1_ cCalled], @"Parent should not have been passed the callC method");
	
	//There is currently a bug preventing try catch block from catching "unrecognized selector sent to instance" exceptions
	//STAssertThrows([stateMachine_ performSelector:@selector(callD)], @"State machine silently handled method no state implments");
}



@end
