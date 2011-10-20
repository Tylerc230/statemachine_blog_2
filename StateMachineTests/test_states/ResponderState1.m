//
//  ResponderState1.m
//  StateMachine
//
//  Created by Tyler Casselman on 10/19/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "ResponderState1.h"

@implementation ResponderState1

- (BOOL)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	METHOD_CALLED
	return YES;
}

- (BOOL)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	METHOD_CALLED
	return YES;
}

- (BOOL)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	METHOD_CALLED
	return [super touchesCancelled:touches withEvent:event];
}


@end
