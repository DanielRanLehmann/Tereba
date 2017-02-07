//
//  Stage.h
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 12/21/16.
//  Copyright © 2016 Daniel Ran Lehmann. All rights reserved.
//

#import "Realm.h"

@interface Stage : RLMObject

@property NSString *name;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Stage>
RLM_ARRAY_TYPE(Stage)
