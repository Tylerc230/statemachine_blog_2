//
//  BaseExampleState.h
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "State.h"
#import "ExampleAppViewController.h"

@interface BaseExampleState : State
{
	ExampleAppViewController * controller_;

}
- (id)initWithController:(ExampleAppViewController *)controller;
@end
