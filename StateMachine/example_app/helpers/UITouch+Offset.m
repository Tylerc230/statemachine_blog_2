//
//  UITouch+UITouch_Offset.m
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "UITouch+Offset.h"

@implementation UITouch (Offset)

- (CGPoint)offsetInView:(UIView *)view
{
	CGPoint currentPoint = [self locationInView:view];
	CGPoint previousPoint = [self previousLocationInView:view];
	CGPoint offset = CGPointMake(currentPoint.x - previousPoint.x, currentPoint.y - previousPoint.y);
	return offset;
}

@end
