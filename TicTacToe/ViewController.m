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
@property NSString *whoWon;
@property int labelOneValue; //danger in switching these from NSInteger to int?
@property int labelTwoValue;
@property int labelThreeValue;
@property int labelFourValue;
@property int labelFiveValue;
@property int labelSixValue;
@property int labelSevenValue;
@property int labelEightValue;
@property int labelNineValue;
@property int playerOneTotalValue;
@property int playerTwoTotalValue;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.whichPlayerLabel.text = @"X";

    self.labelOne.text = @"";
    self.labelTwo.text = @"";
    self.labelThree.text = @"";
    self.labelFour.text = @"";
    self.labelFive.text = @"";
    self.labelSix.text = @"";
    self.labelSeven.text = @"";
    self.labelEight.text = @"";
    self.labelNine.text = @"";

    self.playerOneTotalValue = 0;
    self.playerTwoTotalValue = 0;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGesture
{
    CGPoint point = [tapGesture locationInView:self.view];
    [self findLabelUsingPoint:point];
}

- (void) findLabelUsingPoint:(CGPoint)point
{
    //Wade added an example of using Arrays to HipChat - didn't want to do this now because I'm not totally sure I understand it - go back and redo it later - cuts down on a lot of code - basically what I did before I think in passing a creating a base UILabel class with all the labes and then using that base name once instead of listing them all out
    if (CGRectContainsPoint(self.labelOne.frame, point))
    {
        [self changeNameOfLabelToPlayerName:self.labelOne];
        [self addTotalAndDisplayMessage:self.labelOne];
    }
    else if (CGRectContainsPoint(self.labelTwo.frame, point))
    {
        [self changeNameOfLabelToPlayerName:self.labelTwo];
        [self addTotalAndDisplayMessage:self.labelTwo];
    }
    else if (CGRectContainsPoint(self.labelThree.frame, point))
    {
        [self changeNameOfLabelToPlayerName:self.labelThree];
        [self addTotalAndDisplayMessage:self.labelThree];
    }
    else if (CGRectContainsPoint(self.labelFour.frame, point))
    {
        [self changeNameOfLabelToPlayerName:self.labelFour];
        [self addTotalAndDisplayMessage:self.labelFour];
    }
    else if (CGRectContainsPoint(self.labelFive.frame, point))
    {
        [self changeNameOfLabelToPlayerName:self.labelFive];
        [self addTotalAndDisplayMessage:self.labelFive];
    }
    else if (CGRectContainsPoint(self.labelSix.frame, point))
    {
        [self changeNameOfLabelToPlayerName:self.labelSix];
        [self addTotalAndDisplayMessage:self.labelSix];
    }
    else if (CGRectContainsPoint(self.labelSeven.frame, point))
    {
        [self changeNameOfLabelToPlayerName:self.labelSeven];
        [self addTotalAndDisplayMessage:self.labelSeven];
    }
    else if (CGRectContainsPoint(self.labelEight.frame, point))
    {
        [self changeNameOfLabelToPlayerName:self.labelEight];
        [self addTotalAndDisplayMessage:self.labelEight];
    }
    else if (CGRectContainsPoint(self.labelNine.frame, point))
    {
        [self changeNameOfLabelToPlayerName:self.labelNine];
        [self addTotalAndDisplayMessage:self.labelNine];
    }

    if (self.playerOneTotalValue == 15) // I think my assignment for the valuations was switched around based on when I change the player name and the label name, so I had to swithc the X and O below
    {
        self.whoWon = @"O";
        [self callingAlertView:self.whoWon];
    }
    else if (self.playerTwoTotalValue == 15)
    {
        self.whoWon = @"X";
        [self callingAlertView:self.whoWon];
    }
    else if (self.playerOneTotalValue + self.playerTwoTotalValue == 45)
    {
        self.whoWon = @"Noone Won";
        [self callingAlertView:self.whoWon];
    }
}

- (void) callingAlertView:(NSString *)whoWonString
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:whoWonString message:(@"Won the Game!") delegate:nil cancelButtonTitle:@"Click to Restart" otherButtonTitles:nil, nil];
    [self viewDidLoad];
    [alertView show];

}

- (void) changeNameOfLabelToPlayerName:(UILabel *) labelName
{   if ([labelName.text isEqual: @""])
    {   labelName.text = self.whichPlayerLabel.text;

        if ([self.whichPlayerLabel.text isEqual: @"X"])
        {   self.whichPlayerLabel.text = @"O";
        }
        else if ([self.whichPlayerLabel.text isEqual: @"O"])
        {   self.whichPlayerLabel.text = @"X";
        }

        if ([labelName.text isEqual: @"O"])
        {   labelName.textColor = [UIColor redColor];
        }
        else if ([labelName.text isEqual: @"X"])
        {   labelName.textColor = [UIColor blueColor];
        }
    }
}

