//
//  Play.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>

@interface Play : RLMObject

@property NSString *writer;
@property NSNumber <RLMInt> *yearOfPublication;
@property NSString *language;
@property NSString *translator;
@property NSNumber <RLMInt> *yearOfTranslation;
@property NSString *translatedToLanguage;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Play>
RLM_ARRAY_TYPE(Play)
