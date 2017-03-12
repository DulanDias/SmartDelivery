//
//  AppDelegate.h
//  SmartDelivery
//
//  Created by Dulan Dias on 2/28/17.
//  Copyright © 2017 Dulan Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

