//
//  ViewController.m
//  Two Player Math Game
//
//  Created by Anthony Coelho on 2016-05-09.
//  Copyright © 2016 Vectura. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.model = [[GameModel alloc] init];
    self.gameOn = YES;
    self.messageLabel.text = nil;
    self.problem.text = [self.model generateProblem];
    
    [self showPlayersScore];


    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    if (sender.tag != 10) {
        [self.model addToAnswer:(int)sender.tag];
    }
    else {
        
        if (self.gameOn == YES) {
            
            self.messageLabel.text = [self.model checkAnswer];
            
            self.messageLabel.alpha = 1.0;
            
            if ([self.messageLabel.text isEqualToString:@"Correct!"]){
                self.messageLabel.backgroundColor = [UIColor greenColor];
            } else {
                self.messageLabel.backgroundColor = [UIColor redColor];
            }
        
             
            [UIView animateWithDuration:1.0 delay:0.0 options:0
                              animations:^{
                                  self.messageLabel.alpha = 0;
                              }
                             completion:nil];
        
            [self showPlayersScore];

            if ([self.model checkPlayersLives] == YES){
                
                self.problem.text = [self.model generateProblem];
                
            } else {
                
                [self displayWinner];
                
                self.gameOn = NO;
                
                [self playAgain];
            }
            
        }
  
    }
    
}

-(void)displayWinner{
    
    if (self.model.player1.numberOfLives >0) {
        self.problem.text = @"GAME OVER - Player 1 Wins!";
        
        [self playAgain];
        
    }
    else {
        self.problem.text = @"GAME OVER - Player 2 Wins!";
    }
    self.messageLabel.text = nil;
    
    
    
}

-(void)showPlayersScore{
    self.player1Score.text = [NSString stringWithFormat:@"Player 1 Score: %d",self.model.player1.numberOfLives];
    self.player2Score.text = [NSString stringWithFormat:@"Player 2 Score: %d",self.model.player2.numberOfLives];
    
}

-(void)playAgain{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"GAME OVER!"
                                                                   message:@"Play Again?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *playAgain = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *play) {
                                                              self.gameOn = YES;
                                                              self.model.player1.numberOfLives = 3;
                                                              self.model.player2.numberOfLives = 3;
                                                              self.problem.text = [self.model generateProblem];
                                                              [self showPlayersScore];
                                                          }];
    
    UIAlertAction *endGame = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * end) {
                                                              
                                                          
                                                          }];
    
    [alert addAction:playAgain];
    [alert addAction:endGame];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