- (int) addTotalAndDisplayMessage:(UILabel *) labelName /* using the valuation method described here http://bit.ly/YYqaGI */
{
    if (labelName == self.labelOne)
    {
        if ([self.whichPlayerLabel.text isEqual:@"X"])
        {
            self.playerOneTotalValue = self.playerOneTotalValue + 8;
            NSLog(@"Label One Worked");
            return self.playerOneTotalValue;
        }
        else if ([self.whichPlayerLabel.text isEqual:@"O"])
        {
            self.playerTwoTotalValue = self.playerTwoTotalValue + 8;
            NSLog(@"Label One Worked");
            return self.playerTwoTotalValue;
        }
    }
    else if (labelName == self.labelTwo)
    {
        if ([self.whichPlayerLabel.text isEqual:@"X"])
        {
            self.playerOneTotalValue = self.playerOneTotalValue + 1;
            NSLog(@"Label Two Worked");
            return self.playerOneTotalValue;
        }
        else if ([self.whichPlayerLabel.text isEqual:@"O"])
        {
            self.playerTwoTotalValue = self.playerTwoTotalValue + 1;
            NSLog(@"Label Two Worked");
            return self.playerTwoTotalValue;
        }
    }
    else if (labelName == self.labelThree)
    {
        if ([self.whichPlayerLabel.text isEqual:@"X"])
        {
            self.playerOneTotalValue = self.playerOneTotalValue + 6;
            return self.playerOneTotalValue;
        }
        else if ([self.whichPlayerLabel.text isEqual:@"O"])
        {
            self.playerTwoTotalValue = self.playerTwoTotalValue + 6;
            return self.playerTwoTotalValue;
        }
    }
    else if (labelName == self.labelFour)
    {
        if ([self.whichPlayerLabel.text isEqual:@"X"])
        {
            self.playerOneTotalValue = self.playerOneTotalValue + 3;
            return self.playerOneTotalValue;
        }
        else if ([self.whichPlayerLabel.text isEqual:@"O"])
        {
            self.playerTwoTotalValue = self.playerTwoTotalValue + 3;
            return self.playerTwoTotalValue;
        }
    }
    else if (labelName == self.labelFive)
    {
        if ([self.whichPlayerLabel.text isEqual:@"X"])
        {
            self.playerOneTotalValue = self.playerOneTotalValue + 5;
            return self.playerOneTotalValue;
        }
        else if ([self.whichPlayerLabel.text isEqual:@"O"])
        {
            self.playerTwoTotalValue = self.playerTwoTotalValue + 5;
            return self.playerTwoTotalValue;
        }
    }
    else if (labelName == self.labelSix)
    {
        if ([self.whichPlayerLabel.text isEqual:@"X"])
        {
            self.playerOneTotalValue = self.playerOneTotalValue + 7;
            return self.playerOneTotalValue;
        }
        else if ([self.whichPlayerLabel.text isEqual:@"O"])
        {
            self.playerTwoTotalValue = self.playerTwoTotalValue + 7;
            return self.playerTwoTotalValue;
        }
    }
    else if (labelName == self.labelSeven)
    {
        if ([self.whichPlayerLabel.text isEqual:@"X"])
        {
            self.playerOneTotalValue = self.playerOneTotalValue + 4;
            return self.playerOneTotalValue;
        }
        else if ([self.whichPlayerLabel.text isEqual:@"O"])
        {
            self.playerTwoTotalValue = self.playerTwoTotalValue + 4;
            return self.playerTwoTotalValue;
        }
    }
    else if (labelName == self.labelEight)
    {
        if ([self.whichPlayerLabel.text isEqual:@"X"])
        {
            self.playerOneTotalValue = self.playerOneTotalValue + 9;
            return self.playerOneTotalValue;
        }
        else if ([self.whichPlayerLabel.text isEqual:@"O"])
        {
            self.playerTwoTotalValue = self.playerTwoTotalValue + 9;
            return self.playerTwoTotalValue;
        }
    }
    else if (labelName == self.labelNine)
    {
        if ([self.whichPlayerLabel.text isEqual:@"X"])
        {
            self.playerOneTotalValue = self.playerOneTotalValue + 2;
            return self.playerOneTotalValue;
        }
        else if ([self.whichPlayerLabel.text isEqual:@"O"])
        {
            self.playerTwoTotalValue = self.playerTwoTotalValue + 2;
            return self.playerTwoTotalValue;
        }
    }
    return 0;
}



@end
