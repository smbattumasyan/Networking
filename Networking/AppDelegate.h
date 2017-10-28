//
//  AppDelegate.h
//  Networking
//
//  Created by Smbat Tumasyan on 02.09.17.
//  Copyright © 2017 Smbat Tumasyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

