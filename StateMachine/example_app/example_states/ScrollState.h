//
//  ScrollState.h
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "BaseExampleState.h"

@interface ScrollState : BaseExampleState
{
	CGPoint scrollOffset_;
}
- (void)pushScrollingState:(State *)state;
- (void)popScrollingState;
@end
