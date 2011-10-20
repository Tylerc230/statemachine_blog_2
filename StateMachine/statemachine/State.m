//
//  State.m
//  StateMachine
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import "State.h"
#import "StateMachine.h"

@implementation State
@synthesize substate = substate_;
@synthesize stateMachine = stateMachine_;

- (void)setSubstate:(State *)substate
{
	if(substate_ == substate)
	{
		return;
	}
	[self.substate deactivate];
	[self.substate release];
	substate_ = [substate retain];
	self.substate.stateMachine = self.stateMachine;
	[self.substate activate];
}

- (void)setStateMachine:(StateMachine *)stateMachine
{
	if(stateMachine == stateMachine_)
	{
		return;
	}
	[self.stateMachine release];
	stateMachine_ = [stateMachine retain];
	self.substate.stateMachine = stateMachine;
}

- (void)activate
{
	[self.substate activate];
}

- (void)deactivate
{
	[self.substate deactivate];
}

- (BOOL)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	return [self.substate touchesBegan:touches withEvent:event];
}

- (BOOL)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	return [self.substate touchesMoved:touches withEvent:event];
}

- (BOOL)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	return [self.substate touchesEnded:touches withEvent:event];
}

- (BOOL)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	return [self.substate touchesCancelled:touches withEvent:event];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
	return self.substate;
}


@end
