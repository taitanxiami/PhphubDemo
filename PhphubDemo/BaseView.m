//
//  BaseView.m
//  PhphubDemo
//
//  Created by taitanxiami on 15/12/22.
//  Copyright © 2015年 taitanxiami. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame {
    
   self =  [super initWithFrame:frame];
    
    if ( self ) {
        
        self.layer.cornerRadius  = 0.5;
        self.layer.masksToBounds = YES;
        self.backgroundColor     = [UIColor whiteColor];
        self.layer.borderWidth   = 2.0f;
        self.layer.borderColor   = [UIColor colorWithRed:0.871 green:0.875 blue:0.878 alpha:1.000].CGColor;
    }
    
    return self;    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
