//
//  Tereba.m
//  Realm-Getting-Started
//
//  Created by Daniel Ran Lehmann on 1/3/17.
//  Copyright © 2017 Daniel Ran Lehmann. All rights reserved.
//

#import "Tereba.h"
#import <AFNetworking/AFNetworking.h>
#import <PINCache/PINCache.h>

@interface Tereba () {
    RLMRealm *realm;
}

@end

@implementation Tereba

// setup with an api key.. so you must have an api key in order to use Tereba mobile.

/*
+ (void)setupWithAPIKey:(NSString *)apiKey {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[NSString stringWithFormat:@"https://tereba-example.firebaseio.com/api_keys/%@", apiKey] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"success? : %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"error: %@", error);
    }];
    
}
 */

- (void)update:(void (^)(BOOL isUpdating))handler {
    
    // timestamp logic goes here.
    // access pincached timestamps right here.
    
    handler(YES);
    
    if ([[PINCache sharedCache] containsObjectForKey:@"organizationsNextUpdate"]) {
        [[PINCache sharedCache] objectForKey:@"organizationsNextUpdate"
                                       block:^(PINCache *cache, NSString *key, id object) {
                                           NSTimeInterval organizationsNextUpdate = [(NSNumber *)object doubleValue];
                                           NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
                                           if (currentTime >= organizationsNextUpdate) {
                                               [self syncOrganizations];
                                           }
                                           
                                           else {
                                               NSLog(@"organizations are all up to date. no reason to update DB");
                                           }
                                           
                                       }];
    }
    
    else {
        [self syncOrganizations];
    }
    
    
    
    if ([[PINCache sharedCache] containsObjectForKey:@"eventsNextUpdate"]) {
        [[PINCache sharedCache] objectForKey:@"eventsNextUpdate"
                                       block:^(PINCache *cache, NSString *key, id object) {
                                           NSTimeInterval eventsNextUpdate = [(NSNumber *)object doubleValue];
                                           NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
                                           if (currentTime >= eventsNextUpdate) {
                                               [self syncEvents];
                                           }
                                           
                                           else {
                                               NSLog(@"events are all up to date. no reason to update DB");
                                           }
                                           
                                       }];
    }
    
    else {
        [self syncEvents];
    }
    
    handler(NO);

}

- (void)asyncUpdate:(void (^)(BOOL isUpdating))handler { // timestamp update.
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        [self update:handler];
    });
    
}

- (void)setupWithAPIKey:(NSString *)apiKey {
    if (apiKey.length > 0) {
        
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://afternoon-thicket-58704.herokuapp.com/"]];
        
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/json"];
        
        [manager GET:[NSString stringWithFormat:@"validate_api_key"] parameters:@{@"api_key" : apiKey} progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            
            if ([responseObject containsObject:@"is_valid"]) {
                BOOL isValid = [[responseObject objectForKey:@"is_valid"] boolValue];
                if (isValid) {
                    _apiKey = apiKey;
                }
                
                [[PINCache sharedCache] setObject:@{@"is_valid" : [NSNumber numberWithBool:isValid], @"api_key" : apiKey} forKey:@"api_key"];
            }
            
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            NSLog(@"error: %@", error);
        }];
    }
}

+ (instancetype)shared {
    static Tereba *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    
    return shared;
}

- (instancetype)initWithAPIKey:(NSString *)apiKey {
    
    self = [super init];
    if (self) {
        [self setupWithAPIKey:apiKey];
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        realm = [RLMRealm defaultRealm];
        
        NSURL *fileURL = [RLMRealmConfiguration defaultConfiguration].fileURL;
        NSLog(@"fileURL: %@", fileURL);
    }
    
    return self;
}

- (RLMResults *)events {
    return [Event allObjects];
}

- (RLMResults *)organizations {
    return [Organization allObjects];
}

/*
- (NSTimeInterval)organizationsLastUpdated {
    __block NSTimeInterval organizationsLastUpdated = 0;
    [[PINCache sharedCache] objectForKey:@"organizationsLastUpdated"
                                   block:^(PINCache *cache, NSString *key, id object) {
                                       organizationsLastUpdated = [(NSNumber *)object doubleValue];
                                       
                                   }];
    
    return organizationsLastUpdated;
}
*/

