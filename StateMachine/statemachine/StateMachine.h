//
//  StateMachine.h
//  StateMachine
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "State.h"

@interface StateMachine : NSObject {
    State *	currentState_;
}
@property (nonatomic, retain) State * currentState;

@end
