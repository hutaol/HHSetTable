//
//  HHPhotoTool.m
//  Pods
//
//  Created by Henry on 2020/11/16.
//

#import "HHPhotoTool.h"
#import <HXPhotoPicker/HXPhotoPicker.h>
#import "HHToastTool.h"
#import "HHDefine.h"
#import "HHUIImagePicker.h"

@implementation HHPhotoTool

+ (NSInteger)getLanaguage {
    HHLanguageType type = [[[NSUserDefaults standardUserDefaults] valueForKey:HHLanguageTypeKey] integerValue];
    return type;
}

+ (void)getPhoto:(HXPhotoModel *)model success:(void(^)(HHPhotoModel *photo))success failed:(HXModelFailedBlock)failed {
    
    if (model.subType == HXPhotoModelMediaSubTypePhoto) {
        if (model.type == HXPhotoModelMediaTypePhotoGif) {
            // gif
            [[PHImageManager defaultManager] requestImageDataForAsset:model.asset options:nil resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
                
                HHPhotoModel *pModel = [HHPhotoModel modelWithImage:nil video:nil data:imageData type:HHPhotoModelMediaTypePhotoGif];
                if (success) {
                    success(pModel);
                }
                
             }];
        } else {
            // image
            [model getImageWithSuccess:^(UIImage * _Nullable image, HXPhotoModel * _Nullable model, NSDictionary * _Nullable info) {
                
                HHPhotoModel *pModel = [HHPhotoModel modelWithImage:image video:nil data:nil type:HHPhotoModelMediaTypePhoto];

                if (success) {
                    success(pModel);
                }

            } failed:^(NSDictionary * _Nullable info, HXPhotoModel * _Nullable model) {
                NSLog(@"failed: %@", info);
                if (failed) {
                    failed(info, model);
                }
            }];
            
        }
        
    } else {
        [model getVideoURLWithSuccess:^(NSURL * _Nullable URL, HXPhotoModelMediaSubType mediaType, BOOL isNetwork, HXPhotoModel * _Nullable model) {
            
            HHPhotoModel *pModel = [HHPhotoModel modelWithImage:nil video:URL data:nil type:HHPhotoModelMediaTypeVideo];

            if (success) {
                success(pModel);
            }

        } failed:^(NSDictionary * _Nullable info, HXPhotoModel * _Nullable model) {
            NSLog(@"failed: %@", info);
            if (failed) {
                failed(info, model);
            }
        }];
    }
    
}

+ (void)sheetPortraitWithController:(UIViewController *)vc title:(NSString *)title completion:(HHPhotoToolCompletion)completion {
    
    HXPhotoBottomViewModel *model1 = [[HXPhotoBottomViewModel alloc] init];
    model1.title = title;
    model1.titleColor = [UIColor hx_colorWithHexStr:@"#999999"];
    model1.cellHeight = 40.f;
    model1.titleFont = [UIFont systemFontOfSize:13];
    model1.canSelect = NO;
    
    HXPhotoBottomViewModel *model2 = [[HXPhotoBottomViewModel alloc] init];
    model2.title = GetLocalLanguageTextValue(@"TakePicture");
    
    HXPhotoBottomViewModel *model3 = [[HXPhotoBottomViewModel alloc] init];
    model3.title = GetLocalLanguageTextValue(@"SelectFromPhoneAlbum");
    
    HXPhotoManager *photoManager = [HXPhotoManager managerWithType:HXPhotoManagerSelectedTypePhoto];
    
    photoManager.configuration.type = HXConfigurationTypeWXChat;
    photoManager.configuration.languageType = [self getLanaguage];
    
    photoManager.configuration.singleJumpEdit = YES;
    photoManager.configuration.singleSelected = YES;
    photoManager.configuration.lookGifPhoto = NO;
    photoManager.configuration.lookLivePhoto = NO;
    photoManager.configuration.openCamera = NO;
    photoManager.configuration.photoEditConfigur.aspectRatio = HXPhotoEditAspectRatioType_1x1;
    photoManager.configuration.photoEditConfigur.onlyCliping = YES;
    
    [HXPhotoBottomSelectView showSelectViewWithModels:@[model1, model2, model3] selectCompletion:^(NSInteger index, HXPhotoBottomViewModel * _Nonnull model) {
        
        if (index == 1) {
            // ??????
            [vc hx_presentCustomCameraViewControllerWithManager:photoManager done:^(HXPhotoModel *model, HXCustomCameraViewController *viewController) {
                
                [self getPhoto:model success:completion failed:nil];

            } cancel:nil];
        } else if (index == 2) {
            // ??????
            [vc hx_presentSelectPhotoControllerWithManager:photoManager didDone:^(NSArray<HXPhotoModel *> * _Nullable allList, NSArray<HXPhotoModel *> * _Nullable photoList, NSArray<HXPhotoModel *> * _Nullable videoList, BOOL isOriginal, UIViewController * _Nullable viewController, HXPhotoManager * _Nullable manager) {
                
                [self getPhoto:allList.firstObject success:completion failed:nil];

            } cancel:nil];
        }
    } cancelClick:nil];
    
}

