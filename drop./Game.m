//
//  Game.m
//  drop.
//
//  Created by Gargium on 8/11/14.
//  Copyright (c) 2014 Gargium Interactive. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void) GameOver {
    
    Ball.hidden = YES;
    Platform1.hidden = YES;
    Platform2.hidden = YES;
    Platform3.hidden = YES;
    Platform4.hidden = YES;
    Platform5.hidden = YES;
    score.hidden = YES;
    gameOver.hidden = NO;
    exit.hidden = NO;
    finalScore.hidden = NO;
    
    finalScore.text = [NSString stringWithFormat:@"Final Score: %i", scoreNumber];
    
    [Movement invalidate];
    
    if (scoreNumber > highScoreNumber) {
        highScoreNumber = scoreNumber;
        [[NSUserDefaults standardUserDefaults] setInteger:highScoreNumber forKey:@"HighScoreSaved"];
        highScore.hidden = NO;
    }
}

-(void) Scoring {
    
    scoreNumber = scoreNumber + addedScore;
    addedScore = addedScore - 1;
    
    if (addedScore < 0) {
        addedScore = 0;
    }
    
    score.text = [NSString stringWithFormat:@"%i", scoreNumber];
    
    if (scoreNumber > 500 && scoreNumber < 1000) {
        levelNumber = 2;
    }
    if (scoreNumber > 1000 && scoreNumber < 2000) {
        levelNumber = 3;
    }
    if (scoreNumber < 2000 && scoreNumber < 3000) {
        levelNumber = 4;
    }
    if (scoreNumber < 3000 && scoreNumber < 4000) {
        levelNumber = 5;
    }
    if (scoreNumber > 4000) {
        levelNumber = 6;
    }
}

-(void) PlatformFall {
    
    if (Ball.center.y > 500) {
        platformMoveDown = 1;
    }
    else if (Ball.center.y > 450) {
        platformMoveDown = 2;
    }
    else if (Ball.center.y > 400) {
        platformMoveDown = 4;
    }
    else if (Ball.center.y > 300) {
        platformMoveDown = 5;
    }
    else if (Ball.center.y > 250) {
        platformMoveDown = 6;
    }
}


-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    ballLeft = NO;
    ballRight = NO;
    
    stopSideMovement = YES;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    if (point.x < 160) {
        ballLeft = YES;
    }
    else {
        ballRight = YES;
    }
    
    
}



