//
//  Event.m
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Event.h"

@implementation Event

+ (NSString *)primaryKey {
    return @"code";
}

- (Organization *)organization {
    return [[Organization objectsWhere:@"code == %@", self.organizationCode] firstObject];
}

// drop the 'localized' prefix for the attributes below. and call description eventDescription, because 'description' is taken. 
- (NSString *)localizedTitle {
    
    // DEFAULTS / FALLBACKS to DA.
    Title *foundTitle = [[self.titles objectsWhere:@"languageCode == 'da'"] firstObject];
    NSString *_localizedTitle = foundTitle.text;
    
    NSString *languageCode = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLog(@"languageCode: %@", languageCode); // da-us?
    if (![languageCode isEqualToString:@"da-DK"]) {
        RLMResults *results = [self.titles objectsWhere:@"languageCode == 'en'"];
        if (results.count == 1) {
            Title *foundTitle = [results firstObject];
            _localizedTitle = foundTitle.text;
        }
    }
    
    return _localizedTitle;
}

- (NSString *)localizedSubtitle {
    
    // DEFAULTS / FALLBACKS to DA.
    Subtitle *foundSubtitle = [[self.subtitles objectsWhere:@"languageCode == 'da'"] firstObject];
    NSString *_localizedSubtitle = foundSubtitle.text;
    
    NSString *languageCode = [[NSLocale preferredLanguages] objectAtIndex:0];
    if (![languageCode isEqualToString:@"da-DK"]) {
        RLMResults *results = [self.subtitles objectsWhere:@"languageCode == 'en'"];
        if (results.count == 1) {
            Subtitle *foundSubtitle = [results firstObject];
            _localizedSubtitle = foundSubtitle.text;
        }
    }
    
    return _localizedSubtitle;
}

- (NSString *)localizedTeaser {
    
    // DEFAULTS / FALLBACKS to DA.
    Teaser *foundTeaser = [[self.teasers objectsWhere:@"languageCode == 'da'"] firstObject];
    NSString *_localizedTeaser = foundTeaser.text;
    
    NSString *languageCode = [[NSLocale preferredLanguages] objectAtIndex:0];
    if (![languageCode isEqualToString:@"da-DK"]) {
        RLMResults *results = [self.subtitles objectsWhere:@"languageCode == 'en'"];
        if (results.count == 1) {
            Teaser *foundTeaser = [results firstObject];
            _localizedTeaser = foundTeaser.text;
        }
    }
    
    return _localizedTeaser;
}

- (NSString *)localizedDescription {
    
    // DEFAULTS / FALLBACKS to DA.
    Description *foundDescription = [[self.descriptions objectsWhere:@"languageCode == 'da'"] firstObject];
    NSString *_localizedDescription = foundDescription.text;
    
    NSString *languageCode = [[NSLocale preferredLanguages] objectAtIndex:0];
    if (![languageCode isEqualToString:@"da-DK"]) {
        RLMResults *results = [self.descriptions objectsWhere:@"languageCode == 'en'"];
        if (results.count == 1) {
            Description *foundDescription = [results firstObject];
            _localizedDescription = foundDescription.text;
        }
    }
    
    return _localizedDescription;
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties
{
    return @[];
}

@end
