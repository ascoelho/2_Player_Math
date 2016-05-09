//
//  GameModel.m
//  Two Player Math Game
//
//  Created by Anthony Coelho on 2016-05-09.
//  Copyright © 2016 Vectura. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel


-(instancetype)init{
    self = [super init];
    if (self){
        _player1 = [[Player alloc] initWithPlayerNumber:1];
        _player1.myTurn = YES;
        _player2 = [[Player alloc] initWithPlayerNumber:2];
        _answer = 0;

    }
    return self;
}

-(NSString *)generateProblem {
    

    [self clearAnswer];
    
     int operation = 1 + arc4random() %(3);
    
    int playerNum;
    int number1 = 1 + arc4random() %(20);
    int number2 = 1 + arc4random() %(20);
    
    
    
    if (self.player1.myTurn == YES) {
        playerNum = 1;
        self.player1.myTurn = NO;
    }
    else {
        playerNum = 2;
        self.player1.myTurn = YES;
    }
    
    if (operation == 1) {
        self.rightAnswer = number1 + number2;
        return [NSString stringWithFormat:@"Player %d: %d + %d?",playerNum, number1, number2];
    }
    else if (operation ==2 && number1 > number2) {
        self.rightAnswer = number1 - number2;
        return [NSString stringWithFormat:@"Player %d: %d - %d?",playerNum, number1, number2];
    }
    else {
        self.rightAnswer = number1 * number2;
        return [NSString stringWithFormat:@"Player %d: %d x %d?",playerNum, number1, number2];
    }
    



}

-(void)addToAnswer:(int)value{
    
    
    self.answer = (self.answer * 10) + value;
    
}

-(NSString *)checkAnswer{
    
    if (self.answer != self.rightAnswer) {
        
        if (self.player1.myTurn == NO) {
            self.player1.numberOfLives -= 1;
        }
        else {
            self.player2.numberOfLives -= 1;
        }
        return @"Incorrect!";
    }
    else {
        return @"Correct!";
        
    }
 
}

-(void)clearAnswer{
    
    _answer = 0;
}

-(BOOL)checkPlayersLives{
    if (self.player1.numberOfLives > 0 && self.player2.numberOfLives > 0) {
        return YES;
    }
    else {
        return NO;
    }
}




@end
