//
//  Show.m
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Show.h"
#import "Venue.h" 

@implementation Show

+ (NSString *)primaryKey {
    return @"code";
}

+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"venue": [RLMPropertyDescriptor descriptorWithClass:Venue.class propertyName:@"shows"],
             };
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
