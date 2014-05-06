//
//  SetCardDeck.m
//  Matchcard
//
//  Created by Junjie Su on 5/23/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (id) init
{
    self = [super init];
    
    if (self)
    {
        for (NSString *pattern in [SetCard validPatterns]) {
            for (NSUInteger number=0; number <= [SetCard maxNumber]; number++) {
                for (NSUInteger color=0; color<= [SetCard maxColor]; color++) {
                    for (NSUInteger shading=0; shading <= [SetCard maxShading]; shading++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.number = number;
                        card.color = color;
                        card.shading = shading;
                        card.pattern = pattern;
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    
    return self;
}


@end
