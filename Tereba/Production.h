//
//  Production.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Realm.h"
#import "Play.h"
#import "Composition.h"
#import "Organization.h"

@interface Production : RLMObject

@property NSString *organizationCode;
@property NSString *code; // primary key
@property NSNumber <RLMInt> *year;
@property NSString *seasonName;
@property NSString *languageCode;
@property NSString *countryOfOrigin;
@property NSString *formOfStructureName;
@property NSString *formOfPremiereName;
@property NSString *releaseDate;
@property Play *play;
@property Composition *composition;
@property (readonly) Organization *organization;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Production>
RLM_ARRAY_TYPE(Production)
