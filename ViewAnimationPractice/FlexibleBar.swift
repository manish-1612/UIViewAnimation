//
//  FlexibleBar.swift
//  ViewAnimationPractice
//
//  Created by Manish Kumar on 07/10/15.
//  Copyright © 2015 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import UIKit

class FlexibleBar: BLKFlexibleHeightBar {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    init(frame: CGRect , andHeaderText headerText:String, andDescriptionString descriptionString: String){
        super.init(frame: frame)
        configureBarwithframe(frame, andHeaderText: headerText, andDescriptionString: descriptionString)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configureBarwithframe(frame: CGRect , andHeaderText headerText:String, andDescriptionString descriptionString: String){
        
        self.maximumBarHeight = 200.0
        self.minimumBarHeight = 65.0;
        self.backgroundColor = UIColor(red: 0.17, green: 0.63, blue: 0.11, alpha: 1.0)
te
        //add header label
        let labelForHeader = UILabel(frame: CGRectMake(20.0, 66.0, UIScreen.mainScreen().bounds.size.width - 40.0, 20.0))
        labelForHeader.textColor = UIColor.whiteColor()
        labelForHeader.text = headerText
        labelForHeader.font = UIFont(name: "System", size: 22.0)
        labelForHeader.textAlignment = NSTextAlignment.Center
        labelForHeader.backgroundColor = UIColor.redColor()
        labelForHeader.numberOfLines = 0
        labelForHeader.sizeToFit()
        
        let initialHeaderLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialHeaderLabelLayoutAttributes.size = labelForHeader.sizeThatFits(CGSizeZero)
        initialHeaderLabelLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, self.maximumBarHeight-50.0)
        labelForHeader.addLayoutAttributes(initialHeaderLabelLayoutAttributes, forProgress: 0.0)
        
        let midwayNameLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: initialHeaderLabelLayoutAttributes)
        midwayNameLabelLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, (self.maximumBarHeight-self.minimumBarHeight)*0.4+self.minimumBarHeight-50.0);
        labelForHeader.addLayoutAttributes(midwayNameLabelLayoutAttributes, forProgress: 0.5)
        
        let finalNameLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: midwayNameLabelLayoutAttributes)
        finalNameLabelLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, self.minimumBarHeight-25.0);
        labelForHeader.addLayoutAttributes(finalNameLabelLayoutAttributes, forProgress: 1.0)
        
        self.addSubview(labelForHeader)

    }

}
