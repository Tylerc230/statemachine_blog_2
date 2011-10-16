//
//  ResponderState.m
//  StateMachine
//
//  Created by Tyler Casselman on 10/15/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "ResponderState.h"

@implementation ResponderState
@dynamic responderSubstate;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.responderSubstate touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.responderSubstate touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.responderSubstate touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.responderSubstate touchesCancelled:touches withEvent:event];
}

- (ResponderState *)responderSubstate
{
	return (ResponderState *) self.substate;
}

- (void)responderSubstate:(ResponderState *)responderSubstate
{
	self.substate = responderSubstate;
}

@end
