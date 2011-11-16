//
//  ExampleAppViewController.m
//  StateMachine
//
//  Created by Tyler Casselman on 11/9/11.
//  Copyright (c) 2011 sfsoftwareist. All rights reserved.
//

#import "ExampleAppViewController.h"
#import "ScrollState.h"
#import "GamePlayState.h"

@implementation ExampleAppViewController
@synthesize myCow = myCow_;
@synthesize gameMap = gameMap_;
@synthesize backButton = backButton_;
@synthesize editButton = editButton_;
@synthesize modeLabel = modeLabel_;
- (id)init
{
    self = [super initWithNibName:@"ExampleAppViewController" bundle:nil];
    if (self) {
		
	
    }
    return self;
}

- (void)startUp
{
	stateMachine_ = [[StateMachine alloc] init];
	
	ScrollState * scrollState = [[ScrollState alloc] initWithController:self];
	GamePlayState * gamePlayState = [[GamePlayState alloc] initWithController:self];
	
	scrollState.substate = gamePlayState;
	stateMachine_.currentState = scrollState;
	
	[scrollState release], scrollState = nil;
	[gamePlayState release], gamePlayState = nil; 
}

- (void)dealloc
{
	[stateMachine_ release], stateMachine_ = nil;
	self.gameMap = nil;
	self.myCow = nil;
	self.editButton = nil;
	self.backButton = nil;
	self.modeLabel = nil;
}
#pragma Event handling methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[stateMachine_ touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[stateMachine_ touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[stateMachine_ touchesEnded:touches withEvent:event];
}

- (IBAction)editButtonTapped:(id)sender
{
	[stateMachine_ performSelector:@selector(editButtonTapped)];
}

- (IBAction)backButtonTapped:(id)sender
{
	[stateMachine_ performSelector:@selector(backButtonTapped)];	
}

#pragma Manipulation Methods

- (void)scrollMapToPosition:(CGPoint) mapPosition
{
	CGRect newFrame = self.gameMap.frame;
	newFrame.origin = mapPosition;
	self.gameMap.frame = newFrame;

}

- (void)moveCowByAmount:(CGPoint) offset
{
	CGPoint start = self.myCow.center;
	self.myCow.center = CGPointMake(start.x + offset.x, start.y + offset.y);
}

- (void)showBackButton:(BOOL)show
{
	self.backButton.hidden = !show;
}

- (void)showEditButton:(BOOL)show
{
	self.editButton.hidden = !show;
}

- (void)setLabelText:(NSString *)text
{
	self.modeLabel.text = text;
}

#pragma Query Methods

- (UIView *)getCowForTouch:(UITouch *)touch
{
	CGPoint touchPoint = [touch locationInView:self.gameMap];
	UIView * touchedView = [self.gameMap hitTest:touchPoint withEvent:nil];
	if(touchedView == self.myCow)
	{
		return self.myCow;
	}
	return nil;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
