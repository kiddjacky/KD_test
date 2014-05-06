//
//  SetCardGameViewController.m
//  Matchcard
//
//  Created by Junjie Su on 6/1/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardGame.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetCardGameViewController ()
@property (strong, nonatomic) SetCardGame *game;

+ (NSArray *) cardColorAttribute;
+ (NSArray *) cardShadingAttrbute;
@end



@implementation SetCardGameViewController

-(SetCardGame *) game
{
    if (!_game) _game = [[SetCardGame alloc] initWithCardCount:self.cardBottons.count usingDeck:[[SetCardDeck alloc] init]];
    
    return _game;
}


+(NSArray *) cardColorAttribute
{
    return @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor]];
}


+(NSArray *) cardShadingAttrbute
{
    return @[];
}

-(void) updateUI
{
    for (UIButton *cardButton in self.cardBottons) {
        Card *card = [self.game cardAtIndex:[self.cardBottons indexOfObject:cardButton]];
        NSMutableAttributedString *cardTitle = [[NSMutableAttributedString alloc] initWithString:card.contents attributes:@{NSForegroundColorAttributeName:self.cardColorAttribute[card.color], ];
        [cardButton setAttributedTitle:cardTitle forState:UIControlStateSelected];
        [cardButton setAttributedTitle:cardTitle  forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.unplayable;
        cardButton.alpha = card.unplayable ? 0.3 :1.0;
    }
    self.scoreLable.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.description.text = self.game.message;
}



@end