+ (void)sheetImagePickerWithController:(UIViewController *)vc title:(NSString *)title count:(NSInteger)count edit:(BOOL)edit completion:(HHPhotoToolMultipleCompletion)completion {
    
    HXPhotoBottomViewModel *model1 = [[HXPhotoBottomViewModel alloc] init];
    model1.title = title;
    model1.titleColor = [UIColor hx_colorWithHexStr:@"#999999"];
    model1.cellHeight = 40.f;
    model1.titleFont = [UIFont systemFontOfSize:13];
    model1.canSelect = NO;
    
    HXPhotoBottomViewModel *model2 = [[HXPhotoBottomViewModel alloc] init];
    model2.title = GetLocalLanguageTextValue(@"TakePicture");
    
    HXPhotoBottomViewModel *model3 = [[HXPhotoBottomViewModel alloc] init];
    model3.title = GetLocalLanguageTextValue(@"SelectFromPhoneAlbum");
    
    HXPhotoManager *photoManager = [HXPhotoManager managerWithType:HXPhotoManagerSelectedTypePhoto];
    
    photoManager.configuration.type = HXConfigurationTypeWXChat;
    photoManager.configuration.languageType = [self getLanaguage];
    
    photoManager.configuration.lookGifPhoto = NO;
    photoManager.configuration.lookLivePhoto = NO;
    photoManager.configuration.openCamera = NO;
    
    photoManager.configuration.maxNum = count;
    photoManager.configuration.singleSelected = count == 1;
    
    photoManager.configuration.photoCanEdit = edit;

    [HXPhotoBottomSelectView showSelectViewWithModels:@[model1, model2, model3] selectCompletion:^(NSInteger index, HXPhotoBottomViewModel * _Nonnull model) {
        
        if (index == 1) {
            // ??????
            [vc hx_presentCustomCameraViewControllerWithManager:photoManager done:^(HXPhotoModel *model, HXCustomCameraViewController *viewController) {
                
                HHPhotoModel *pModel = [HHPhotoModel modelWithImage:model.previewPhoto video:nil data:nil type:HHPhotoModelMediaTypePhoto];

                if (completion) {
                    completion(@[pModel]);
                }
                
                [self getPhoto:model success:^(HHPhotoModel *photo) {
                    if (completion) {
                        completion(@[photo]);
                    }
                } failed:nil];

            } cancel:nil];
        } else if (index == 2) {
            // ??????
            [vc hx_presentSelectPhotoControllerWithManager:photoManager didDone:^(NSArray<HXPhotoModel *> * _Nullable allList, NSArray<HXPhotoModel *> * _Nullable photoList, NSArray<HXPhotoModel *> * _Nullable videoList, BOOL isOriginal, UIViewController * _Nullable viewController, HXPhotoManager * _Nullable manager) {
                
                NSMutableArray *mArr = [NSMutableArray array];
                for (int i = 0; i < allList.count; i++) {
                    [self getPhoto:allList[i] success:^(HHPhotoModel *photo) {
                        
                        [mArr addObject:photo];
                        
                        if (mArr.count == allList.count) {
                            if (completion) {
                                completion(mArr);
                            }
                        }
                        
                    } failed:^(NSDictionary * _Nullable info, HXPhotoModel * _Nullable model) {
                        // TODO
                    }];
                }
                
            } cancel:nil];
        }
    } cancelClick:nil];
    
}

