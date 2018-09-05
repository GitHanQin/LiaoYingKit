//
//  LYMedia.m
//  LYKitDemo
//
//  Created by Mac on 2017/9/27.
//  Copyright © 2017年 c++Demo. All rights reserved.
//

#import "LYMedia.h"


@interface LYMedia ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,TZImagePickerControllerDelegate>

// **如果是图片 就是图片数组  如果是视频等等 就是视频url */
@property (nonatomic,strong)LYMediiaBlock dataBlock;

@end



@implementation LYMedia



/** 单例 某些对象方法可以使用 */
+ (instancetype)sharedLYMedia
{
    static LYMedia *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[LYMedia alloc]init];
 
        
    });
    
    return instance;
    
}








#pragma mark——————————以下功能基于TZImagePickerController框架

/** 弹出选择图片来源 */
+ (void)openImageWithMaxImgNumber:(int)maxNumber WithCuVc:(UIViewController *)cuVc withAllowsEditing:(BOOL)allowsEditing allowPickingVideo:(BOOL)allowPickingVideo  withOverBlock:(LYMediiaBlock)dataBlock{
    
    
    [LYView showAlert:@"" with_Controller:[LYTools getCurrentVC] with_titleArr:@[@"相册",@"相机"] withShowType:0 with_Block:^(int index) {
        
        if(index==0)
        {
            [[LYMedia sharedLYMedia] openAlbumWithMaxImgNumber:maxNumber WithCuVc:cuVc withAllowsEditing:allowsEditing allowPickingVideo:allowPickingVideo withOverBlock:dataBlock];
            
        }
        else if (index==1)
        {
            
            [[LYMedia sharedLYMedia] openCameraWithCuVc:cuVc withAllowsEditing:allowsEditing withOverBlock:dataBlock];
        }
        
    }];
    
    
    
}



/** 相册 */
- (void)openAlbumWithMaxImgNumber:(int)maxNumber WithCuVc:(UIViewController *)cuVc withAllowsEditing:(BOOL)allowsEditing allowPickingVideo:(BOOL)allowPickingVideo  withOverBlock:(LYMediiaBlock)dataBlock{
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.dataBlock =dataBlock;
        
        TZImagePickerController *imagePickController;
        
        if(allowsEditing==NO)
        {
        
            imagePickController= [[TZImagePickerController alloc] initWithMaxImagesCount:maxNumber delegate:self];
            
        }
        else
        {
            
            imagePickController= [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
            imagePickController.delegate = self;
            imagePickController.showSelectBtn = NO;
            imagePickController.allowCrop = YES;
        }
            
     
        
        imagePickController.barItemTextColor = [UIColor blackColor];
        
        //是否 在相册中显示拍照按钮
        imagePickController.allowTakePicture = NO;
        //是否可以选择显示原图
        imagePickController.allowPickingOriginalPhoto = YES;
        //是否 在相册中可以选择视频
        imagePickController.allowPickingVideo = allowPickingVideo;
   
        
        
        [cuVc presentViewController: imagePickController animated:YES completion:nil];
        
    });
}

/** 相机 */
- (void)openCameraWithCuVc:(UIViewController *)cuVc withAllowsEditing:(BOOL)allowsEditing withOverBlock:(LYMediiaBlock)dataBlock{
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.dataBlock =dataBlock;
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            //设置拍照后的图片可被编辑
            picker.allowsEditing = allowsEditing;
            picker.sourceType = sourceType;
            [cuVc presentViewController:picker animated:YES completion:nil];
        }else{
            //        [UIAlertController showAlertWithTitle:@"该设备不支持拍照" message:nil actionTitles:@[@"确定"] cancelTitle:nil style:UIAlertControllerStyleAlert completion:nil];
            
            [LYTools showMessage:@"该设备不支持拍照"];
        }
        
    });
    
    
}

/** 录像 */
- (void)openVideotapeMaxTime:(int)maxTime WithCuVc:(UIViewController *)cuVc withOverBlock:(LYMediiaBlock)dataBlock{
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.dataBlock =dataBlock;
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            NSArray * mediaTypes =[UIImagePickerController  availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
 
   
            NSString *requiredMediaType1 = ( NSString *)kUTTypeMovie;
            NSArray *arrMediaTypes=[NSArray arrayWithObjects: requiredMediaType1,nil];
            [picker setMediaTypes:arrMediaTypes];
            
            picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
            picker.videoQuality = UIImagePickerControllerQualityTypeMedium; //录像质量
            picker.videoMaximumDuration = maxTime;        //录像最长时间
            
            [cuVc presentViewController:picker animated:YES completion:nil];
        } else {
       
             [LYTools showMessage:@"该设备不支持录像"];
        }
    });
    
    
}

/** 视频 */
- (void)openVideoWithCuVc:(UIViewController *)cuVc withOverBlock:(LYMediiaBlock)dataBlock{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.dataBlock =dataBlock;
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
//        picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        
        picker.allowsEditing = NO;
        [cuVc presentViewController:picker animated:YES completion:nil];
        
    });
}

