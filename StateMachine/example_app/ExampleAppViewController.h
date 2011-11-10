//
//  ExampleAppViewController.h
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StateMachine.h"
@interface ExampleAppViewController : UIViewController
{
	UIView			* gameMap_;
	UIImageView		* myCow_;
	UIButton		* editButton_;
	UIButton		* backButton_;
	StateMachine	* stateMachine_;
}
@property (nonatomic, retain) IBOutlet UIView * gameMap;
@property (nonatomic, retain) IBOutlet UIImageView * myCow;
@property (nonatomic, retain) IBOutlet UIButton * editButton;
@property (nonatomic, retain) IBOutlet UIButton * backButton;

- (IBAction)backButtonTapped:(id)sender;
- (IBAction)editButtonTapped:(id)sender;

#pragma Manipulation Methods
- (void)scrollMapByAmount:(CGPoint) offset;


@end
