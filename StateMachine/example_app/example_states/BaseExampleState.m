//
//  BaseExampleState.m
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "BaseExampleState.h"
#import "ExampleAppViewController.h"

@implementation BaseExampleState
- (id)initWithController:(ExampleAppViewController *)controller
{
	if((self = [super init]))
	{
		controller_ = [controller retain];
	}
	return self;
}

- (void)dealloc
{
	[controller_ release], controller_ = nil;
	[super dealloc];
}


@end
