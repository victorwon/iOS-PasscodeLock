//
//  PasscodeCircularButton.m
//  WPiOSPasscodeLock
//
//  Created by Basar Akyelli on 2/15/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import "PasscodeCircularButton.h"

@interface PasscodeCircularButton ()

@property (nonatomic, strong) CAShapeLayer *circle;

@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *selectedLineColor;
@property (nonatomic, strong) UIColor *selectedFillColor;
@property (nonatomic, strong) UIColor *selectedTitleColor;
@end

@implementation PasscodeCircularButton


- (id) initWithNumber:(NSString *)number
                frame:(CGRect)frame
            lineColor:(UIColor *) lineColor
           titleColor:(UIColor *) titleColor
            fillColor:(UIColor *) fillColor
    selectedLineColor:(UIColor *) selectedLineColor
   selectedTitleColor:(UIColor *) selectedTitleColor
    selectedFillColor:(UIColor *) selectedFillColor
{
    self = [super init];
    
    if(self)
    {
        self = [PasscodeCircularButton buttonWithType:UIButtonTypeCustom];
        self.tag = [number integerValue];
        self.lineColor = lineColor;
        self.titleColor = titleColor;
        self.fillColor = fillColor;
        self.selectedLineColor = selectedLineColor;
        self.selectedTitleColor = selectedTitleColor;
        self.selectedFillColor = selectedFillColor;
        self.frame = frame;
        [self setTitle:number forState:UIControlStateNormal];
        [self drawCircular];
    }
    return self;
}

- (void)drawCircular
{
    [self setTitleColor:self.lineColor forState:UIControlStateNormal];
    self.circle = [CAShapeLayer layer];
    [self.circle setBounds:CGRectMake(0.0f, 0.0f, [self bounds].size.width, [self bounds].size.height)];
    [self.circle setPosition:CGPointMake(CGRectGetMidX([self bounds]),CGRectGetMidY([self bounds]))];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    [self.circle setPath:[path CGPath]];
    
    [self.circle setStrokeColor:[self.lineColor CGColor]];
    
    [self.circle setLineWidth:0.3f];
    [self.circle setFillColor:self.fillColor.CGColor];
    
    [[self layer] addSublayer:self.circle];
    self.titleLabel.font = [UIFont systemFontOfSize:30];
}

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted)
    {
        [self.circle setStrokeColor:self.selectedLineColor.CGColor];
        [self.circle setFillColor:self.selectedFillColor.CGColor];
        self.titleLabel.textColor = self.selectedTitleColor;
    }
    else
    {
        self.titleLabel.textColor = self.titleColor;
        [self.circle setFillColor:self.fillColor.CGColor];
        [self.circle setStrokeColor:self.lineColor.CGColor];
    }
}

@end