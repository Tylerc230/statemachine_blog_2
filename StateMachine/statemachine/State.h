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
	NSMutableArray * stateStack_;
	StateMachine * stateMachine_;
}
@property (nonatomic, retain) State * substate;
/* Using assign to avoid circular retains */
@property (nonatomic, assign) StateMachine * stateMachine;
//TODO: move to private category
@property (nonatomic, retain) NSMutableArray * stateStack;

- (void)activate;
- (void)deactivate;
- (void)pushState:(State *)state;
- (void)popState;
- (BOOL)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end
