//
//  NullState.m
//  StateMachine
//
//  Created by Tyler Casselman on 10/31/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "NullState.h"

@implementation NullState
static NullState * nullState = nil;

/* Singleton - Prevent NullState from being released */
+ (void)initialize
{
	nullState = [[NullState alloc] init];
}

+ (NullState *)nullState
{
	return nullState;
}

- (id)retain
{
	//no op
	return self;
}

- (oneway void)release
{
	//no op
}

- (id)autorelease
{
	//no op
	return self;
} 

@end
