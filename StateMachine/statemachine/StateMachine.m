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
	self.substate = currentState;
	self.substate.stateMachine = self;
}

- (State *)currentState
{
	return self.substate;
}

@end
