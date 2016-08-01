//
//  RWTweet.h
//  TwitterInstant
//
//  Created by Colin Eberhardt on 05/01/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWTweet : NSObject

@property (assign, nonatomic) NSInteger status;

@property (copy, nonatomic) NSString *profileImageUrl;

@property (copy, nonatomic) NSString *username;

@property (assign, nonatomic) NSInteger allTime;

@end