-(void) PlatformMovement {
    
    Platform1.center = CGPointMake(Platform1.center.x, Platform1.center.y + platformMoveDown);
    Platform2.center = CGPointMake(Platform2.center.x, Platform2.center.y + platformMoveDown);
    Platform3.center = CGPointMake(Platform3.center.x + platform3SideMovement, Platform3.center.y + platformMoveDown);
    Platform4.center = CGPointMake(Platform4.center.x, Platform4.center.y + platformMoveDown);
    Platform5.center = CGPointMake(Platform5.center.x + platform5SideMovement, Platform5.center.y + platformMoveDown);
    
    if (Platform3.center.x < 37) {
        switch (levelNumber) {
            case 1:
                platform3SideMovement = 2;
                break;
            case 2:
                platform3SideMovement = 3;
                break;
            case 3:
                platform3SideMovement = 4;
                break;
            case 4:
                platform3SideMovement = 5;
                break;
            case 5:
                platform3SideMovement = 6;
                break;
            case 6:
                platform3SideMovement = 7;
            default:
                break;
        }
    }
    
    if (Platform3.center.x > 283) {
        switch (levelNumber) {
            case 1:
                platform3SideMovement = -2;
                break;
            case 2:
                platform3SideMovement = -3;
                break;
            case 3:
                platform3SideMovement = -4;
                break;
            case 4:
                platform3SideMovement = -5;
                break;
            case 5:
                platform3SideMovement = -6;
                break;
            case 6:
                platform3SideMovement = -7;
            default:
                break;
        }
    }
    
    if(Platform5.center.x < 37) {
        switch (levelNumber) {
            case 1:
                platform5SideMovement = 2;
                break;
            case 2:
                platform5SideMovement = 3;
                break;
            case 3:
                platform5SideMovement = 4;
                break;
            case 4:
                platform5SideMovement = 5;
                break;
            case 5:
                platform5SideMovement = 6;
                break;
            case 6:
                platform5SideMovement = 7;
            default:
                break;
        }
    }
    
    if(Platform5.center.x > 283) {
        switch (levelNumber) {
            case 1:
                platform5SideMovement = -2;
                break;
            case 2:
                platform5SideMovement = -3;
                break;
            case 3:
                platform5SideMovement = -4;
                break;
            case 4:
                platform5SideMovement = -5;
                break;
            case 5:
                platform5SideMovement = -6;
                break;
            case 6:
                platform5SideMovement = -7;
            default:
                break;
        }
    }
    
    platformMoveDown = platformMoveDown - 0.1;
    
    if (platformMoveDown < 0) {
        platformMoveDown = 0;
    }
    
    if (Platform1.center.y > 575) {
        randomPosition = arc4random() % 248;
        randomPosition = randomPosition + 36;
        Platform1.center = CGPointMake(randomPosition, -6);
        platform1Used = NO;
    }
    if (Platform2.center.y > 575) {
        randomPosition = arc4random() % 248;
        randomPosition = randomPosition + 36;
        Platform2.center = CGPointMake(randomPosition, -6);
        platform2Used = NO;
    }
    if (Platform3.center.y > 575) {
        randomPosition = arc4random() % 248;
        randomPosition = randomPosition + 36;
        Platform3.center = CGPointMake(randomPosition, -6);
        platform3Used = NO;
    }
    if (Platform4.center.y > 575) {
        randomPosition = arc4random() % 248;
        randomPosition = randomPosition + 36;
        Platform4.center = CGPointMake(randomPosition, -6);
        platform4Used = NO;
    }
    if (Platform5.center.y > 575) {
        randomPosition = arc4random() % 248;
        randomPosition = randomPosition + 36;
        Platform5.center = CGPointMake(randomPosition, -6);
        platform5Used = NO;
    }
    
}

-(void)Moving {
    
    if (Ball.center.y > 580) {
        [self GameOver];
    }
    
    [self Scoring];
    
    if (Ball.center.y < 250) {
        Ball.center = CGPointMake(Ball.center.x, 250);
    }
    
    [self PlatformMovement];
    
    Ball.center = CGPointMake(Ball.center.x + sideMovement, Ball.center.y - UpMovement);
    
    if((CGRectIntersectsRect(Ball.frame, Platform1.frame)) && (UpMovement < -2)) {
        
        [self Bounce];
        [self PlatformFall];
        if (platform1Used == NO) {
            addedScore = 10;
            platform1Used = YES;
        }
        
    }
    
    if((CGRectIntersectsRect(Ball.frame, Platform2.frame)) && (UpMovement < -2)) {
        
        [self Bounce];
        [self PlatformFall];
        if (platform2Used == NO) {
            addedScore = 10;
            platform2Used = YES;
        }
        
    }
    
    if((CGRectIntersectsRect(Ball.frame, Platform3.frame)) && (UpMovement < -2)) {
        
        [self Bounce];
        [self PlatformFall];
        if (platform3Used == NO) {
            addedScore = 10;
            platform4Used = YES;
        }
        
    }
    
    if((CGRectIntersectsRect(Ball.frame, Platform4.frame)) && (UpMovement < -2)) {
        
        [self Bounce];
        [self PlatformFall];
        if (platform4Used == NO) {
            addedScore = 10;
            platform4Used = YES;
        }
        
    }
    
    if((CGRectIntersectsRect(Ball.frame, Platform5.frame)) && (UpMovement < -2)) {
        
        [self Bounce];
        [self PlatformFall];
        if (platform5Used == NO) {
            addedScore = 10;
            platform5Used = YES;
        }
        
    }
    
    UpMovement = UpMovement - 0.1;
    
    if (ballLeft == YES) {
        sideMovement = sideMovement - 0.3;
        if (sideMovement < -5) {
            sideMovement = -5;
        }
    }
    
    if (ballRight == YES) {
        sideMovement = sideMovement + 0.3;
        if (sideMovement > 5) {
            sideMovement = 5;
        }
    }
    
    
    if (stopSideMovement == YES && sideMovement > 0) {
     
        sideMovement = sideMovement - 0.1;
        if (sideMovement < 0) {
            sideMovement = 0;
            stopSideMovement = NO;
        }
    }
    
    if (stopSideMovement == YES && sideMovement < 0) {
        
        sideMovement = sideMovement + 0.1;
        if (sideMovement > 0) {
            sideMovement = 0;
            stopSideMovement = NO;
        }
    }
    
    if (Ball.center.x <  -11) {
        Ball.center = CGPointMake(330, Ball.center.y);
    }
    
    if (Ball.center.x > 330) {
        Ball.center = CGPointMake(-11, Ball.center.y);
    }
}

