//
//  Production.m
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Production.h"

@implementation Production

+ (NSString *)primaryKey {
    return @"code";
}

- (Organization *)organization {
    return [[Organization objectsWhere:@"code == %@", self.organizationCode] firstObject];
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

/*
+ (NSArray *)requiredProperties {
    return @[@"code", @"year", @"seasonName", @"languageCode", @"countryOfOrigin", @"formOfStructureName", @"formOfPremiereName", @"releaseDate", @"play", @"composition"];
}
*/

@end
