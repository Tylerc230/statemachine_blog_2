//
//  ScrollState.m
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "ScrollState.h"

@implementation ScrollState

- (BOOL)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	return YES;
}

- (BOOL)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch * touch = [touches anyObject];
	CGPoint currentPoint = [touch locationInView:controller_.view];
	CGPoint previousPoint = [touch previousLocationInView:controller_.view];
	CGPoint offset = CGPointMake(currentPoint.x - previousPoint.x, currentPoint.y - previousPoint.y);
	[controller_ scrollMapByAmount:offset];
	return YES;
}

- (BOOL)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	return YES;
}

@end