-(void)Bounce {
    
    
    //add cloud animation soon
    
    Ball.animationImages = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"dropSqueeze1.png"],
                            [UIImage imageNamed:@"dropSqueeze2.png"],
                            [UIImage imageNamed:@"dropSqueeze1.png"],
                            [UIImage imageNamed:@"drop.png"], nil];
    
    [Ball setAnimationRepeatCount:1];
    Ball.animationDuration = 0.2;
    
    [Ball startAnimating];
    
    if (Ball.center.y > 450) {
        UpMovement = 5;
    }
    else if (Ball.center.y > 350) {
        UpMovement = 4;
    }
    else if (Ball.center.y > 250) {
        UpMovement = 3;
    }
}

-(IBAction) StartGame:(id)sender {
    
    Start.hidden = YES;
    UpMovement = -5;
    
    Movement = [NSTimer scheduledTimerWithTimeInterval:0.0125 target:self selector:@selector(Moving)
                                              userInfo:nil repeats:YES];
    
    Platform2.hidden = NO;
    Platform3.hidden = NO;
    Platform4.hidden = NO;
    Platform5.hidden = NO;
    
    //generates a random int between 36 and 284
    randomPosition = arc4random()%248;
    randomPosition = randomPosition + 36;
    
    //set height
    Platform2.center = CGPointMake(randomPosition, 448);
    
    //generates a random int between 36 and 284
    randomPosition = arc4random()%248;
    randomPosition = randomPosition + 36;
    
    //set height
    Platform3.center = CGPointMake(randomPosition, 336);
    
    //generates a random int between 36 and 284
    randomPosition = arc4random()%248;
    randomPosition = randomPosition + 36;
    
    //set height
    Platform4.center = CGPointMake(randomPosition, 224);
    
    //generates a random int between 36 and 284
    randomPosition = arc4random()%248;
    randomPosition = randomPosition + 36;
    
    //set height
    Platform5.center = CGPointMake(randomPosition, 112);
    
    platform3SideMovement = -2;
    platform5SideMovement = 2;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    Platform2.hidden = YES;
    Platform3.hidden = YES;
    Platform4.hidden = YES;
    Platform5.hidden = YES;

    gameOver.hidden = YES;
    finalScore.hidden = YES;
    highScore.hidden = YES;
    exit.hidden = YES;
    
    scoreNumber = 0;
    addedScore = 0;
    
    levelNumber = 1;
    
    platform1Used = NO;
    platform2Used = NO;
    platform3Used = NO;
    platform4Used = NO;
    platform5Used = NO;

    
    highScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    UpMovement = 0;
    sideMovement = 0;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
