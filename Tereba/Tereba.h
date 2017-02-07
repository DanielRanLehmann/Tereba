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

+ (instancetype)sharedTereba;

@property (readonly) RLMResults *events;
@property (readonly) RLMResults *organizations;

- (void)sync;

- (void)syncOrganizations;
- (void)syncEvents;

@end
