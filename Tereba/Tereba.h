//
//  Tereba.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 1/3/17.
//  Copyright © 2017 Daniel Ran Lehmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

#import "Organization.h"
#import "Event.h" 

@interface Tereba : NSObject

+ (instancetype)shared;
- (instancetype)initWithAPIKey:(NSString *)apiKey;

@property (readonly, nonatomic) NSString *apiKey;

@property (readonly) RLMResults *events;
@property (readonly) RLMResults *organizations;

- (void)setupWithAPIKey:(NSString *)apiKey;

- (void)update:(void (^)(BOOL isUpdating))handler;
- (void)asyncUpdate:(void (^)(BOOL isUpdating))handler;

@end
