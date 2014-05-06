//
//  SetCard.m
//  Matchcard
//
//  Created by Junjie Su on 5/23/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (NSString *) contents
{
    NSString *patternStrings = self.pattern;
    if (self.number == 1)
    {
        patternStrings = patternStrings;
    }
    else if (self.number == 2) {
        patternStrings = [patternStrings stringByAppendingString:self.pattern];
    }
    else if (self.number == 3) {
        patternStrings = [patternStrings stringByAppendingString:self.pattern];
        patternStrings = [patternStrings stringByAppendingString:self.pattern];        
    }
    return patternStrings;
}


-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 2)
    {
        SetCard *card1 = [otherCards objectAtIndex:0];
        SetCard *card2 = [otherCards objectAtIndex:1];
        BOOL patternMatch = ([card1.pattern isEqualToString:self.pattern] && [card2.pattern isEqualToString:self.pattern]);
        BOOL numberMatch = ((card1.number == self.number) && (card2.number == self.number));
        BOOL shadingMatch = ((card1.shading == self.shading) && (card2.shading == self.shading));
        BOOL colorMatch = ((card1.color == self.color) && (card2.color == self.color));
        BOOL patternNotMatch = !([card1.pattern isEqualToString:self.pattern] || [card1.pattern isEqualToString:card2.pattern] || [card2.pattern isEqualToString:self.pattern]);
        BOOL numberNotMatch = !((card1.number == card2.number) || (card1.number == self.number) || (card2.number == self.number));
        BOOL shadingNotMatch = !((card1.shading == card2.shading) || (card1.shading == self.shading) || (card2.shading == self.shading));
        BOOL colorNotMatch = !((card1.color == card2.color) || (card1.color == self.color) || (card2.color == self.color));
        
        if ((patternMatch || patternNotMatch) && (numberMatch || numberNotMatch) && (shadingMatch || shadingNotMatch) && (colorMatch || colorNotMatch)) {
            score = 9;
        }
    }
    return score;
}

@synthesize pattern = _pattern;

+ (NSArray *) validPatterns
{
    return @[@"○",@"□",@"△"];
}


- (void)setPattern:(NSString *)pattern
{
    if([[SetCard validPatterns] containsObject:pattern]) {
        _pattern = pattern;
    }
}
                                 
- (NSString *) pattern
{
    return _pattern ? _pattern : @"?";
}

+ (NSUInteger) maxNumber
{
    return 2;
}

- (void)setNumber:(NSUInteger)number
{
    if (number <= [SetCard maxNumber])
    {
        _number = number;
    }
}

+ (NSUInteger) maxColor
{
    return 2;
}

- (void)setColor:(NSUInteger)color
{
    if (color <= [SetCard maxColor])
    {
        _color = color;
    }
}

+ (NSUInteger) maxShading
{
    return 2;
}

- (void)setShading:(NSUInteger)shading
{
    if (shading <= [SetCard maxShading])
    {
        _shading = shading;
    }
}


@end
