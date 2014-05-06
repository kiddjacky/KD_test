//
//  Card.h
//  Matchcard
//
//  Created by Junjie Su on 4/28/13.
//  Copyright (c) 2013 Junjie Su. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;


@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end
