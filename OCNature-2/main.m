//
//  main.m
//  OCNature-2
//
//  Created by shenhua on 2018/8/26.
//  Copyright © 2018年 RWN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <malloc/malloc.h>
#import <objc/runtime.h>

//struct NSObject_IMP {
//    
//    Class isa;
//    
//};

//struct Person_IMP {
//
//    struct NSObject_IMP NSObject_IVARS; //8
//    int _age;//4
//
//};

/*
1.Person的属性占有 12 个字节的内存地址
2.由于内存对齐：结构体的大小必须为最大成员大小的倍数
 所有最终Person占用了16个字节的大小，而且OCruntime里也有如果小于16个字节就等于16个自己
*/

//struct Student_IMP {
//
//    struct Person_IMP imp;
//    int _no;
//
//};
/*
 1.Student的属性占有 16 个字节的内存地址
 所有最终Student占用了16个字节的大小
 */

@interface Person:NSObject{
    
@public
    int _age;
    
}
@property(nonatomic,assign)int height;
@property(nonatomic,copy)NSString *name;

@end

@implementation Person

@end


@interface Student:Person{
    
@public
    int _no;
    
}

@end

@implementation Student

@end


int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        
        /*
         double    8个字节
         long      8个字节
         string    8个字节
         指针       8个字节
         int       4个自己
         
         */
        Person * per =[[Person alloc] init];
        NSLog(@"%zu",class_getInstanceSize([Person class]));
        NSLog(@"%zu",malloc_size((__bridge const void *)(per)));
        Student *stu =[[Student alloc] init];
        NSLog(@"%zu",class_getInstanceSize([Student class]));
        NSLog(@"%zu",malloc_size((__bridge const void *)(stu)));

        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
