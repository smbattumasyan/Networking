//
//  BLNetwork.m
//  Networking
//
//  Created by Smbat Tumasyan on 02.09.17.
//  Copyright © 2017 Smbat Tumasyan. All rights reserved.
//

#import "BLNetwork.h"
#import <AFNetworking.h>

@interface BLNetwork ()

@property (nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation BLNetwork

+ (instancetype)shared {
    static BLNetwork *obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[BLNetwork alloc] init];
    });
    return obj;
}

- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
        self.sessionManager = manager;
    }
    return _sessionManager;
}

@end


@implementation BLNetwork (Put)

- (void)putRequestWithFunction:(NSString *)function subPaths:(NSArray *)subPaths postParams:(id)postParams success:(BLNetworkSuccess)success failure:(BLNetworkFailure)failure {
    [self.sessionManager.requestSerializer setValue:subPaths.firstObject forHTTPHeaderField:@"Authorization"];
    [self.sessionManager PUT:function parameters:postParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            success(responseObject);
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            failure(error);
        });
    }];
}

@end


@implementation BLNetwork (Post)

- (void)postRequestWithFunction:(NSString *)function subPaths:(NSArray *)subPaths postParams:(id)postParams success:(BLNetworkSuccess)success failure:(BLNetworkFailure)failure {
    [self.sessionManager.requestSerializer setValue:subPaths.firstObject forHTTPHeaderField:@"Authorization"];
    [self.sessionManager POST:function parameters:postParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            success(responseObject);
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            failure(error);
        });
    }];
}

@end



@implementation BLNetwork (Delete)

- (void)deleteRequestWithFunction:(NSString *)function subPaths:(NSArray *)subPaths postParams:(NSDictionary *)postParams success:(BLNetworkSuccess)success failure:(BLNetworkFailure)failure {
    [self.sessionManager.requestSerializer setValue:subPaths.firstObject forHTTPHeaderField:@"Authorization"];
    [self.sessionManager DELETE:function parameters:postParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            success(responseObject);
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            failure(error);
        });
    }];
}

@end

@implementation BLNetwork (Get)

- (void)getJSONRequestWithFunction:(NSString *)function subPaths:(NSArray *)subPaths postParams:(NSDictionary *)postParams success:(BLNetworkSuccess)success failure:(BLNetworkFailure)failure {
    [self.sessionManager.requestSerializer setValue:subPaths.firstObject forHTTPHeaderField:@"Authorization"];
    [self.sessionManager GET:function parameters:postParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
