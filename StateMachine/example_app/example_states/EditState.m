//
//  EditState.m
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "EditState.h"
#import "UITouch+Offset.h"

@implementation EditState

- (void)activate
{
	[super activate];
	[controller_ showBackButton:YES];
	[controller_ setLabelText:@"Edit Mode"];
}

- (void)deactivate
{
	[super deactivate];
	[controller_ showBackButton:NO];
	[controller_ setLabelText:@""];
}


- (void)backButtonTapped
{
	[self.stateMachine performSelector:@selector(popScrollingState)];
}

- (BOOL)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch * touch = [touches anyObject];
	UIView * cow = [controller_ getCowForTouch:touch];
	if(cow != nil)
	{
		draggingCow_ = YES;
	}
	return YES;//Doesn't really matter what we pass here b/c parent state doesn't check return value

}

- (BOOL)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(draggingCow_)
	{
		UITouch * touch = [touches anyObject];
		[controller_ moveCowByAmount:[touch offsetInView:controller_.view]];
		return YES;//we did handle the touch
	}
	return NO;//We are not dragging the cow, parent state can handle the touch

}

- (BOOL)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	draggingCow_ = NO;
	return YES;
}

- (BOOL)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	draggingCow_ = NO;
	return NO;
}
@end
