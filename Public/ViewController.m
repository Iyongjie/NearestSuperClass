//
//  ViewController.m
//  PublickView
//
//  Created by 李永杰 on 2019/8/20.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
#import "AModel.h"
#import "BModel.h"
@interface ViewController ()

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    
    UIView *view1         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    self.view1 = view1;
    [self.view addSubview:view1];

    UIView *view2         = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    view2.backgroundColor = [UIColor blueColor];
    self.view2 = view2;
    [self.view addSubview:view2];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"时间复杂度O(n)" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(150, 100, 150, 30)];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clickAction {
    // 视图
//    Class class = [self findParentClassWith:[self.view1 class] andClass:[self.view2 class]];
    // 其他类
//    TestModel *model = [[TestModel alloc]init];
//    Class class = [self findParentClassWith:[model class] andClass:[self class]];
    // 共同父类
    AModel *a = [[AModel alloc]init];
    BModel *b = [[BModel alloc]init];
    Class class = [self findParentClassWith:[a class] andClass:[b class]];
    NSLog(@"%@", class);
}

- (Class)findParentClassWith:(Class)first andClass:(Class)second {
    NSArray *arr1 = [self superClasses:first];
    NSArray *arr2 = [self superClasses:second];
    NSSet *set    = [NSSet setWithArray:arr2];
    for (NSUInteger i = 0; i < arr1.count; ++i) {
        Class targetClass = arr1[i];
        if ([set containsObject:targetClass]) {
            return targetClass;
        }
    }
    return nil;
}

// 向上查找所有父类
- (NSArray *)superClasses:(Class) class {
    if (class == nil) {
        return @[];
    }
    NSMutableArray *result = [NSMutableArray array];
    while (class != nil) {
        [result addObject:class];
        class = [class superclass];
    }
    return [result copy];
}
@end