+ (void)imagePickerSingleWithController:(UIViewController *)vc seletedVideo:(BOOL)seletedVideo edit:(BOOL)edit completion:(HHPhotoToolCompletion)completion {
    
    HXPhotoManager *photoManager = [HXPhotoManager managerWithType:seletedVideo?HXPhotoManagerSelectedTypePhotoAndVideo:HXPhotoManagerSelectedTypePhoto];
    photoManager.configuration.maxNum = 1;
    photoManager.configuration.singleSelected = YES;
    photoManager.configuration.openCamera = NO;
    photoManager.configuration.videoAutoPlayType = YES;
    photoManager.configuration.photoCanEdit = edit;
    photoManager.configuration.videoCanEdit = edit;
    
    photoManager.configuration.type = HXConfigurationTypeWXChat;
    photoManager.configuration.languageType = [self getLanaguage];

    [vc hx_presentSelectPhotoControllerWithManager:photoManager didDone:^(NSArray<HXPhotoModel *> * _Nullable allList, NSArray<HXPhotoModel *> * _Nullable photoList, NSArray<HXPhotoModel *> * _Nullable videoList, BOOL isOriginal, UIViewController * _Nullable viewController, HXPhotoManager * _Nullable manager) {
        
        NSSLog(@"block - all - %@", allList);

        HXPhotoModel *model = allList.firstObject;

        [self getPhoto:model success:completion failed:nil];
                
    } cancel:^(UIViewController * _Nullable viewController, HXPhotoManager * _Nullable manager) {
        
    }];
    
}

+ (void)imagePickerMultipleWithController:(UIViewController *)vc count:(NSInteger)count seletedVideo:(BOOL)seletedVideo completion:(HHPhotoToolMultipleCompletion)completion {
    
    HXPhotoManager *photoManager = [HXPhotoManager managerWithType:seletedVideo?HXPhotoManagerSelectedTypePhotoAndVideo:HXPhotoManagerSelectedTypePhoto];
    
    photoManager.configuration.type = HXConfigurationTypeWXChat;
    photoManager.configuration.languageType = [self getLanaguage];

    photoManager.configuration.videoAutoPlayType = YES;
    photoManager.configuration.maxNum = count;
    photoManager.configuration.openCamera = NO;
    photoManager.configuration.singleSelected = count == 1;

    [vc hx_presentSelectPhotoControllerWithManager:photoManager didDone:^(NSArray<HXPhotoModel *> *allList, NSArray<HXPhotoModel *> *photoList, NSArray<HXPhotoModel *> *videoList, BOOL isOriginal, UIViewController *viewController, HXPhotoManager *manager) {
        
        NSSLog(@"block - all - %@", allList);

        NSMutableArray *mArr = [NSMutableArray array];
        for (int i = 0; i < allList.count; i++) {
            [self getPhoto:allList[i] success:^(HHPhotoModel *photo) {
                
                [mArr addObject:photo];
                
                if (mArr.count == allList.count) {
                    if (completion) {
                        completion(mArr);
                    }
                }
                
            } failed:^(NSDictionary * _Nullable info, HXPhotoModel * _Nullable model) {
                // TODO
                
            }];
        }
        
    } cancel:^(UIViewController *viewController, HXPhotoManager *manager) {
        NSSLog(@"block - ?????????");
    }];
}


/// ??????
+ (void)cameraWithController:(UIViewController *)vc video:(BOOL)video system:(BOOL)system completion:(HHPhotoToolCompletion)completion {
    [self cameraWithController:vc video:video edit:YES system:system completion:completion];
}


+ (void)cameraWithController:(UIViewController *)vc video:(BOOL)video edit:(BOOL)edit system:(BOOL)system completion:(HHPhotoToolCompletion)completion {
    
    if (system) {
        
        [[HHUIImagePicker shareInstance] presentPicker:(video?PickerType_Take:PickerType_Camera) target:vc callBackBlock:^(NSDictionary * _Nullable infoDict, BOOL isCancel) {
            
            if (isCancel) {
                return;
            }
            
            if (video) {
                NSURL *url = [infoDict objectForKey:UIImagePickerControllerMediaURL]; // ????????????
                if (completion && url) {
                    HHPhotoModel *pModel = [HHPhotoModel modelWithImage:nil video:url data:nil type:HHPhotoModelMediaTypeVideo];
                    completion(pModel);
                }
            } else {
                UIImage *image = [infoDict valueForKey:UIImagePickerControllerOriginalImage];
                if (completion && image) {
                    HHPhotoModel *pModel = [HHPhotoModel modelWithImage:image video:nil data:nil type:HHPhotoModelMediaTypePhoto];
                    completion(pModel);
                }
            }
            
        }];
        
        return;
    }
    
    HXPhotoManager *photoManager = [HXPhotoManager managerWithType:video?HXPhotoManagerSelectedTypePhotoAndVideo:HXPhotoManagerSelectedTypePhoto];
    
    photoManager.configuration.type = HXConfigurationTypeWXChat;
    photoManager.configuration.languageType = [self getLanaguage];
    
    photoManager.configuration.photoCanEdit = edit;
    photoManager.configuration.videoCanEdit = edit;

    [vc hx_presentCustomCameraViewControllerWithManager:photoManager done:^(HXPhotoModel *model, HXCustomCameraViewController *viewController) {
        
        [self getPhoto:model success:completion failed:nil];

    } cancel:nil];
}


