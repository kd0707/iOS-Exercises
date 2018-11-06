//
//  ChangeViewBackgroundThread.swift
//  ThreadGCDExercise12Oct
//
//  Created by Kamaluddin Khan on 16/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class ChangeViewBackgroundThread: UIViewController {
    
   @IBOutlet weak var view1:UIView?
    @IBOutlet weak var view2:UIView?
    var timerForChangeColor: DispatchSourceTimer?
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCustomeTimer()
    }
    deinit {
        stopTimer()
    }

    func  myCustomeTimer() {
        let myQueue = DispatchQueue(label: "MyQueue", attributes: .concurrent)
//        timerForChangeColor?.cancel()
        timerForChangeColor = DispatchSource.makeTimerSource(queue: myQueue)
        timerForChangeColor?.schedule(deadline: .now(), repeating: .seconds(7))
            
        timerForChangeColor?.setEventHandler(handler: {
            let color = self.getRandomColor()
            print("kamal")
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1.0, animations: {
                    if self.flag == 0{
                        self.view1?.backgroundColor = color
                        self.flag = 1
                        print("View1")
                    }
                   else
                    {
                        self.view2?.backgroundColor = color
                        self.flag = 0
                        print("View2")
                    }
                })
            }
            })
        timerForChangeColor?.resume()
    }
    
    func getRandomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        print("kamal")
        return UIColor(displayP3Red: red, green: green, blue: blue, alpha: 0.9)
    }
    
    private func stopTimer() {
        timerForChangeColor?.cancel()
        timerForChangeColor = nil
    }
}
