# colorPickerRetainCycleDemo
Simple demo app to illustrate a memory issue with [SwiftHSVColorPicker](https://github.com/johankasperi/SwiftHSVColorPicker)

### Usage:
1. Comment out line 24 or 25 (`let rootVC: `...) in `AppDelegate` depending on if you want to test with either a `UIButton` on a `UIViewController` or with a `UITableViewController` (results are similar either way)
2. Switch the `Bool` values in lines 40 and/or 84 when instatiating a `ColorPickerViewController`
  - `true` will use the proposed delegation changes and should result in a steady memory footprint after repeated push/pops to the navigation stack
  - `false` will use the SwiftHSVColorPicker library as is, and should result in an increase in memory footprint for each push/pop cycle performed
  

### Other: 
Even with the changes, there appears to be one other small instance of memory being retained that only occurs after the first view controller push when using either the `UIViewController` or the `UITableViewController`. It also happens somewhat randomly during following push/pops but only results in an uptick of about 0.1-0.2 MiB. I tried subbing out the usage of `CGImageRef` with `UIImage` but does not seem to allieviate the issue. Futher investigation is needed. 

### Testing Details
- Xcode 7.3.1
- Swift 2.2/2.3
- OSX 10.11.6
