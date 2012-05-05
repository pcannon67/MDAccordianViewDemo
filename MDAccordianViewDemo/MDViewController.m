//
//  MDViewController.m
//  MDAccordianViewDemo
//
//  Created by Dimitri Bouniol on 5/4/12.
//  Copyright (c) 2012 Mochi Development, Inc. All rights reserved.
//
//  Copyright (c) 2012 Dimitri Bouniol, Mochi Development, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software, associated artwork, and documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  1. The above copyright notice and this permission notice shall be included in
//     all copies or substantial portions of the Software.
//  2. Neither the name of Mochi Development, Inc. nor the names of its
//     contributors or products may be used to endorse or promote products
//     derived from this software without specific prior written permission.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  
//  Mochi Dev, and the Mochi Development logo are copyright Mochi Development, Inc.
//

#import "MDViewController.h"
#import "MDAccordianView.h"

@interface MDViewController ()

@end

@implementation MDViewController

- (void)loadView
{
    UIView *rootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view = rootView;
    rootView.backgroundColor = [UIColor blackColor];
    
    accordianView = [[MDAccordianView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [rootView addSubview:accordianView];
    accordianView.contentView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TestImage.png"]];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [rootView addGestureRecognizer:panGesture];
}

- (void)pan:(UIPanGestureRecognizer *)panGesture
{
    CGFloat distance = [panGesture translationInView:self.view].y;
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        cachedRect = accordianView.frame;
    } else {
        accordianView.frame = CGRectMake(cachedRect.origin.x, cachedRect.origin.y, cachedRect.size.width, cachedRect.size.height+distance);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
