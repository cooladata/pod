//
//  CoolaDataAPI.h
//  CoolaDataAPI
//
//  Created by Lior Rudnik on 6/24/13.
//  Copyright (c) 2013 Lior Rudnik. All rights reserved.
//

#import <Foundation/Foundation.h>

#define COOLA_TRACKER_VERSION @"2.4"

@class ErrorObj;
@class CoolaDataDeliveryResult;
@protocol CoolaDataDelegate;

typedef void (^ResponseBlock) (CoolaDataDeliveryResult *result);

@interface CoolaDataTracker : NSObject

@property (nonatomic, strong) NSString* apiToken; //the api token if provided.
@property (nonatomic, strong) NSArray* collectingKeys; //the keys of the info that will be collected and sent with every event tracked.
@property (nonatomic, assign, readonly) BOOL isInSetupMode; //indicates whether a setup is in progress or not. in setup mode, events are not tracked until setup is completed successfully.
@property (nonatomic, strong) NSObject<CoolaDataDelegate> *customEventHandler; //The CustomEventHandler object.


/**
 Use this method to get the CoolaData tracker shared instance.
 @return CoolaDataTracker shared instance.
 */
+(CoolaDataTracker*)getInstance;

/**
 Use this method to get the CoolaData tracker shared instance.
 */
+(void)updateServiceEndPoint:(NSString *)serviceEndPoint;

/**
 Use this method to setup CoolaData Tracker.
 @param apiToken
 The api token provided by CoolaData Customer Success Team. this parameter is mandatory.
 @param userId
 Some user id. if not provided here, it must be provided when calling trackEvent method.
 @param sessionId 
 Some session id. pass nil if not needed.
 @param serviceEndPoint
 the base URL for the CoolaDataTracker to use when accessing CoolaData REST API. this parameter is optional. pass nil if you want to use the default value.
 @param completion 
 The completion block that will be called when setup completed. an error will be passed if one occured.
 @return void.
 */
-(void) setupWithApiToken:(NSString*)apiToken userId:(NSString*)userId sessionId:(NSString*)sessionId serviceEndPoint:(NSString*)serviceEndPoint completion:(void (^)(NSError *error))completion;

/**
 Use this method to setup CoolaData Tracker.
 @param appKey
 The api token provided by CoolaData Customer Success Team. this parameter is mandatory.
 @return void.
 */
-(void) setupWithAppKey:(NSString*)appKey;

/**
 Use this method to track events.
 @param eventName
 The name of the event to report. This parameter is mandatory
 @param eventId
 The Event Id relevant for this event. this parameter is optional. if response block is passed, event id must also be provided.
 @param userId
 The User Id relevant for this event. This parameter is optional only if provided in the setup method. you must provide the userId either in the setup method or in the trackEvent method. 
 @param sessionId
 The Session Id relevant for this event. This parameter is optional.
 @param customData
 The custom properties to be sent with the event. This parameter is optional.
 @param error
 A pointer to an NSError object.  it will be populated with an error in case an immediate  error occurs (mandatory parameter was not provided). This parameter is optional
 @param responseBlock
 When calling the track event method, you can pass a response block that will be called with the result / error objects upon receive. for this to happen you must also pass an event id. you can pass the same event id for multiple events. all the blocks related to that event id will be called upon receive of the related results.
 these parameters are optional. you must pass both of them to get the blocks functionality. you can pass only one of them, but that will be ignored - the block won’t be called in case event id was not provided.

 @return void.
 */
-(void) trackEvent:(NSString*)eventName withEventId:(NSString*)eventId userId:(NSString*)userId sessionId:(NSString*)sessionId optionalData:(NSDictionary*)customData error:(NSError**)error responseBlock:(ResponseBlock)responseBlock;

/**
 Use this method to track events.
 @param eventName
 The name of the event to report. This parameter is mandatory
 @param customData
 The custom properties to be sent with the event. This parameter is optional.

 @return void.
 */
-(void) trackEvent:(NSString*)eventName properties:(NSDictionary*)customData;

@end

@protocol CoolaDataDelegate

@optional
- (void) RecordEvents:(NSArray*)events;//Fired when events are tracked.
- (void) PublishEvents:(NSArray*)events;//Fired when events are being published to the server.

@end
