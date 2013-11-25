#import "Scale_down_UIImage.h"

@implementation Scale_down_UIImage
@synthesize image=_image;

/**
@discussion This function will scale down an image to a desired file size while maintaining image dimensions
 */
-(void)Rescale{
    
    
    // Initial amount of compression
    CGFloat compression = 0.9f;
    // The maximum amount of compression
    CGFloat maxCompression = 0.1f;
    // The desired file size. In this case I'm scaling a UIImage to <=20kb
    int maxFileSize = 20*1024;
    
    // Get stream of data from desired image
    NSData *img_data= UIImageJPEGRepresentation(_image, 1);
    
    // Continuously scale image until desired size is
    while ([img_data length] > maxFileSize && compression > maxCompression)
    {
    compression -= 0.1;
    img_data = UIImageJPEGRepresentation(_image, compression);
    NSLog(@"Picture Size in bytes: %d",img_data.length);
    }
}

@end
