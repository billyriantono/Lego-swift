//
//  LEMVVMModuleFactory.m
//  XFLegoVIPER
//
//  Created by Yizzuide on 2017/1/30.
//  Copyright © 2017年 yizzuide. All rights reserved.
//

#import "LEMVVMModuleFactory.h"
#import "XFComponentManager.h"
#import "XFLegoMarco.h"
#import <objc/runtime.h>
#import "XFModuleReflect.h"

@implementation LEMVVMModuleFactory

+ (LEViewModel *)createViewModelFromModuleName:(NSString *)moduleName superModule:(NSString **)superModule {
    id<XFComponentRoutable> component = [XFComponentManager findComponentForName:moduleName];
    if (component) return (id)component;
    Class clazz = [XFModuleReflect createDynamicSubModuleClassFromName:moduleName stuffixName:@"ViewModel" superModule:superModule];
    return [[clazz alloc] init];
}
@end
