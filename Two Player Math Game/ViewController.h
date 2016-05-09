//
//  ViewController.h
//  Two Player Math Game
//
//  Created by Anthony Coelho on 2016-05-09.
//  Copyright © 2016 Vectura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;
@property (weak, nonatomic) IBOutlet UILabel *problem;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property BOOL gameOn;

@property (strong, nonatomic) GameModel *model;


- (IBAction)buttonPressed:(UIButton *)sender;

@end

