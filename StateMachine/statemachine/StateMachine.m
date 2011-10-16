//
//  StateMachine.m
//  StateMachine
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import "StateMachine.h"


@implementation StateMachine
@synthesize currentState = currentState_;

- (void)setCurrentState:(State *)currentState
{
	if(currentState == currentState_)
	{
		return;
	}
	[self.currentState deactivate];
	[self.currentState release];
	
	currentState_ = [currentState retain];
	[currentState_ activate];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
	return self.currentState;
}

@end
