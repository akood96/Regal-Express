//
//  ViewController.swift
//  Regal Express
//
//  Created by akood on 5/3/19.
//  Copyright © 2019 akood. All rights reserved.
//

import UIKit
import MapKit
import GoogleMobileAds


class ViewController: UIViewController {
    
    var interstitial: GADInterstitial!
    
    @IBAction func theDirection(_ sender: Any) {
        let latitude:CLLocationDegrees = 34.491611
        let longitude:CLLocationDegrees = -89.05674
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Regal"
        mapItem.openInMaps(launchOptions: options)
        
    }

    
    @IBAction func makeCall(_ sender: Any) {
     
        
        /*let url: NSURL = URL(string: "TEL://6625381080")! as NSURL; UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)*/
        
    
    }
    
    let backgroundImageView = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        setBackground()
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
    }
    func setBackground() {
    view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "IMG_4662")
        view.sendSubviewToBack(backgroundImageView)
    }
   

    @IBAction func testOne(_ sender: Any) {
        
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    

}