- (void)sync {
    
    // timestamp logic goes here.
    // access pincached timestamps right here.
    
    NSLog(@"this is called");
    
    if ([[PINCache sharedCache] containsObjectForKey:@"organizationsNextUpdate"]) {
        [[PINCache sharedCache] objectForKey:@"organizationsNextUpdate"
                                       block:^(PINCache *cache, NSString *key, id object) {
                                           NSTimeInterval organizationsNextUpdate = [(NSNumber *)object doubleValue];
                                           NSLog(@"organizationNextUpdate: %f", organizationsNextUpdate);
                                           
                                           NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
                                           if (currentTime >= organizationsNextUpdate) {
                                               [self syncOrganizations];
                                           }
                                           
                                           else {
                                               NSLog(@"organizations are all up to date. no reason to update DB");
                                           }
                                           
                                       }];
    }
    
    else {
        [self syncOrganizations];
    }
    
    
   
    if ([[PINCache sharedCache] containsObjectForKey:@"eventsNextUpdate"]) {
        [[PINCache sharedCache] objectForKey:@"eventsNextUpdate"
                                       block:^(PINCache *cache, NSString *key, id object) {
                                           NSTimeInterval eventsNextUpdate = [(NSNumber *)object doubleValue];
                                           NSLog(@"eventsNextUpdate: %f", eventsNextUpdate);
                                           
                                           NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
                                           if (currentTime >= eventsNextUpdate) {
                                               [self syncEvents];
                                           }
                                           
                                           else {
                                               NSLog(@"events are all up to date. no reason to update DB");
                                           }
                                           
                                       }];
    }
    
    else {
        [self syncEvents];
    }
}

- (void)syncOrganizations {
    
    NSLog(@"update has started.");
    [self requestOrganizationsWithCompletionHandler:^(id response, NSError *error) {
        if (!error) {
            
            [[PINCache sharedCache] setObject:response[@"lastUpdated"] forKey:@"organizationsLastUpdated" block:nil];
            [[PINCache sharedCache] setObject:response[@"nextUpdate"] forKey:@"organizationsNextUpdate" block:nil];
            
            NSArray *newOrganizations = response[@"data"];
            
            if ([[Organization allObjects] count] > 0) {
                
                if (newOrganizations.count > 0) {
                    
                    RLMResults *currentOrganizations = [Organization allObjects];
                    
                    BOOL organizationWasFound = false;
                    for (Organization *currentOrganization in currentOrganizations) {
                        for (NSDictionary *newOrganization in newOrganizations) {
                            if ([currentOrganization.code isEqualToString:newOrganization[@"code"]]) {
                                organizationWasFound = true;
                                // BREAK OUT OF LOOP.
                            }
                        }
                        
                        if (!organizationWasFound) {
                            NSLog(@"DELETE OLD ORGANIZATION is called.");
                            // DELETE 'OLD' ORGANIZATION.
                            [realm beginWriteTransaction];
                            
                            for (Description *description in currentOrganization.descriptions) {
                                [realm deleteObject:description];
                            }
                            
                            for (Subsidy *subsidy in currentOrganization.governmentSubsidies) {
                                [realm deleteObject:subsidy];
                            }
                            
                            [realm deleteObject:currentOrganization.contact];
                            
                            for (Profile *profile in currentOrganization.producerProfiles) {
                                [realm deleteObject:profile];
                            }
                            
                            for (Profile *profile in currentOrganization.organizerProfiles) {
                                [realm deleteObject:profile];
                            }
                            
                            [realm deleteObject:currentOrganization];
                            [realm commitWriteTransaction];
                        }
                        
                    }
                    
                    for (NSDictionary *newOrganization in newOrganizations) {
                        //for (Organization *currentOrganization in currentOrganizations) {
                        BOOL organizationWasFound = false;
                        
                        Organization *currentOrganization = [[Organization objectsWhere:@"code == %@", newOrganization[@"code"]] firstObject];
                        
                        if (currentOrganization) {
                            organizationWasFound = true;
                            if (![newOrganization[@"checksum"] isEqualToString:currentOrganization.checksum]) {
                                // UPDATE ORGANIZATION.
                                NSLog(@"Upading organization.");
                                [realm beginWriteTransaction];
                                
                                for (Description *description in currentOrganization.descriptions) {
                                    [realm deleteObject:description];
                                }
                                
                                for (Subsidy *subsidy in currentOrganization.governmentSubsidies) {
                                    [realm deleteObject:subsidy];
                                }
                                
                                [realm deleteObject:currentOrganization.contact];
                                
                                for (Profile *profile in currentOrganization.producerProfiles) {
                                    [realm deleteObject:profile];
                                }
                                
                                for (Profile *profile in currentOrganization.organizerProfiles) {
                                    [realm deleteObject:profile];
                                }
                                
                                [realm commitWriteTransaction];
                                
                                Organization *organization = [[Organization alloc] initWithValue:newOrganization];
                                [realm beginWriteTransaction];
                                [realm addOrUpdateObject:organization];
                                [realm commitWriteTransaction];
                                
                                // BREAK OUT OF LOOP.
                            }
                            
                            else {
                                // EVERYTHING IS UP TO DATE
                            }
                        }
                        
                        if (!organizationWasFound) {
                            NSLog(@"adding a brand new organization.");
                            // ADD ORGANIZATION.
                            Organization *organization = [[Organization alloc] initWithValue:newOrganization];
                            [realm beginWriteTransaction];
                            [realm addOrUpdateObject:organization];
                            [realm commitWriteTransaction];
                            
                        }
                    }
                }
                
                else {
                    [realm beginWriteTransaction];
                    [realm deleteAllObjects];
                    [realm commitWriteTransaction];
                }
            }
            
            else {
                
                NSLog(@"adding the whole shabang.");
                
                for (NSDictionary *newOrganization in newOrganizations) {
                    Organization *organization = [[Organization alloc] initWithValue:newOrganization];
                    
                    [realm beginWriteTransaction];
                    [realm addOrUpdateObject:organization];
                    [realm commitWriteTransaction];
                }
            }
        }
        
        else {
            NSLog(@"error: %@", [error localizedDescription]);
            return;
        }
    }];
}

