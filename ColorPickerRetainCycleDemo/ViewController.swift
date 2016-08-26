//
//  ViewController.swift
//  ColorPickerRetainCycleDemo
//
//  Created by Louis Tur on 8/25/16.
//  Copyright © 2016 catthoughts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let button: UIButton = UIButton(frame:
            CGRect(origin: CGPointMake(CGRectGetMidX(self.view.frame) - 50.0,
                CGRectGetMidY(self.view.frame) - 25.0),
                size: CGSize(width: 100.0, height: 50.0)))
        button.setTitle("Push to VC...", forState: .Normal)
        button.addTarget(self, action: #selector(ViewController.pushToColorPickerVC(_:)), forControlEvents: .TouchUpInside)
        button.backgroundColor = UIColor.blueColor()
        self.view.addSubview(button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func pushToColorPickerVC(sender: AnyObject?) {
        // MARK: change true/false here
        let dtvc = ColorPickerViewController(usingUpdatedDelegation: true)
        self.navigationController?.pushViewController(dtvc, animated: true)
    }
}


// MARK: - Demo Table View
internal class DemoTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("demoCell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "demoCell")
        }
        cell?.textLabel?.text = "Tap me!"
        
        return cell!
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // MARK: change true/false here
        let dtvc = ColorPickerViewController(usingUpdatedDelegation: true)
        self.navigationController?.pushViewController(dtvc, animated: true)
    }
}



// MARK - Demo Color Picker View Controller
internal class ColorPickerViewController: UIViewController {
    internal var colorWheel: SwiftHSVColorPicker!
    internal var catColorWheel: CatSwiftHSVColorPicker!
    private var useUpdatedDelegation: Bool = false
    
    init(usingUpdatedDelegation: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.useUpdatedDelegation = usingUpdatedDelegation
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        if self.useUpdatedDelegation {
            self.catColorWheel = CatSwiftHSVColorPicker(frame: CGRectMake(0.0, 44.0, 400.0, 400.0))
            self.catColorWheel.setViewColor(UIColor.redColor())
            self.view.addSubview(catColorWheel)
        } else {
            self.colorWheel = SwiftHSVColorPicker(frame: CGRectMake(0.0, 44.0, 400.0, 400.0))
            self.colorWheel.setViewColor(UIColor.redColor())
            self.view.addSubview(colorWheel)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}