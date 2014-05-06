//
//  CardGameViewController.m
//  Matchcard
//
//  Created by Junjie Su on 4/28/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *flipsLabel;
@property (nonatomic) int flipCount;

@property (weak, nonatomic) IBOutlet UITextField *description;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UIButton *Deal;

//@property (strong, nonatomic) IBOutletCollection(UIButton) NSString *cardTitle;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController



-(CardMatchingGame *) game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                          usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}


- (void)setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
}
- (IBAction)switchGameMode:(UISwitch *)sender {
    self.game = [self.game initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    self.flipCount = 0;
    self.game.threeCardGame = !self.game.threeCardGame;
    [self updateUI];
}

-(void) updateUI
{
    UIImage *cardBackImage = [UIImage imageNamed:@"Steve_jobs.png"];
    UIImage *cardBackNoImage = [UIImage imageNamed:@""];
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.unplayable;
        cardButton.alpha = card.unplayable ? 0.3 : 1.0;
        if (!card.isFaceUp) {
            [cardButton setImage:cardBackImage forState:UIControlStateNormal];
        }
        else {
            [cardButton setImage:cardBackNoImage forState:UIControlStateNormal];
        }
        cardButton.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1);
    }
    self.scoreLable.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.description.text = self.game.message;

    
}


- (IBAction)reDeal:(UIButton *)sender {
    self.game = [self.game initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    self.flipCount = 0;
    [self updateUI];
}


/*
- (void) setCardTitle:(NSString *)cardTitle {
    _cardTitle = cardTitle;
    Card *card = [self.deck drawRandomCard];
    UIButton *cardButton;
    [cardButton setTitle:card.contents forState:UIControlStateSelected];
}
*/


- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}


@end
