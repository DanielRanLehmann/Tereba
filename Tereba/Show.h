//
//  Show.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/16/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import <Realm/Realm.h>

@interface Show : RLMObject

@property NSString *date;
@property NSString *time;
@property NSString *type;
@property NSString *stage;
@property NSString *code;

@property (readonly) RLMLinkingObjects *venue;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Show>
RLM_ARRAY_TYPE(Show)
