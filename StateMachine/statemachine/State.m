//
//  State.m
//  StateMachine
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import "State.h"
#import "StateMachine.h"
#import "NullState.h"

@interface State (Private)
- (void)removeTopState;
@end

@implementation State
@dynamic substate;
@synthesize stateMachine = stateMachine_;
@synthesize stateStack = stateStack_;

- (id)init
{
	if(self = [super init])
	{
		self.stateStack = [NSMutableArray arrayWithCapacity:10];
	}
	return self;
}

- (void)setSubstate:(State *)substate
{
	State * currentState = self.substate;
	if(currentState == substate)
	{
		return;
	}
	if(substate == nil)
	{
		substate = [[[NullState alloc] init] autorelease];
	}
	[self removeTopState];
	[self pushState:substate];
}

- (State *)substate
{
	if(self.stateStack.count > 0)
	{
		return [self.stateStack lastObject];
	}
	return nil;
}

- (void)setStateMachine:(StateMachine *)stateMachine
{
	if(stateMachine == stateMachine_)
	{
		return;
	}

	stateMachine_ = stateMachine;
	self.substate.stateMachine = stateMachine;
}

- (void)pushState:(State *)state
{
	if(self.stateStack.count > 0)
	{
		[self.substate deactivate];
	}
	state.stateMachine = self.stateMachine;
	[state activate];
	[self.stateStack addObject:state];
	
}

- (void)popState
{
	[self removeTopState];
	if(self.stateStack.count > 0)
	{
		[self.substate activate];
	}
}

- (void)removeTopState
{
	if(self.stateStack.count > 0)
	{
		[self.substate deactivate];
		[self.stateStack removeObject:self.substate];
	}
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
