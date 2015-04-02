//
//  ViewController.m
//  CellUpdate
//
//  Created by ChenMengkai on 15/4/2.
//  Copyright (c) 2015年 ChenMengkai. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize UCV;


NSMutableArray *Arr;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UCV = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    
    UCV.delegate = self;
    UCV.dataSource = self;
    
    [self.view addSubview:UCV];
    
    
    [self.UCV registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
    
    UIButton *Btn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-200, [UIScreen mainScreen].bounds.size.height-30, 200, 30)];
    
    [Btn  setTitle:@"更新第三个Cell" forState:UIControlStateNormal];
    
    Btn.backgroundColor = [UIColor grayColor];
    
    
    [Btn addTarget:self action:@selector(UpdateCell) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:Btn];
    
    Arr = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark =================

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollectionViewCell *Cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    [Cell setStr:[Arr objectAtIndex:indexPath.row]];
    
    return Cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width-2, [UIScreen mainScreen].bounds.size.height/5);
}


-(void)UpdateCell
{
    NSLog(@"Cell更新=============单次执行LBL赋值");
    
    [Arr replaceObjectAtIndex:2 withObject:@"99"];//更新Arr数据
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:0]; //这里我直接设置为2了,实际应用中,还需对比获得实际需要修改的ROW和section
    
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    
    [indexPaths addObject:indexPath];
    
    [UCV reloadItemsAtIndexPaths:indexPaths]; //修改
    
}


@end
