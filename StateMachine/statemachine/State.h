//
//  State.h
//  StateMachine
//
//  Created by Tyler Casselman on 9/27/11.
//  Copyright 2011 sfsoftwareist. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface State : NSObject {
    State *	substate_;
}
@property (nonatomic, retain) State * substate;

- (void)activate;
- (void)deactivate;
@end
