//
//  ScrollState.m
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "ScrollState.h"
#import "EditState.h"
#import "UITouch+Offset.h"

@implementation ScrollState

- (BOOL)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(![super touchesMoved:touches withEvent:event])
	{
		UITouch * touch = [touches anyObject];
		CGPoint offset = [touch offsetInView:controller_.view];
		[controller_ scrollMapByAmount:offset];
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
