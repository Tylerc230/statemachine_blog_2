//
//  State.m
//  StateMachine
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import "State.h"


@implementation State
@synthesize substate = substate_;

- (void)setSubstate:(State *)substate
{
	if(substate_ == substate)
	{
		return;
	}
	[self.substate deactivate];
	[self.substate release];
	substate_ = [substate retain];
	[self.substate activate];
}

- (void)activate
{
	
}

- (void)deactivate
{
	
}

@end
