//
//  GamePlayState.m
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "GamePlayState.h"
#import "EditState.h"
@implementation GamePlayState

- (void)activate
{
	[super activate];
	[controller_ showEditButton:YES];
}
/*
 * This will be called when another state is 
 * pushed on top of this one.
 */
- (void)deactivate
{
	[super deactivate];
	[controller_ showEditButton:NO];
}

/*
 * This is where the 'editButtonTapped' message is handled
 * It will send the 'pushScrollingState:' method to the 
 * state machine, which will propagate the message to
 * the scroll state (since state machine doesn't implement that method)
 */
- (void)editButtonTapped
{
	EditState * editState = [[EditState alloc] initWithController:controller_];
	[self.stateMachine performSelector:@selector(pushScrollingState:) withObject:editState];
	[editState release], editState = nil;
}



@end
