//
//  RWFeedViewController.m
//  RealWonder
//
//  Created by Azat Melikyan on 10/8/17.
//  Copyright © 2017 RealWonder. All rights reserved.
//

#import "RWFeedViewController.h"
#import "RWWonderCollectionViewCell.h"

#define feedCell @"feedCell"

@import GoogleMobileAds;

@interface RWFeedViewController () <UICollectionViewDelegate,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout,
                                    GADBannerViewDelegate,
                                    GADInterstitialDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *feedCollectionView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (nonatomic) GADBannerView *adBannerView;
@property (nonatomic) GADInterstitial *adFullBannerView;

@end

@implementation RWFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFeed];
    GADRequest *request = [GADRequest request];
    request.testDevices = @[ kGADSimulatorID,                       // All simulators
                             @"9f65636828e14ea35a25f2a516c3c81b" ]; // Sample device ID
    [self.adBannerView loadRequest:request];
    GADRequest *requestForFll = [GADRequest request];
    requestForFll.testDevices = @[ kGADSimulatorID,                       // All simulators
                             @"9f65636828e14ea35a25f2a516c3c81b" ]; // Sample device ID
    self.adFullBannerView = [self createAndLoadInterstitial];
    [self.adFullBannerView loadRequest:requestForFll];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleRealize) name:@"Realize" object:nil];
    // Do any additional setup after loading the view from its nib.
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupFeed];
    }
    return self;
}

- (void)setupFeed {
    self.feedCollectionView.delegate = self;
    self.feedCollectionView.dataSource = self;
    
    [self.feedCollectionView registerClass:[RWWonderCollectionViewCell class] forCellWithReuseIdentifier:feedCell];
    [self.feedCollectionView registerNib:[UINib nibWithNibName:@"RWWonderCollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:feedCell];
    [self.feedCollectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (GADBannerView *)adBannerView {
    if (!_adBannerView) {
        _adBannerView = [[GADBannerView alloc] init];
        [_adBannerView setAdSize:kGADAdSizeSmartBannerLandscape];
        _adBannerView.adUnitID = @"ca-app-pub-6517624987717937/1712595327";
        _adBannerView.delegate = self;
        _adBannerView.rootViewController = self;
    }
    return _adBannerView;
}


- (GADInterstitial *)createAndLoadInterstitial {
    GADInterstitial *interstitial =
    [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-6517624987717937/5831803733"];
    interstitial.delegate = self;
    [interstitial loadRequest:[GADRequest request]];
    return interstitial;
}

- (void)handleRealize {
    if (self.adFullBannerView.isReady) {
        [self.adFullBannerView presentFromRootViewController:self];
    }
    GADRequest *requestForFll = [GADRequest request];
    requestForFll.testDevices = @[ kGADSimulatorID,                       // All simulators
                                   @"9f65636828e14ea35a25f2a516c3c81b" ]; // Sample device ID
    [self.adFullBannerView loadRequest:requestForFll];
}

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RWWonderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:feedCell forIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width, 100);
}

#pragma mark - GADBannerViewDelegate


- (void)adViewDidReceiveAd:(GADBannerView *)bannerView {
        bannerView.frame = CGRectMake(0, 0, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
        [self.bottomView addSubview:bannerView];
}

- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"error %@", error.description);
}

#pragma mark - GADBannerViewDelegate

- (void)interstitialDidDismissScreen:(GADInterstitial *)ad {
    self.adFullBannerView = [self createAndLoadInterstitial];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
