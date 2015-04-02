//
//  CollectionViewCell.m
//  CellUpdate
//
//  Created by ChenMengkai on 15/4/2.
//  Copyright (c) 2015年 ChenMengkai. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
@synthesize Str = _Str;

-(id)initWithFrame:(CGRect)frame
{
    
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        _Lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
        
        
        
        [self addSubview:_Lbl];
        
    }
    
    
    return self;
    
    
}



-(void)setStr:(NSString *)Str
{
    
    _Lbl.text = Str;
    
    NSLog(@"LBL赋值");
}

@end
