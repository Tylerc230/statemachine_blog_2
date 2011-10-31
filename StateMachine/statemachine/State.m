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
	[self removeTopState];
	[self pushState:substate];
}

- (State *)substate
{
	if(self.stateStack.count == 0)
	{
		return nil;
	}
	State * currentState = [self.stateStack lastObject];
	if(currentState == [NullState nullState])
	{
		return nil;
	}
	return currentState;

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
	[self.substate deactivate];
	if(state == nil)
	{
		state = [NullState nullState];
	}
	state.stateMachine = self.stateMachine;
	[state activate];
	[self.stateStack addObject:state];
	
}

- (void)popState
{
	[self removeTopState];
	[self.substate activate];

}

- (void)removeTopState
{
	if(self.stateStack.count > 0)
	{
		[self.substate deactivate];
		[self.stateStack removeObject:self.stateStack.lastObject];
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
