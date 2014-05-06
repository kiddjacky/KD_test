//
//  Card.m
//  Matchcard
//
//  Created by Junjie Su on 4/28/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize contents = _contents;

- (NSString *)contents
{
    return _contents;
}

- (void)setContents:(NSString *)contents
{
    _contents = contents;
}


- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for(Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}


 @synthesize faceUp = _faceUp;
 @synthesize unplayable = _unplayable;
 
 - (BOOL)isFaceUp
 {
 return _faceUp;
 }
 
 -(void)setFaceUp:(BOOL)faceUp
 {
 _faceUp = faceUp;
 }
 
 - (BOOL)isUnplayable
 {
 return _unplayable;
 }
 
 - (void)setUnplayable:(BOOL)unplayable
 {
 _unplayable = unplayable;
 }
 



@end
