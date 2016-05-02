//
//  ChangePortraitViewController.m
//  biaoai_V3.0
//
//  Created by apple on 16/1/8.
//  Copyright © 2016年 kevingao. All rights reserved.
//

#import "ChangePortraitViewController.h"
#import "SDWebImageManager.h"
#import "SimpleEditMultipleComponent.h"
#import "SimpleCameraComponent.h"
#import "AppConfig.h"
#import "UIImageView+WebCache.h"
#import <TuSDKGeeV1/TuSDKGeeV1.h>

@interface ChangePortraitViewController ()<TuSDKFilterManagerDelegate, SimpleEditMultipleComponentDelegate>

@property(nonatomic, strong) UIImageView *portrait;

@end

@implementation ChangePortraitViewController
{
    SimpleEditMultipleComponent *_simpleEditMultipleComponent;
    
    SimpleCameraComponent *_simpleCameraComponent;
    
    BOOL _isUploading;
}

#pragma mark - load view
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];
    
    [self layOut];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - setup
- (void)setUpNav {
    self.title = @"修改头像";
    
    
    [[TuSDKTKLocation shared] requireAuthorWithController:self];
    NSLog(@"Filter manager init");
    [TuSDK checkManagerWithDelegate:self];
    
}

- (void)layOut {
    _portrait = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenWidth)];
    _portrait.backgroundColor = [UIColor blackColor];
    [_portrait sd_setImageWithURL:[NSURL URLWithString:@"http://pic.biaoai.com/"] placeholderImage:[UIImage imageNamed:@"orn_man02"]];
    _portrait.clipsToBounds = YES;
    _portrait.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_portrait];
    
    //按钮
    /*UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.frame = CGRectMake(0, 0, ScreenWidth-40, 32);
    cancelButton.center = CGPointMake(ScreenWidth*0.5, ScreenHeight-24);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    cancelButton.titleLabel.textColor = [UIColor blackColor];
    cancelButton.backgroundColor = [UIColor whiteColor];
    [cancelButton addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];*/
    
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    changeButton.frame = CGRectMake(0, 0, ScreenWidth-40, 36);
    changeButton.center = CGPointMake(ScreenWidth*0.5, ScreenHeight-26);
    [changeButton setTitle:@"更改头像" forState:UIControlStateNormal];
    changeButton.backgroundColor = [UIColor whiteColor];
    changeButton.titleLabel.textColor = [UIColor blackColor];
    [changeButton addTarget:self action:@selector(changeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    
    UIButton *cameraButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cameraButton.frame = CGRectMake(0, 0, changeButton.frame.size.width, changeButton.frame.size.height);
    cameraButton.center = CGPointMake(ScreenWidth*0.5, changeButton.center.y-42);
    [cameraButton setTitle:@"拍照" forState:UIControlStateNormal];
    cameraButton.backgroundColor = [UIColor whiteColor];
    cameraButton.titleLabel.textColor = [UIColor blackColor];
    [cameraButton addTarget:self action:@selector(cameraButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cameraButton];
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.frame = CGRectMake(0, 0, changeButton.frame.size.width, changeButton.frame.size.height);
    saveButton.center = CGPointMake(ScreenWidth*0.5, cameraButton.center.y-42);
    [saveButton setTitle:@"保存图片" forState:UIControlStateNormal];
    saveButton.backgroundColor = [UIColor whiteColor];
    saveButton.titleLabel.textColor = [UIColor blackColor];
    [saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    
    _isUploading = NO;
}

#pragma mark - button click handler
- (void)cancelButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changeButtonClicked {
    //UIImage *cacheImage;
    /*__weak typeof(self) weakSelf = self;
    
    self.photoPickerController = [[CZPhotoPickerController alloc]initWithPresentingViewController:weakSelf withCompletionBlock:^(UIImagePickerController *imagePickerController, NSDictionary *imageInfoDict){
        UIImage *image = imageInfoDict[UIImagePickerControllerEditedImage];
        if (!image) {
            image = imageInfoDict[UIImagePickerControllerOriginalImage];
            // not set image here
            if (weakSelf.presentedViewController) {
                [weakSelf dismissViewControllerAnimated:YES completion:nil];
            }
        }
        else {
            NSLog(@"use new image");
            if (weakSelf.presentedViewController) {
                [weakSelf dismissViewControllerAnimated:YES completion:^{
                    PhotoTweaksViewController *ptvc = [[PhotoTweaksViewController alloc]initWithImage:image];
                    ptvc.delegate = weakSelf;
                    [weakSelf.navigationController pushViewController:ptvc animated:YES];
                }];
            }
        }
    }];
    
    self.photoPickerController.saveToCameraRoll = NO;
    //self.photoPickerController.allowsEditing = NO;
    //self.photoPickerController.cropOverlaySize = CGSizeMake(ScreenWidth, ScreenWidth);
    
    [self.photoPickerController showFromRect:CGRectMake(ScreenWidth*0.5, ScreenHeight-82, ScreenWidth-40, 32)];*/
    
    if (_simpleEditMultipleComponent == nil)
    {
        _simpleEditMultipleComponent = [SimpleEditMultipleComponent simple];
        _simpleEditMultipleComponent.delegate = self;
    }
    
    [_simpleEditMultipleComponent showSimpleWithController:self];
}

- (void)cameraButtonClicked {
    if (_simpleCameraComponent == nil)
    {
        _simpleCameraComponent = [SimpleCameraComponent simple];
        _simpleCameraComponent.delegate = self;
    }
    [_simpleCameraComponent showSimpleWithController:self];
}

- (void)saveButtonClicked {
    //[Tools showAlertViewWithView:self.view AndWithMessage:@"图片已保存"];
    
    if (!_isUploading) {
        _isUploading = YES;
        //[self uploadPortrait];
    }
}


#pragma mark - TuSDK delegate
- (void)onTuSDKFilterManagerInited:(TuSDKFilterManager *)manager; {
    NSLog(@"Filter Manager init complete");
}

- (void)sendResult:(UIImage *)image {
    NSLog(@"Received result");
    _portrait.image = image;
    if (image != nil) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    
    NSString *path_sandox = NSHomeDirectory();
    NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/portrait.png"];
    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
}

#pragma mark - upload portrait
#if 0
- (void)uploadPortrait {
    //上传照片
    NSString *path_sandox = NSHomeDirectory();
    NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/portrait.png"];
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:imagePath];
    
    if (image) {
        
        //41.上传图片至相册
        //接口：
        //http://ework.biaoai.com/apiV3.php/Common/PhotoUpload?uid=69915435&uuid=9ac87f1a88b8b3f2ee2ddd6d5df4475b
        //接口说明
        //此项需要post传数据，其他不成功。
        //必传参数：uuid，uid验证用，
        //其他：上传文件的标识统一为’myphoto’,如果是其他不能上传，例如，[‘myphoto’][‘’]，前面是判断上传文件的标识，后面[‘’]是文件名、文件大小等信息，这个不需要app端处理，其[‘myphoto’]相当于<input name=’myphoto’ />，如果还是不太清楚，可以询问。
        //注意：只允许gif、png、jpeg三种文件上传，且文件大小满足 10Kb <size < 1Mb,否则失败。
        //#define PhotoUpload_API @"/Common/PhotoUpload"
        
        //hud
        __weak MBProgressHUD* _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        _hud.removeFromSuperViewOnHide = YES;
        
        __weak typeof(self) weakSelf = self;
        
        //创建参数
        NSString* uid = _userModel.uid;
        NSString* uuid = _userModel.uuid;
        NSString *isPortrait = @"false";
        
        /*NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:
                                uid,@"uid",
                                uuid,@"uuid",
                                isPortrait,@"mainimg",
                                nil];*/
        NSDictionary *params = [[NSDictionary alloc]init];
        
        //URL
        NSString* Url = [NSString stringWithFormat:@"%@%@?uid=%@&uuid=%@&mainimg=true",Main_API,PhotoUpload_API,uid,uuid];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [manager POST:Url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            
            //添加图片数据
            NSData *imageData = UIImagePNGRepresentation(image);
            NSMutableData *data = [NSMutableData dataWithData:imageData];
            [formData appendPartWithFileData:data name:@"mainimg" fileName:@"myphoto.png" mimeType:@"image/png"];
            
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            //hidden
            [_hud hide:YES];
            
            //解析数据
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            //效验码
            NSString* resultType = [NSString stringWithFormat:@"%@",[resultDict objectForKey:@"resultType"]];
            
            if ([resultType isEqualToString:@"000000"]) {
                
                //上传成功
                [Tools showAlertViewWithView:weakSelf.view AndWithMessage:@"头像上传成功，正在等待审核"];
                NSLog(@"=== upload successed");
                [self requestMyInfo];
            }else{
                
                //msg
                NSString* resultMsg = [resultDict objectForKey:@"result"];
                [Tools showAlertViewWithView:weakSelf.view AndWithMessage:resultMsg];
                NSLog(@"=== upload failed");
            }
            _isUploading = NO;
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            //hidden
            [_hud hide:YES];
            
            [Tools showAlertViewWithView:weakSelf.view AndWithMessage:@"网络超时"];
            _isUploading = NO;
            NSLog(@"=== upload failed");
        }];
        
    }
    else {
        [Tools showAlertViewWithView:self.view AndWithMessage:@"头像上传失败"];
    }
}

- (void)requestMyInfo{
    
    //获取本地存储的账号和密码
    NSString* temp_phone = [Tools getUser_Phone];
    NSString* temp_password = [Tools getUser_Password];
    
    //URL
    NSString* Url = [NSString stringWithFormat:@"%@%@",Main_API,Login_API];
    
    //创建参数
    //登录来源：web浏览器:1 wap手机版:3 iOS:5 Android:7
    NSString* fromsys = @"5";
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:
                            temp_phone,@"username",
                            temp_password,@"password",
                            fromsys,@"fromsys",
                            nil];
    
    //weakSelf
    __weak typeof(self) weakSelf = self;
    
    //创建请求
    HttpManager* _manager = [HttpManager defaultManager];
    
    //POST请求
    [_manager postRequestToUrl:Url params:params complete:^(BOOL successed,NSDictionary* resultDict){
        
        if (successed) {
            
            NSString* resultType = [NSString stringWithFormat:@"%@",[resultDict objectForKey:@"resultType"]];
            
            if ([resultType isEqualToString:@"000000"]) {
                
                NSDictionary* result = [resultDict objectForKey:@"result"];
                
                //--------存储账号信息和账号密码-----------//
                UserModel* tempModel = [[UserModel alloc] initWithDict:result];
                _userModel.mainimg = tempModel.mainimg;
                [Tools saveUserAccountData:_userModel];
                
            }else{
                NSLog(@"=== request failed");
            }
            
        }else{
            NSLog(@"=== request my info failed");
        }
        
    }];
}

- (void)upload
{
    NSString *urlStr = @"http://localhost/upload.php";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr] cachePolicy:0 timeoutInterval:5.0f];
    
    //[self setRequest:request];
    
    NSLog(@"开始上传...");
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSLog(@"Result--%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
    }];
}
#endif

@end
