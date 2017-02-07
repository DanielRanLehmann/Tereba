//
//  Title.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/28/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Realm.h"

@interface Title : RLMObject

@property NSString *languageCode;
@property NSString *text;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Title>
RLM_ARRAY_TYPE(Title)
