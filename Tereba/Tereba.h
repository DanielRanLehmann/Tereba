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

/*!
 @brief In order to use Tereba you need to have a valid API Key.
 */
- (void)setupWithAPIKey:(NSString *)apiKey;

/*!
 @brief Updates tereba synchronously and creates the realm database if it's the first time updating. If it's the first time updating, it may take a while.
*/
- (void)update:(void (^)(BOOL hasFinished, NSError *error))handler;

/*!
 @brief Updates tereba asynchronously and creates the realm database if it's the first time updating. If it's the first time updating, it may take a while.
 */
- (void)asyncUpdate:(void (^)(BOOL hasFinished, NSError *error))handler;

@end
