//
//  BaseTestState.m
//  StateMachine
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import "BaseTestState.h"


@implementation BaseTestState
@dynamic activateCalled, deactivateCalled;
@dynamic  aCalled, bCalled, cCalled, stateMachineSet;
- (id)init
{
	if (self = [super init]) {
		methodsCalled_ = [[NSMutableArray alloc] init];
	}
	return self;
}
- (void)activate
{
	[super activate];
	METHOD_CALLED
}

- (void)deactivate
{
	[super deactivate];
	METHOD_CALLED
}

- (void)callA
{
	METHOD_CALLED
}

#pragma Test Methods
- (BOOL)activateCalled
{
	return [methodsCalled_ containsObject:@"activate"];
}

- (BOOL)deactivateCalled
{
	return [methodsCalled_ containsObject:@"deactivate"];
}

- (BOOL)aCalled
{
	return [methodsCalled_ containsObject:@"callA"];
}

- (BOOL)bCalled
{
	return [methodsCalled_ containsObject:@"callB"];
}

- (BOOL)cCalled
{
	return [methodsCalled_ containsObject:@"callC"];
}

- (BOOL)touchBeganCalled
{
	return  [methodsCalled_ containsObject:@"touchesBegan:withEvent:"];
}

- (BOOL)touchMovedCalled
{
	return  [methodsCalled_ containsObject:@"touchesMoved:withEvent:"];
}

- (BOOL)touchEndedCalled
{
	return  [methodsCalled_ containsObject:@"touchesEnded:withEvent:"];
}

- (BOOL)touchCancelledCalled
{
	return  [methodsCalled_ containsObject:@"touchesCancelled:withEvent:"];
}


- (BOOL)stateMachineSet
{
	return self.stateMachine != nil;
}

@end
