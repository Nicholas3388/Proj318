//
//  MyInfoViewController.m
//  Proj318
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MyInfoViewController.h"
#import "MyDetailInfoView.h"
#import "MyOtherInfoViewCell.h"
#import "ChangePortraitViewController.h"
#import "DescViewController.h"
#import "NameChangeViewController.h"
#import "QRootElement.h"
#import "QMultilineElement.h"
#import "Tools.h"

@implementation MyInfoViewController {
    // private
    UITableView *_tableView;
    
    MyDetailInfoView *_headView;
    
    UIPickerView* _picker;
    
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

#pragma mark - view layout
- (void)layout {
    self.title = NSLocalizedString(@"kMyInfo", nil);
    
    self.view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    
    //_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40 + 64, self.view.frame.size.width, self.view.frame.size.height - 120) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView = nil;
    [self.view addSubview:_tableView];
    
    _headView = [MyDetailInfoView instanceView];
    _headView.frame = CGRectMake(0, 64, self.view.frame.size.width, 120);
    _headView.portrait.layer.cornerRadius = _headView.portrait.frame.size.width/2.0;
    _headView.portrait.clipsToBounds = YES;
    [self.view addSubview:_headView];
    
    // add click event handler
    _headView.portrait.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(portraitClicked:)];
    [_headView.portrait addGestureRecognizer:tapGesture];
    
    _genders = [NSArray arrayWithObjects:NSLocalizedString(@"kMan", nil), NSLocalizedString(@"kWoman", nil), nil];
}


#pragma mark - portrait clicked
- (void)portraitClicked:(UITapGestureRecognizer *)recognizer {
    ChangePortraitViewController *viewController = [[ChangePortraitViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];
    NSLog(@"portrait click");
}

#pragma mark - create description view
- (DescViewController *)createDescView {
    QRootElement *root = [[QRootElement alloc] init];
    root.title = NSLocalizedString(@"kModifyDesc", nil);
    root.presentationMode = QPresentationModeModalForm;
    root.grouped = YES;
    root.controllerName = @"DescViewController";
    
    QSection *firstSection = [[QSection alloc]init];
    QMultilineElement *multiline = [[QMultilineElement alloc] initWithTitle:NSLocalizedString(@"kModifyDesc", nil) value:@""];
    multiline.key = @"multiline";
    [firstSection addElement:multiline];
    
    [root addSection:firstSection];
    
    return [DescViewController controllerWithNavigationForRoot:root];
}

#pragma mark - change user name
- (NameChangeViewController *)createNameChangeView {
    QRootElement *root = [[QRootElement alloc] init];
    root.title = NSLocalizedString(@"kModifyName", nil);
    root.presentationMode = QPresentationModeModalForm;
    root.grouped = YES;
    root.controllerName = @"NameChangeViewController";
    
    QSection *firstSection = [[QSection alloc]init];
    QEntryElement *entryElement = [[QEntryElement alloc] initWithTitle:NSLocalizedString(@"kMyName", nil) Value:nil Placeholder:NSLocalizedString(@"kNamePlaceholder", nil)];
    entryElement.key = @"entry1";
    [firstSection addElement:entryElement];
    entryElement.controllerAction = @"onDone:";
    
    [root addSection:firstSection];
    
    return [NameChangeViewController controllerWithNavigationForRoot:root];
}

#pragma mark - table view delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 42.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
        {
            return 4;
        }
            break;
        case 1:
        {
            return 1;
        }
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            static NSString *cellID = @"MyOtherInfoViewCell";
            MyOtherInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                [tableView registerNib:[UINib nibWithNibName:@"MyOtherInfoViewCell" bundle:nil] forCellReuseIdentifier:cellID];
                cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            }
            
            switch (indexPath.row) {
                case 0:
                {
                    cell.item.text = NSLocalizedString(@"kMyName", nil);
                    cell.content.text = NSLocalizedString(@"kUserName", nil);
                }
                    break;
                case 1:
                {
                    cell.item.text = NSLocalizedString(@"kAccount", nil);
                    cell.content.text = @"70600322";
                }
                    break;
                case 2:
                {
                    cell.item.text = NSLocalizedString(@"kGender", nil);
                    cell.content.text = @"M";
                }
                    break;
                case 3:
                {
                    cell.item.text = NSLocalizedString(@"kAddress", nil);
                    cell.content.text = @"Beijing";
                }
                    break;
                default:
                    break;
            }
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
            break;
        case 1:
        {
            static NSString *cellID = @"MyOtherInfoViewCell";
            MyOtherInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                [tableView registerNib:[UINib nibWithNibName:@"MyOtherInfoViewCell" bundle:nil] forCellReuseIdentifier:cellID];
                cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            }
            
            cell.item.text = NSLocalizedString(@"kDesc", nil);
            cell.content.text = [Tools getDesc];
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    // change user name
                    NameChangeViewController *ncvc = [self createNameChangeView];
                    [self presentModalViewController:ncvc animated:YES];
                }
                    break;
                case 1:
                {
                }
                    break;
                case 2:
                {
                    // change gender
                    _picker = [[UIPickerView alloc] init];
                    _picker.delegate = self;
                    _picker.dataSource = self;
                    [_picker reloadAllComponents];
                    
                    UIAlertController* alertVc=[UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n" message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
                    
                    UIAlertAction* ok=[UIAlertAction actionWithTitle:NSLocalizedString(@"kConfirm", nil) style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction *action) {
                    }];
                    
                    UIAlertAction* no=[UIAlertAction actionWithTitle:NSLocalizedString(@"kCancel", nil) style:(UIAlertActionStyleDefault) handler:nil];
                    
                    [alertVc.view addSubview:_picker];
                    [alertVc addAction:ok];
                    [alertVc addAction:no];
                    
                    [self presentViewController:alertVc animated:YES completion:nil];
                }
                    break;
                case 3:
                {
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        case 1:
        {
            DescViewController *dvc = [self createDescView];
            [self presentModalViewController:dvc animated:YES];
        }
            
        default:
            break;
    }
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
