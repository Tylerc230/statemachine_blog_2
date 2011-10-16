//
//  State.h
//  StateMachine
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StateMachine;
@interface State : NSObject {
	State *	substate_;
	StateMachine * stateMachine_;
}
@property (nonatomic, retain) State * substate;
/* Using assign to avoid circular retains */
@property (nonatomic, assign) StateMachine * stateMachine;

- (void)activate;
- (void)deactivate;
@end
