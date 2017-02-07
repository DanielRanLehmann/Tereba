//
//  Organization.m
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Organization.h"
#import "Event.h" 

@implementation Organization

+ (NSString *)primaryKey {
    return @"code";
}

- (NSString *)address {
    return [NSString stringWithFormat:@"%@ %@ %@ %@", self.number, self.street, self.postCode, self.city];
}
// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)
- (RLMResults *)events {
    return [Event objectsWhere:@"organizationCode == %@", self.code];
}

+ (NSArray *)ignoredProperties {
    return @[@"poBox", @"cvr", @"number", @"letter", @"floor", @"side", @"landline", @"mobile"];
}

@end
