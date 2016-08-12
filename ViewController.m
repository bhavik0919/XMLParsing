//
//  ViewController.m
//  XMLParsing
//
//  Created by Bhavik Panchal on 9/24/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSXMLParserDelegate>

// The parser's delegate is informed of events through the methods in the NSXMLParserDelegateEventAdditions category.
@property (nonatomic, strong) NSXMLParser *xmlParser;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //set the xml path with string
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:@"Myxml" ofType:@"xml"];
    
    //set the sml with initwithcontentof url
    
    NSData *xml = [[NSData alloc] initWithContentsOfFile:xmlFilePath];
    
    //only applies to NSXMLParser instances initialized with -initWithContentsOfURL
    
    self.xmlParser = [[NSXMLParser alloc] initWithData:xml];
    
    self.xmlParser.delegate = self;
    
    if ([self.xmlParser parse])
    {
        NSLog(@"The XML is parsed.");
    } else{
        NSLog(@"Failed to parse the XML");
    }

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