- (void)syncEvents {
    
    [self requestEventsWithCompletionHandler:^(id response, NSError *error) {
        if (!error) {
            
            [[PINCache sharedCache] setObject:response[@"lastUpdated"] forKey:@"eventsLastUpdated" block:nil];
            [[PINCache sharedCache] setObject:response[@"nextUpdate"] forKey:@"eventsNextUpdate" block:nil];
            
            NSArray *newEvents = response[@"data"];
            
            if ([[Event allObjects] count] > 0) {
                
                if (newEvents.count > 0) {
                    
                    RLMResults *currentEvents = [Event allObjects];
                    
                    BOOL eventWasFound = false;
                    for (Event *currentEvent in currentEvents) {
                        for (NSDictionary *newEvent in newEvents) {
                            if ([currentEvent.code isEqualToString:newEvent[@"code"]]) {
                                eventWasFound = true;
                                // BREAK OUT OF LOOP.
                            }
                        }
                        
                        if (!eventWasFound) {
                            NSLog(@"DELETE OLD Event is called.");
                            // DELETE 'OLD' ORGANIZATION.
                            [realm beginWriteTransaction];
                            
                            for (Title *title in currentEvent.titles) {
                                [realm deleteObject:title];
                            }
                            
                            for (Subtitle *subtitle in currentEvent.subtitles) {
                                [realm deleteObject:subtitle];
                            }
                            
                            for (Teaser *teaser in currentEvent.teasers) {
                                [realm deleteObject:teaser];
                            }
                            
                            for (Description *description in currentEvent.descriptions) {
                                [realm deleteObject:description];
                            }
                            
                            Production *production = [[Production objectsWhere:@"code == %@", currentEvent.production.code] firstObject];
                            if (production) {
                                [realm deleteObject:production.play];
                                [realm deleteObject:production.composition];
                                [realm deleteObject:production];
                            }
                            
                            [realm deleteObject:currentEvent.contact];
                            
                            for (Accreditation *accreditation in currentEvent.accreditations) {
                                [realm deleteObject:accreditation];
                            }
                            
                            for (Accreditation *accreditation in currentEvent.accreditations) {
                                [realm deleteObject:accreditation];
                            }
                            
                            //
                            for (Venue *venue in currentEvent.venues) {
                                [realm deleteObject:venue];
                            }
                            
                            for (Ticket *ticket in currentEvent.tickets) {
                                
                                for (PriceGroup *priceGroup in ticket.priceGroups) {
                                    [realm deleteObject:priceGroup.price];
                                }
                                [realm deleteObject:ticket];
                            }
                            
                            for (OtherTicketType *otherTicketType in currentEvent.otherTicketTypes) {
                                [realm deleteObject:otherTicketType];
                            }
                            
                            for (TicketAgencyInfo *ticketAgencyInfo in currentEvent.ticketAgencyInfos) {
                                [realm deleteObject:ticketAgencyInfo];
                            }
                            
                            [realm deleteObject:currentEvent.ticketOffice];
                            
                            for (Service *service in currentEvent.services) {
                                [realm deleteObject:service];
                            }
                            
                            [realm deleteObject:currentEvent];
                            [realm commitWriteTransaction];
                        }
                        
                    }
                    
                    for (NSDictionary *newEvent in newEvents) {
                        BOOL eventWasFound = false;
                        
                        Event *currentEvent = [[Event objectsWhere:@"code == %@", newEvent[@"code"]] firstObject];
                        
                        if (currentEvent) {
                            eventWasFound = true;
                            if (![newEvent[@"checksum"] isEqualToString:currentEvent.checksum]) {
                                // UPDATE ORGANIZATION.
                                NSLog(@"updating event.");
                                [realm beginWriteTransaction];
                                
                                for (Title *title in currentEvent.titles) {
                                    [realm deleteObject:title];
                                }
                                
                                for (Subtitle *subtitle in currentEvent.subtitles) {
                                    [realm deleteObject:subtitle];
                                }
                                
                                for (Teaser *teaser in currentEvent.teasers) {
                                    [realm deleteObject:teaser];
                                }
                                
                                for (Description *description in currentEvent.descriptions) {
                                    [realm deleteObject:description];
                                }
                                
                                Production *production = [[Production objectsWhere:@"code == %@", currentEvent.production.code] firstObject];
                                if (production) {
                                    [realm deleteObject:production.play];
                                    [realm deleteObject:production.composition];
                                    [realm deleteObject:production];
                                }
                                
                                [realm deleteObject:currentEvent.contact];
                                
                                for (Accreditation *accreditation in currentEvent.accreditations) {
                                    [realm deleteObject:accreditation];
                                }
                                
                                for (Accreditation *accreditation in currentEvent.accreditations) {
                                    [realm deleteObject:accreditation];
                                }
                                
                                //
                                for (Venue *venue in currentEvent.venues) {
                                    [realm deleteObject:venue];
                                }
                                
                                for (Ticket *ticket in currentEvent.tickets) {
                                    
                                    for (PriceGroup *priceGroup in ticket.priceGroups) {
                                        [realm deleteObject:priceGroup.price];
                                    }
                                    [realm deleteObject:ticket];
                                }
                                
                                for (OtherTicketType *otherTicketType in currentEvent.otherTicketTypes) {
                                    [realm deleteObject:otherTicketType];
                                }
                                
                                for (TicketAgencyInfo *ticketAgencyInfo in currentEvent.ticketAgencyInfos) {
                                    [realm deleteObject:ticketAgencyInfo];
                                }
                                
                                [realm deleteObject:currentEvent.ticketOffice];
                                
                                for (Service *service in currentEvent.services) {
                                    [realm deleteObject:service];
                                }
                                
                                [realm commitWriteTransaction];
                                
                                Event *event = [[Event alloc] initWithValue:newEvent];
                                [realm beginWriteTransaction];
                                [realm addOrUpdateObject:event];
                                [realm commitWriteTransaction];
                                
                                // BREAK OUT OF LOOP.
                            }
                            
                            else {
                                // EVERYTHING IS UP TO DATE
                            }
                        }
                        
                        if (!eventWasFound) {
                            NSLog(@"adding a brand new organization.");
                            // ADD ORGANIZATION.
                            Event *event = [[Event alloc] initWithValue:newEvent];
                            [realm beginWriteTransaction];
                            [realm addOrUpdateObject:event];
                            [realm commitWriteTransaction];
                            
                        }
                    }
                }
                
                else {
                    [realm beginWriteTransaction];
                    [realm deleteAllObjects];
                    [realm commitWriteTransaction];
                }
            }
            
            else {
                
                NSLog(@"adding the whole shabang.");
                
                for (NSDictionary *newEvent in newEvents) {
                    Event *event = [[Event alloc] initWithValue:newEvent];
                    
                    [realm beginWriteTransaction];
                    [realm addOrUpdateObject:event];
                    [realm commitWriteTransaction];
                }
            }
        }
        
        else {
            NSLog(@"error: %@", [error localizedDescription]);
            return;
        }
    }];
}

- (void)requestModelWithName:(NSString *)modelName completionHandler:(void (^)(id response, NSError *error))handler {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[NSString stringWithFormat:@"https://s3-eu-west-1.amazonaws.com/teater-billetter-medias/%@.json", modelName] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"success? : %@", responseObject);
        handler(responseObject, nil);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"error: %@", error);
        handler(nil, error);
    }];
}

- (void)requestOrganizationsWithCompletionHandler:(void (^)(id response, NSError *error))handler {
    
    NSLog(@"this was triggered, organization model.");
    [self requestModelWithName:@"organizations" completionHandler:^(id response, NSError *error) {
        handler(response, error);
    }];
}

- (void)requestEventsWithCompletionHandler:(void (^)(id response, NSError *error))handler {
    
    NSLog(@"this was triggered event model.");
    [self requestModelWithName:@"events" completionHandler:^(id response, NSError *error) {
        handler(response, error);
    }];
}

@end
