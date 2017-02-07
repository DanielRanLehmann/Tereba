//
//  TicketOffice.m
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "TicketOffice.h"

@implementation TicketOffice

- (NSString *)address {
    return [NSString stringWithFormat:@"%@ %@ %@ %@", self.number, self.street, self.postCode, self.city];
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties
{
    return @[@"number", @"letter", @"floor", @"side", @"landline"];
}

@end
