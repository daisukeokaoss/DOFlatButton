//
//  DOFlatButton.swift
//  DOFlatButton
//
//  MIT License
//

import Foundation

import UIKit


public class DOFlatButton :UIButton
{
    private var faceColors:Dictionary<UInt,UIColor>?
    private var sideColors:Dictionary<UInt,UIColor>?
    private var borderColors:Dictionary<UInt,UIColor>?
    
    public var faceColor:UIColor?{
        set{
            self.setFaceColor(faceColor: newValue!,state:state)
        }
        get{
            return self.faceColorForState(state: state)
        }
    }
    public var sideColor:UIColor?{
        set{
            self.setSideColor(sideColor: newValue!, state: state)
        }
        
        get{
            return self.sideColorForState(state: state)
        }
    }
    public var borderColor:UIColor?{
        set{
            self.setBorderColor(borderColor: newValue!, state: state)
        }
        get{
            return self.borderColorForState(state: state)
        }
    }
    
    public var radius:CGFloat?
    public var margin:CGFloat?
    public var depth:CGFloat?
    public var borderWidth:CGFloat?
    
    public func setFaceColor(faceColor:UIColor,state:UIControlState)
    {
        self.faceColors?[state.rawValue] = faceColor
    }
    public func setSideColor(sideColor:UIColor,state:UIControlState)
    {
        self.sideColors?[state.rawValue] = sideColor
    }
    public func setBorderColor(borderColor:UIColor,state:UIControlState)
    {
        self.borderColors?[state.rawValue] = borderColor
    }
    
    public func faceColorForState(state:UIControlState) -> UIColor
    {
        if self.faceColors?[state.rawValue] == nil{
            return (self.faceColors?[UIControlState.normal.rawValue])!
        }
        
        return (self.faceColors?[state.rawValue])!
    }
    
    public func sideColorForState(state:UIControlState) -> UIColor
    {
        if self.sideColors?[state.rawValue] == nil{
            return (self.sideColors?[UIControlState.normal.rawValue])!
        }
        return (self.sideColors?[state.rawValue])!
    }
    
    public func borderColorForState(state:UIControlState) -> UIColor
    {
        if self.borderColors?[state.rawValue] == nil{
            return (self.borderColors?[UIControlState.normal.rawValue])!
        }
        return (self.borderColors?[state.rawValue])!
    }
    
    public override func encode(with aCoder: NSCoder) {
        
    }
    
    /*override public func encodeWithCoder(aCoder: NSCoder) {
        
    }*/
    override init(frame:CGRect){
        //self.init()
        
        super.init(frame: frame)
        self.dofb_init()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        //self.init()
        super.init(coder: aDecoder)
        self.dofb_init()
    }
    
    /*override init(){
        super.init()
        self.dofb_init()
    }*/
    
    func dofb_init()
    {
        self.faceColors = [:]
        self.sideColors = [:]
        self.borderColors = [:]
        
        self.faceColor = UIColor(red: 0.333, green: 0.631, blue: 0.851, alpha: 1.0)
        self.sideColor = UIColor(red: 0.310, green: 0.498, blue: 0.702, alpha: 1.0)
        self.borderColor = UIColor(red: 0.310, green: 0.498, blue: 0.702, alpha: 1.0)
        
        self.radius = 6.0
        self.margin = 4.0
        self.depth = 3.0
        self.borderWidth = 0.0
        
        self.setTitleColor(UIColor.white, for: UIControlState.normal)
    }
    