/// ????????????|??????
+ (void)showImageWithController:(UIViewController *)vc source:(NSArray *)source previews:(NSArray *)previews index:(NSInteger)index {
    
    NSMutableArray *arrImages = [NSMutableArray array];

    for (int i = 0; i < source.count; i ++) {
        id obj = source[i];
        if ([obj isKindOfClass:[NSURL class]]) {
            // ????????????
            HXCustomAssetModel *model = [HXCustomAssetModel assetWithNetworkImageURL:obj selected:YES];
            [arrImages  addObject:model];
            
        } else if ([obj isKindOfClass:[NSString class]]) {
            // ??????
            HXCustomAssetModel *model = [HXCustomAssetModel assetWithImagePath:[NSURL fileURLWithPath:obj] selected:YES];
            [arrImages addObject:model];
            
        } else if ([obj isKindOfClass:[UIImage class]]) {
            HXCustomAssetModel *model = [HXCustomAssetModel assetWithLocalImage:obj selected:YES];
            [arrImages addObject:model];
        }
    }
    
    if (arrImages.count == 0) {
        return;
    }
    
    HXPhotoManager *photoManager = [HXPhotoManager managerWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
    photoManager.configuration.saveSystemAblum = YES;
    photoManager.configuration.photoMaxNum = 0;
    photoManager.configuration.videoMaxNum = 0;
    photoManager.configuration.maxNum = 10;
    photoManager.configuration.selectTogether = YES;
    photoManager.configuration.photoCanEdit = NO;
    photoManager.configuration.videoCanEdit = NO;
    photoManager.configuration.videoAutoPlayType = YES;

    photoManager.configuration.languageType = [self getLanaguage];
    
    // ????????????
    photoManager.configuration.previewRespondsToLongPress = ^(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController) {
        HXPhotoBottomViewModel *model = [[HXPhotoBottomViewModel alloc] init];
        model.title = GetLocalLanguageTextValue(@"Save");
        [HXPhotoBottomSelectView showSelectViewWithModels:@[model] headerView:nil cancelTitle:nil selectCompletion:^(NSInteger index, HXPhotoBottomViewModel * _Nonnull model) {
            if (index == 0) {
                // ??????
                if (photoModel.subType == HXPhotoModelMediaSubTypePhoto) {
                    // gif
                    if (photoModel.cameraPhotoType == HXPhotoModelMediaTypeCameraPhotoTypeLocalGif && photoModel.imageURL) {
                        [HHPhotoTool saveToAlbum:photoModel.imageURL];
                    } else {
                        [HHPhotoTool saveToAlbum:photoModel.previewPhoto];
                    }

                } else {
                    // ??????
                    [HHPhotoTool saveToAlbumAtVideoURL:photoModel.videoURL];
                }
                
            }
        } cancelClick:nil];
    };
    
    [photoManager addCustomAssetModel:arrImages];
    
    // ????????????????????????????????????view
    photoManager.configuration.customPreviewFromView = ^UIView *(NSInteger currentIndex) {
        if (!previews || previews.count <= currentIndex || ![previews[currentIndex] isKindOfClass:[UIView class]]) {
            return nil;
        }
        return previews.count > currentIndex ? previews[currentIndex] : nil;
    };
    // ????????????????????????????????????image
    photoManager.configuration.customPreviewFromImage = ^UIImage *(NSInteger currentIndex) {
        if (!previews || previews.count <= currentIndex || ![previews[currentIndex] isKindOfClass:[UIView class]]) {
            return nil;
        }
        if ([previews[currentIndex] isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView = (UIImageView *)previews[currentIndex];
            return imageView.image;
        }
        return nil;
    };
    // ???????????????????????????view
    photoManager.configuration.customPreviewToView = ^UIView *(NSInteger currentIndex) {
        if (!previews || previews.count <= currentIndex || ![previews[currentIndex] isKindOfClass:[UIView class]]) {
            return nil;
        }
        return previews.count > currentIndex ? previews[currentIndex] : nil;
    };

    [vc hx_presentPreviewPhotoControllerWithManager:photoManager
                                         previewStyle:HXPhotoViewPreViewShowStyleDark
                                         currentIndex:index
                                            photoView:nil];
}


/// ????????????|??????
+ (void)editImageWithController:(UIViewController *)vc source:(id)source isVideo:(BOOL)isVideo completion:(HHPhotoToolCompletion)completion {
        
    // ??????  ??????url
    
    HXPhotoModel *model = nil;
    if (isVideo) {
        model = [HXPhotoModel photoModelWithVideoURL:source];
    } else {
        if ([source isKindOfClass:[UIImage class]]) {
            model = [HXPhotoModel photoModelWithImage:source];
        } else if ([source isKindOfClass:[NSURL class]]) {
            model = [HXPhotoModel photoModelWithImage:source];
        }
    }
    
    if (!model) {
        return;
    }
    
    // ???????????????????????????
    HXPhotoManager *photoManager = [HXPhotoManager managerWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
    photoManager.configuration.languageType = [self getLanaguage];

    [vc hx_presentWxPhotoEditViewControllerWithConfiguration:photoManager.configuration.photoEditConfigur photoModel:model delegate:nil finish:^(HXPhotoEdit * _Nonnull photoEdit, HXPhotoModel * _Nonnull photoModel, HX_PhotoEditViewController * _Nonnull viewController) {
        
        if (completion) {
            
            [self getPhoto:photoModel success:completion failed:nil];

        }
        
    } cancel:^(HX_PhotoEditViewController * _Nonnull viewController) {
        // ??????
    }];

}

+ (BOOL)saveToAlbum:(id)image {
    if (!image) {
        return NO;
    }
    if ([image isKindOfClass:[UIImage class]]) {
        [self saveToAlbumAtImage:image];
        return YES;
    } else if ([image isKindOfClass:[NSURL class]]) {
        return [self saveToAlbumAtFileURL:image];
    } else if ([image isKindOfClass:[NSString class]]) {
        return [self saveToAlbumAtPath:image];
    }
    return NO;
}

+ (BOOL)saveToAlbumAtPath:(NSString *)path {
    if (!path) {
        return NO;
    }
    return [self saveToAlbumAtFileURL:[NSURL fileURLWithPath:path]];
}

+ (BOOL)saveToAlbumAtFileURL:(NSURL *)fileURL {
    if (!fileURL) {
        return NO;
    }
    __block NSString *createdAssetID = nil; // ?????????????????????????????????????????????
    NSError *error = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        createdAssetID = [PHAssetChangeRequest creationRequestForAssetFromImageAtFileURL:fileURL].placeholderForCreatedAsset.localIdentifier;
    } error:&error];
    BOOL success = createdAssetID && !error;
    if (success) {
        [HHToastTool showAtCenter:GetLocalLanguageTextValue(@"SaveSuccess")];
    } else {
        [HHToastTool showAtCenter:GetLocalLanguageTextValue(@"SaveFailed")];
    }
    return success;
}

+ (BOOL)saveToAlbumAtImage:(UIImage *)image {
    if (!image) {
        return NO;
    }
    [HXPhotoTools savePhotoToCustomAlbumWithName:nil photo:image location:nil complete:^(HXPhotoModel * _Nullable model, BOOL success) {
        if (success) {
            [HHToastTool showAtCenter:GetLocalLanguageTextValue(@"SaveSuccess")];
        } else {
            [HHToastTool showAtCenter:GetLocalLanguageTextValue(@"SaveFailed")];
        }
    }];
    return YES;
}

+ (BOOL)saveToAlbumAtVideoURL:(NSURL *)videoURL {
    if (!videoURL) {
        return NO;
    }
    [HXPhotoTools saveVideoToCustomAlbumWithName:nil videoURL:videoURL location:nil complete:^(HXPhotoModel * _Nullable model, BOOL success) {
        if (success) {
            [HHToastTool showAtCenter:GetLocalLanguageTextValue(@"SaveSuccess")];
        } else {
            [HHToastTool showAtCenter:GetLocalLanguageTextValue(@"SaveFailed")];
        }
    }];
    return YES;
}

@end


@implementation HHPhotoModel

+ (instancetype)modelWithImage:(UIImage *)image video:(NSURL *)video data:(NSData *)data type:(HHPhotoModelMediaType)type {
    HHPhotoModel *model = [[HHPhotoModel alloc] init];
    model.image = image;
    model.videoURL = video;
    model.data = data;
    model.type = type;
    return model;
}

@end
