//
//  ViewController.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/5/22.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var setSlide: [Slide] = []
    
    var page = 0 {
        didSet {
            pageControl.currentPage = page
            page == setSlide.count - 1 ? nextButton.setTitle("Get Started", for: .normal) : nextButton.setTitle("Continue", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        displaySlideView(setSlide: setSlide)
    }


    @IBAction func nextButtonPressed(_ sender: Any) {
        if page == setSlide.count - 1 {
            // go to home vc
            let homeController = storyboard?.instantiateViewController(withIdentifier: "SignUpLogIn") as! UINavigationController
            homeController.modalPresentationStyle = .fullScreen
            present(homeController, animated: true)
        } else {
            page += 1
            let index = IndexPath(item: page, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setSlide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.slideIdentifier, for: indexPath) as? OnboardingCell
        cell?.setSlideValue(setSlide[indexPath.row])
//        ---fix image Radius
//        cell?.slideimage.makeRoundCorners(byRadius: 100)
        return cell!
    }
}

extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let setWidth = collectionView.frame.width
        page = Int(scrollView.contentOffset.x / setWidth)
    }
}
