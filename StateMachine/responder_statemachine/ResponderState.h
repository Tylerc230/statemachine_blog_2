//
//  ResponderState.h
//  StateMachine
//
//  Created by Tyler Casselman on 10/15/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "State.h"

@interface ResponderState : State
{
	
}
@property (nonatomic, retain) ResponderState * responderSubstate;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
@end
