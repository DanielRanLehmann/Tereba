//
//  Venue.m
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Venue.h"
#import "Event.h" 

@implementation Venue

+ (NSString *)primaryKey {
    return @"code";
}

- (NSString *)address {
    return [NSString stringWithFormat:@"%@ %@ %@ %@", self.number, self.street, self.postCode, self.city];
}

// Specify default values for properties
+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"event": [RLMPropertyDescriptor descriptorWithClass:Event.class propertyName:@"venues"],
             };
}
//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties {
    return @[@"number", @"letter", @"floor", @"side", @"landline", @"mobile"];
}

@end
