//
//  PickGenderViewController.m
//  Proj318
//
//  Created by 王妍慧 on 16/5/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PickGenderViewController.h"
#import "GenderPickerView.h"

@implementation PickGenderViewController {
    GenderPickerView *_genderPickerView;
    
    NSArray *_genders;
}

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - setup layout
- (void)layout {
    _genderPickerView = [GenderPickerView instanceView];
    // stretch to fill the screen
    _genderPickerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_genderPickerView];
    _genderPickerView.genderPicker.delegate = self;
    _genderPickerView.genderPicker.dataSource = self;
    
    //self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [_genderPickerView.cancelButton addTarget:self action:@selector(onCancel) forControlEvents:UIControlEventTouchUpInside];
    
    [_genderPickerView.okButton addTarget:self action:@selector(onSave) forControlEvents:UIControlEventTouchUpInside];
    
    _genders = [NSArray arrayWithObjects:NSLocalizedString(@"kMan", nil), NSLocalizedString(@"kWoman", nil), nil];
}

- (void)onSave {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)onCancel {
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - UIPickerView delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_genders count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.view.frame.size.width;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%ld", (long)row);
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_genders objectAtIndex:row];
}

@end
