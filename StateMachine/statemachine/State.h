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
- (BOOL)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end
