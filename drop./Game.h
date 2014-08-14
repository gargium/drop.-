//
//  Game.h
//  drop.
//
//  Created by Gargium on 8/11/14.
//  Copyright (c) 2014 Gargium Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

float UpMovement;
float sideMovement;
int randomPosition;
int platform3SideMovement;
int platform5SideMovement;

BOOL ballLeft;
BOOL ballRight;
BOOL stopSideMovement;

float platformMoveDown;

int scoreNumber;
int highScoreNumber;
int addedScore;
int levelNumber;

BOOL platform1Used;
BOOL platform2Used;
BOOL platform3Used;
BOOL platform4Used;
BOOL platform5Used;

@interface Game : UIViewController
{
    
    IBOutlet UIButton *Start;
    IBOutlet UIImageView *Ball;
    IBOutlet UIImageView *Platform1;
    IBOutlet UIImageView *Platform2;
    IBOutlet UIImageView *Platform3;
    IBOutlet UIImageView *Platform4;
    IBOutlet UIImageView *Platform5;
    
    IBOutlet UILabel *score;
    IBOutlet UILabel *gameOver;
    IBOutlet UILabel *finalScore;
    IBOutlet UILabel *highScore;
    IBOutlet UIButton *exit;
    
    NSTimer *Movement;
    
}

-(IBAction) StartGame:(id)sender;
-(void) Moving;
-(void) Bounce;
-(void) PlatformMovement;
-(void) PlatformFall;
-(void) Scoring;
-(void) GameOver;


@end
