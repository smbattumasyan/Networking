//
//  BLNetwork.h
//  Networking
//
//  Created by Smbat Tumasyan on 02.09.17.
//  Copyright © 2017 Smbat Tumasyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLNetworkFunction.h"

typedef  void (^BLNetworkSuccess)(id responseObject);
typedef void (^BLNetworkFailure)(NSError *error);

@interface BLNetwork : NSObject

+ (instancetype)shared;

@end

@interface BLNetwork (Put)

- (void)putRequestWithFunction:(NSString *)function subPaths:(NSArray *)subPaths postParams:(id)postParams success:(BLNetworkSuccess)success failure:(BLNetworkFailure)failure;

@end


@interface BLNetwork (Post)

- (void)postRequestWithFunction:(NSString *)function subPaths:(NSArray *)subPaths postParams:(id)postParams success:(BLNetworkSuccess)success failure:(BLNetworkFailure)failure;

@end


@interface BLNetwork (Get)

- (void)getJSONRequestWithFunction:(NSString *)function subPaths:(NSArray *)subPaths postParams:(NSDictionary *)postParams success:(BLNetworkSuccess)success failure:(BLNetworkFailure)failure;

@end


@interface BLNetwork (Delete)

- (void)deleteRequestWithFunction:(NSString *)function subPaths:(NSArray *)subPaths postParams:(NSDictionary *)postParams success:(BLNetworkSuccess)success failure:(BLNetworkFailure)failure;

@end
