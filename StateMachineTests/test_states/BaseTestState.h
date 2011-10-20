//
//  BaseTestState.h
//  StateMachine
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "State.h"

#define METHOD_CALLED [methodsCalled_ addObject:NSStringFromSelector(_cmd)];

@interface BaseTestState : State {
    BOOL activateCalled_;
	BOOL deactivateCalled_;
	NSMutableArray * methodsCalled_;
}
@property (nonatomic, readonly) BOOL activateCalled;
@property (nonatomic, readonly) BOOL deactivateCalled;
@property (nonatomic, readonly) BOOL aCalled;
@property (nonatomic, readonly) BOOL bCalled;
@property (nonatomic, readonly) BOOL cCalled;
- (BOOL)touchBeganCalled;
- (BOOL)touchMovedCalled;
- (BOOL)touchEndedCalled;
- (BOOL)touchCancelledCalled;

@property (nonatomic, readonly) BOOL stateMachineSet;

- (void)callA;



@end
