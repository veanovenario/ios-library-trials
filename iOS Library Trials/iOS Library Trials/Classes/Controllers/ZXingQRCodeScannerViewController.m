//
//  ZXingQRCodeScannerViewController.m
//  iOS Library Trials
//
//  Created by Vea Novenario on 20/01/2017.
//  Copyright © 2017 Vea Novenario. All rights reserved.
//

#import "ZXingQRCodeScannerViewController.h"
#import "ZXingObjC.h"

@interface ZXingQRCodeScannerViewController ()

@property (nonatomic, weak) IBOutlet UIView *cameraPreviewView;
@property (nonatomic, weak) IBOutlet UILabel *resultLabel;

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *captureLayer;

@end

@implementation ZXingQRCodeScannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setupScanner];
    
    // Start the camera capture session as soon as the view appears completely.
    [self.captureSession startRunning];
}

-(void)setupScanner{
    
    // Setup Camera Scanner
    self.captureSession = [[AVCaptureSession alloc] init];
    
    NSError *error;
    // Set camera capture device to default and the media type to video.
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // Set video capture input: If there is a problem initialising the camera, it will give am error.
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    if (input) {
        
        // Add input souce for capture session. i.e., Camera
        [self.captureSession addInput:input];
        
        AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
        [self.captureSession addOutput:captureMetadataOutput];
        
        // Create a new queue and set delegate for metadata objects scanned.
        dispatch_queue_t dispatchQueue;
        dispatchQueue = dispatch_queue_create("scanQueue", NULL);
        [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
        [captureMetadataOutput setMetadataObjectTypes:[captureMetadataOutput availableMetadataObjectTypes]];
        
        // Layer that will display what the camera is capturing.
        self.captureLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.captureSession];
        [self.captureLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
        [self.captureLayer setFrame:self.cameraPreviewView.layer.bounds];
        [self.cameraPreviewView.layer addSublayer:self.captureLayer];
    }else{
        NSLog(@"Error Getting Camera Input");
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.captureSession stopRunning];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate method (QR Camera Scanner)

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    
    // Do your action on barcode capture here:
    NSString *capturedString = nil;
    
    // Specify the barcodes you want to read here:
    NSArray *supportedBarcodeTypes = @[AVMetadataObjectTypeUPCECode,
                                       AVMetadataObjectTypeCode39Code,
                                       AVMetadataObjectTypeCode39Mod43Code,
                                       AVMetadataObjectTypeEAN13Code,
                                       AVMetadataObjectTypeEAN8Code,
                                       AVMetadataObjectTypeCode93Code,
                                       AVMetadataObjectTypeCode128Code,
                                       AVMetadataObjectTypePDF417Code,
                                       AVMetadataObjectTypeQRCode,
                                       AVMetadataObjectTypeAztecCode];
    
    // In all scanned values..
    for (AVMetadataObject *barcodeMetadata in metadataObjects) {
        // ..check if it is a suported barcode
        for (NSString *supportedBarcode in supportedBarcodeTypes) {
            
            if ([supportedBarcode isEqualToString:barcodeMetadata.type]) {
                // This is a supported barcode
                // Note barcodeMetadata is of type AVMetadataObject
                // AND barcodeObject is of type AVMetadataMachineReadableCodeObject
                AVMetadataMachineReadableCodeObject *barcodeObject = (AVMetadataMachineReadableCodeObject *)[self.captureLayer transformedMetadataObjectForMetadataObject:barcodeMetadata];
                capturedString = [barcodeObject stringValue];
                // Got the barcode. Set the text in the UI and break out of the loop.
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [self.captureSession stopRunning];
                    
                    // String from QR
                    self.resultLabel.text = capturedString;
                    
                });
                return;
            }
        }
    }
}

@end