    override public func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title, for: state)
    }
    
    override public func layoutSubviews()
    {
        super.layoutSubviews()
        var frame:CGRect = self.titleLabel!.frame
        frame.origin.y = frame.origin.y - self.margin!/2
        
        var imageViewFrame:CGRect = self.imageView!.frame
        imageViewFrame.origin.y = imageViewFrame.origin.y - self.margin!/2
        
        if(self.state == UIControlState.selected || self.state == UIControlState.highlighted){
            frame.origin.y = frame.origin.y + self.depth!
            imageViewFrame.origin.y = imageViewFrame.origin.y + self.depth!
        }
        
        self.titleLabel?.frame = frame
        self.imageView?.frame = imageViewFrame
    }
    
    override public var frame:CGRect{
        get{
            return super.frame
        }
        set{
            super.frame = newValue
            self.setNeedsDisplay()
        }
    }
    
    override public var isHighlighted:Bool{
        set{
            super.isHighlighted = newValue
            self.setNeedsDisplay()
        }
        get{
            return super.isHighlighted
        }
        
    }
    override public var isSelected:Bool{
        set{
            super.isSelected = newValue
            self.setNeedsDisplay()
        }
        get{
            return super.isSelected
        }
    }
    
    override public var isEnabled:Bool{
        set{
            super.isEnabled = newValue
            self.setNeedsDisplay()
        }
        get{
            return super.isEnabled
        }
    }
    
    private func setFaceColor(faceColor:UIColor){
        self.setFaceColor(faceColor: faceColor, state: UIControlState.normal)
        self.setFaceColor(faceColor: faceColor, state: UIControlState.highlighted)
        self.setFaceColor(faceColor: faceColor, state: UIControlState.selected)
        self.setFaceColor(faceColor: faceColor, state: UIControlState.disabled)

    }
    
    private func setBorderColor(borderColor:UIColor){
        self.setBorderColor(borderColor: borderColor, state: UIControlState.normal)
        self.setBorderColor(borderColor: borderColor, state: UIControlState.highlighted)
        self.setBorderColor(borderColor: borderColor, state: UIControlState.selected)
        self.setBorderColor(borderColor: borderColor, state: UIControlState.disabled)
        self.setBorderColor(borderColor: borderColor, state: UIControlState.application)
        self.setBorderColor(borderColor: borderColor, state: UIControlState())
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let size:CGSize = self.bounds.size
        
        let surfaceRect:CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)//CGRectMake(0, 0, size.width, size.height)
        var surfaceImage:UIImage
        
        UIGraphicsBeginImageContextWithOptions(surfaceRect.size, false, 0.0);
        
        let borderColor:UIColor? = self.borderColorForState(state: self.state)
        if(borderColor != nil){
            borderColor!.set()
            self.drawRoundedRect(rect: surfaceRect, radius: self.radius!, context: UIGraphicsGetCurrentContext()!)
        }
            
        self.faceColorForState(state: self.state).set()
        
        self.drawRoundedRect(rect: surfaceRect.insetBy(dx: self.borderWidth!, dy: self.borderWidth!), radius: (self.radius! - self.borderWidth!), context: UIGraphicsGetCurrentContext()!)
        
        surfaceImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext();
        
        self.sideColorForState(state: self.state).set()
        
        let sideRect:CGRect = CGRect(x: 0, y: size.height * 1.0 / 4.0, width: size.width, height: size.height * 3.0/4.0)//CGRectMake(0,size.height * 1.0 / 4.0,size.width,size.height * 3.0/4.0)
        
        self.drawRoundedRect(rect:sideRect, radius: self.radius!, context: UIGraphicsGetCurrentContext()!)
        
        let actualSurfaceRect:CGRect
        
        if(self.state == UIControlState.selected || self.state == UIControlState.highlighted){
            actualSurfaceRect = CGRect(x: 0, y: self.depth!, width: size.width, height: size.height - self.margin!)//CGRectMake(0, self.depth!, size.width, size.height - self.margin!)
        }else {
            actualSurfaceRect = CGRect(x: 0, y: 0, width: size.width, height: size.height - self.margin!)//CGRectMake(0, 0, size.width, size.height - self.margin!)
        }
        
        surfaceImage.draw(in: actualSurfaceRect)
        
    }
    
    func drawRoundedRect(rect:CGRect,radius:CGFloat,context:CGContext)
    {
        var rectvariable = rect
        rectvariable.origin.x += 0.5
        rectvariable.origin.y += 0.5
        rectvariable.size.width -= 1.0
        rectvariable.size.height -= 1.0
        
        let minX:CGFloat = rectvariable.minX
        let midX:CGFloat = rectvariable.midX
        let maxX:CGFloat = rectvariable.maxX
        let minY:CGFloat = rectvariable.minY
        let midY:CGFloat = rectvariable.midY
        let maxY:CGFloat = rectvariable.maxY
        
        context.move(to: CGPoint(x: minX, y: midY))
        context.addArc(tangent1End: CGPoint(x: minX,y: minY), tangent2End: CGPoint(x:midX,y:minY), radius: radius)
        context.addArc(tangent1End: CGPoint(x:maxX,y:minY), tangent2End: CGPoint(x:maxX,y:midY), radius: radius)
        context.addArc(tangent1End: CGPoint(x:maxX,y:maxY), tangent2End: CGPoint(x:midX,y:maxY), radius: radius)
        context.addArc(tangent1End: CGPoint(x:minX,y:maxY), tangent2End: CGPoint(x:minX,y:midY), radius: radius)
        context.closePath();
        
        context.drawPath(using: CGPathDrawingMode.fillStroke)
    }
    

    
    
    
}

