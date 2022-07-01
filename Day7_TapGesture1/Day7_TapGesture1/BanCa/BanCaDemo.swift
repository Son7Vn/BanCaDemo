//
//  BanCaDemo.swift
//  Day7_TapGesture1
//
//  Created by SonGoku on 29/06/2022.
//

import UIKit

class BanCaDemo: UIViewController {

    let viewSung: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    var diemA: CGPoint = CGPoint(x: 0, y: 0)
    var diemB: CGPoint = CGPoint(x: 0, y: 0)
    var diemC: CGPoint = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViewSung()
        addTapGetsTureOnVIEW()
    }
    
    func createViewSung() {
//        let w = view.frame.size.width
//        let h = view.frame.size.height
        viewSung.frame = CGRect(x: 0, y: view.frame.size.height - 100, width: 50, height: 100)
        viewSung.center.x = view.center.x
        viewSung.backgroundColor = .red
        viewSung.layer.cornerRadius = 6
        self.diemA = viewSung.center
        self.diemB = CGPoint(x: view.center.x, y: 0)
//        print(diemA.x,diemA.y)
//        print(diemB.x,diemB.y)
        view.addSubview(viewSung)
    }
    
    func addTapGetsTureOnVIEW() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnScreen))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
    }
    
    @objc func tapOnScreen(_ sender: UITapGestureRecognizer? = nil) {
        let toado: UITapGestureRecognizer = sender!
        self.diemC = CGPoint(x: toado.location(in: view).x, y: toado.location(in: view).y)
//        print(diemC.x,diemC.y)
        tinhHeSoGoc(diemA: self.diemA,diemB: self.diemB, diemC: self.diemC)
    }

    func tinhHeSoGoc(diemA: CGPoint, diemB: CGPoint, diemC: CGPoint) {
        // tinh AC:
        let CD = diemA.y - diemC.y
        let AD = diemC.x - diemA.x
        let AC = sqrt((CD*CD) + (AD*AD))
        //tinh AB:
        let BE = diemA.y - diemB.y
        let AE = diemB.x - diemA.x
        let AB = sqrt((BE*BE)+(AE*AE))
        //tinh BC
        let FC = diemC.x - diemB.x
        let FB = diemC.y - diemB.y
        let BC = sqrt((FC*FC)+(FB*FB))
        //tinh cos goc anpha
        let tuso = (AC*AC) + (AB*AB) - (BC*BC)
        let mauso = 2*AC*AB
        let cosAnpha = tuso/mauso
        
        quayNongSung(cosAnpha: cosAnpha)
    }
    
    func quayNongSung(cosAnpha: CGFloat) {
        UIView.animate(withDuration: 2) {
            self.viewSung.transform = CGAffineTransform(rotationAngle: cos(cosAnpha))
        } completion: { done in

        }
    }
    
}
