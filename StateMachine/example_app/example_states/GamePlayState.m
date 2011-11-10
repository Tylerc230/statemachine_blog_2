//
//  GamePlayState.m
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "GamePlayState.h"

@implementation GamePlayState

- (void)activate
{
	[super activate];
	[controller_ showEditButton:YES];
}

- (void)deactivate
{
	[super deactivate];
	[controller_ showEditButton:NO];
}

@end
