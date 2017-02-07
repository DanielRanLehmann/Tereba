//
//  Contact.m
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (NSString *)name {
    return [NSString stringWithFormat:@"%@ %@", self.firstname, self.lastname];
}

/*
+ (NSString *)primaryKey {
    return @"mobile";
}
*/

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties {
    return @[@"landline"];
}

@end
