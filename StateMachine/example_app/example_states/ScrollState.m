//
//  ScrollState.m
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "ScrollState.h"
#import "UITouch+Offset.h"

@implementation ScrollState

- (void) activate
{
	[super activate];
	[controller_ scrollMapToPosition:scrollOffset_];
}

/*
 * Scroll state's only responsibility is scrolling the map
 * A pinchzoom state could be added to the state chain as the parent
 * of the scroll state. If the pinchzoom state determined that only
 * one finger was on the map, it could allow its substate to handle 
 * the touch.
 */
- (BOOL)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(![super touchesMoved:touches withEvent:event])
	{
		UITouch * touch = [touches anyObject];
		CGPoint offset = [touch offsetInView:controller_.view];
		scrollOffset_ = CGPointMake(scrollOffset_.x + offset.x, scrollOffset_.y + offset.y);
		[controller_ scrollMapToPosition:scrollOffset_];
	}
	return YES;
}

- (void)pushScrollingState:(State *)state
{
	[self pushState:state];
}

- (void)popScrollingState
{
	[self popState];
}


@end
