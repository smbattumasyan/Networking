//
//  ViewController.m
//  Networking
//
//  Created by Smbat Tumasyan on 02.09.17.
//  Copyright © 2017 Smbat Tumasyan. All rights reserved.
//

#import "ViewController.h"
#import "BLNetwork.h"

@interface ViewController ()

@property(strong, nonatomic) BLNetwork *networking;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.networking = [BLNetwork shared];
    
    [self.networking getJSONRequestWithFunction:URL_PATH subPaths:nil postParams:nil success:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSError *error) {
        NSLog(@"error:%@",error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
