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
 @brief You need to have a valid api key in order to use Tereba. For more information please contact me at: danielran11@gmail.com
 */
- (void)setupWithAPIKey:(NSString *)apiKey;

/*!
 @brief Method Updates tereba synchronously and creates the realm database if it's the first time updating. If it's the first time updating, it may take a while.
*/
- (void)update:(void (^)(BOOL hasFinished, NSError *error))handler;

/*!
 @brief Method Updates tereba asynchronously and creates the realm database if it's the first time updating. If it's the first time updating, it may take a while.
 */
- (void)asyncUpdate:(void (^)(BOOL hasFinished, NSError *error))handler;

@end