#pragma mark - UIImagePickerController Delegate
///拍照、选视频图片、录像 后的回调（这种方式选择视频时，会自动压缩，但是很耗时间）
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        //媒体类型
        NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
        //原图URL
        NSURL *imageAssetURL = [info objectForKey:UIImagePickerControllerReferenceURL];
        
        ///视频 和 录像
        if ([mediaType isEqualToString:@"public.movie"]) {
            
            NSURL *videoAssetURL = [info objectForKey:UIImagePickerControllerMediaURL];
            
            if(self.dataBlock!=nil)
            {
                self.dataBlock(@[videoAssetURL]);
                
            }
            
            
            
        }
        
        else if ([mediaType isEqualToString:@"public.image"]) {
            
            UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];
            //如果 picker 没有设置可编辑，那么image 为 nil
            if (image == nil) {
                image = [info objectForKey:UIImagePickerControllerOriginalImage];
            }
            
            if(self.dataBlock!=nil)
            {
                self.dataBlock(@[image]);
                
            }
            
        }
        
    });
}

#pragma mark - TZImagePickerController Delegate

//处理从相册单选或多选的照片
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if(self.dataBlock!=nil)
        {
            self.dataBlock(photos);
            
        }
    });
}



/**
 *  打开二维码扫描器
 *  @param cuVc 当前控制器
 *  @param resultBlock 扫描完成的回调
 */
+ (void)OpenCodeVcWithCuVc:(UIViewController *)cuVc withResultBlock:(ScanCodeViewControllerBlock)resultBlock{

    [LYCode OpenCodeVcWithCuVc:cuVc withResultBlock:resultBlock];

}




typedef void(^LYCodeAddBlock)(UIImage *codeImage);
/**
 *  生成二维码
 *  @param str   生成二维码的字符串
 *  @param image 显示的图标(如logo)
 *  @param block 生成的回调
 */
+ (void)AddCodeImageWithString:(NSString *)str  withImage:(UIImage *)image withAddBlock:(LYCodeAddBlock)block{

    [LYCode AddCodeImageWithString:str withImage:image withAddBlock:block];

}




/**
 *  图片浏览器
 *  @param urlArr              url数组 (如果本地 就不传 直接传占位图数组)
 *  @param index               索引
 *  @param inView              一般是选中的UIImageView
 @return 图片浏览器对象
 */
+ (KSPhotoBrowser *)PhotoBrowser:(NSArray *)urlArr  withImgIndex:(NSInteger)index  withSuperView:(UIView *)inView{

  
    
    
    NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i < urlArr.count; i++) {
        // Get the large image url
        NSString *url = urlArr[i];
        KSPhotoItem *item = [KSPhotoItem itemWithSourceView:inView thumbImage:nil imageUrl:[NSURL URLWithString:url]];
        [items addObject:item];
    }
    
    
    KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:index];
    browser.backgroundStyle = KSPhotoBrowserBackgroundStyleBlurPhoto;
    browser.pageindicatorStyle = KSPhotoBrowserPageIndicatorStyleText;
    [browser showFromViewController:[LYTools getCurrentVC]];

    
    return browser;
}







/**
 录音
 
 @param fileBlock 录音完的回调
 */
+ (void)recording:(mp3FileNameBlock)fileBlock{
    PGG_BeautyViewController *vc = [[PGG_BeautyViewController alloc] init];
    
    vc.fileBlock = fileBlock;
    
    [[LYTools getCurrentVC] presentViewController:vc animated:YES completion:nil];
}




/**
 播放音频

 @param url 地址
 */
+ (void)playRecord:(NSURL *)url wittBlock:(lyPlayOverBlock)playOverBlock{
    
     PGG_AudioUtillty *audioUtil = [PGG_AudioUtillty instance];
    
    audioUtil.audioPlayFinish = ^{
        
        if(playOverBlock!=nil)
        {
            playOverBlock();
        }
        
    };
   
     [audioUtil playAudioByFileURL:url];
    
}


/**
 是否在播放音频

 @return yes 和 no
 */
+ (BOOL)isPlayRecord
{
      PGG_AudioUtillty *audioUtil = [PGG_AudioUtillty instance];
    
    
    return [audioUtil isPlaying];
}



/**
 获取本地视频时长
 
 @param path 视频路径
 @return 时长 秒
 */
+ (NSInteger )getVideoInfoWithSourcePath:(NSString *)path{
    
    
    
    
    if(path==nil)
    {
        return 0;
    }
    
    NSString *urlPath = [NSString stringWithFormat:@"%@",path];
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL URLWithString:urlPath] options:nil];
    
    //    AVURLAsset * asset = [AVURLAsset assetWithURL:videoUrl];
    CMTime   time = [asset duration];
    NSInteger seconds = ceil(time.value/time.timescale);
    
    //大小
    //NSInteger   fileSize = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil].fileSize;
    
    return seconds;
}

/**
 获取视频第一帧图片
 @param path 视频路径
 
 @return 图片
 */
+ (UIImage*)getVideoPreViewImage:(NSString *)videoPath
{
    if(videoPath==nil)
    {
        return [[UIImage alloc] init];
    }
    
    NSString *urlPath = [NSString stringWithFormat:@"%@",videoPath];
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL URLWithString:urlPath] options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *img = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return img;
}





/**
 播放视频(注意销毁视频播放器和引用)

 @param title 要展示的文字
 @param url 视频url 可以是本地和网络
 @param superView 父view
 @return 视频播放器对象
 */
+ (WMPlayer *)playerVideo_withTitle:(NSString *)title withUrl:(NSURL *)url withSuperView:(UIView *)superView
{
    WMPlayerModel *playerModel = [WMPlayerModel new];
    playerModel.title = title;
    playerModel.videoURL = url;
    WMPlayer * wmPlayer = [[WMPlayer alloc]initPlayerModel:playerModel];
    [superView addSubview:wmPlayer];
    [wmPlayer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(0);
    }];
    [wmPlayer play];
    
    return wmPlayer;
}


@end
