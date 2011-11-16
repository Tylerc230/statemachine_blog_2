//
//  ExampleAppViewController.h
//  StateMachine
//
//  Created by Tyler ; on 11/9/11.
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
	UILabel			* modeLabel_;
}
@property (nonatomic, retain) IBOutlet UIView * gameMap;
@property (nonatomic, retain) IBOutlet UIImageView * myCow;
@property (nonatomic, retain) IBOutlet UIButton * editButton;
@property (nonatomic, retain) IBOutlet UIButton * backButton;
@property (nonatomic, retain) IBOutlet UILabel * modeLabel;

- (IBAction)backButtonTapped:(id)sender;
- (IBAction)editButtonTapped:(id)sender;

- (void)startUp;

#pragma Manipulation Methods
- (void)scrollMapToPosition:(CGPoint) mapPosition;
- (void)moveCowByAmount:(CGPoint) offset;
- (void)showEditButton:(BOOL)show;
- (void)showBackButton:(BOOL)show;
- (void)setLabelText:(NSString *)text;


#pragma Query Methods
- (UIView *)getCowForTouch:(UITouch *)touch;


@end
