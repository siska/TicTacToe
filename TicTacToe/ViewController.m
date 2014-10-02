//
//  ViewController.m
//  TicTacToe
//
//  Created by S on 10/2/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property CGPoint tapPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) findLabelUsingPoint:(CGPoint)point {
    //CGPoint tapPoint
    //[self.labelOne gestureRecognizers:point];
    if (CGRectContainsPoint(self.labelOne.frame, point)) {
        self.labelOne.text = self.whichPlayerLabel.text;
    } else if (CGRectContainsPoint(self.labelTwo.frame, point)) {
        self.labelTwo.text = self.whichPlayerLabel.text;
    } else if (CGRectContainsPoint(self.labelThree.frame, point)) {
        self.labelThree.text = self.whichPlayerLabel.text;
    } else if (CGRectContainsPoint(self.labelFour.frame, point)) {
        self.labelFour.text = self.whichPlayerLabel.text;
    } else if (CGRectContainsPoint(self.labelFive.frame, point)) {
        self.labelFive.text = self.whichPlayerLabel.text;
    } else if (CGRectContainsPoint(self.labelSix.frame, point)) {
        self.labelSix.text = self.whichPlayerLabel.text;
    } else if (CGRectContainsPoint(self.labelSeven.frame, point)) {
        self.labelSeven.text = self.whichPlayerLabel.text;
    } else if (CGRectContainsPoint(self.labelEight.frame, point)) {
        self.labelEight.text = self.whichPlayerLabel.text;
    } else if (CGRectContainsPoint(self.labelNine.frame, point)) {
        self.labelNine.text = self.whichPlayerLabel.text;
    }
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGesture {
    CGPoint point = [tapGesture locationInView:self.view];
    [self findLabelUsingPoint:point];
}











@end
