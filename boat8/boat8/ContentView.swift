//
//  ContentView.swift
//  boat8
//
//  Created by p on 7/13/21.
//


import SwiftUI
import AVFoundation
import AVKit
// Create Date Formatter

// Set Date Format
func datecheck() -> String{
    let date = Date()

    // Create Date Formatter
    let dateFormatter = DateFormatter()

    // Set Date Format
    dateFormatter.dateFormat = "MM/dd/YYYY h:mma"

    // Convert Date to String
    return dateFormatter.string(from: date)
}
extension AnyTransition {
  static var customTransition: AnyTransition {
    let transition = AnyTransition.move(edge: .top)
      .combined(with: .scale(scale: 0.2, anchor: .topTrailing))
      .combined(with: .opacity)
    return transition
  }
}
/*
class ViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let label = UILabel(frame:CGRect(x: 0, y: 0, width: 300, height: 100))
        label.text = "MYFONT"
        view.addSubview(label)
        label.center = view.center
        label.font = UIFont(name:"SoinSansNeue-Black", size:32)
    }
}
*/

struct ContentView: View {
    @State private var thing:Bool = true
    @State  var url1 = Bundle.main.url(forResource: "ezgif-3-e0296e3c87e8", withExtension: "mov")!
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "ezgif-3-e0296e3c87e8", withExtension: "mov")!)

    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    static var customTransition: AnyTransition {
      let insertion = AnyTransition.move(edge: .top)
        .combined(with: .scale(scale: 0.2, anchor: .topTrailing))
        .combined(with: .opacity)
      let removal = AnyTransition.move(edge: .top)
      return .asymmetric(insertion: insertion, removal: removal)
    }

    var body: some View {
        
        ZStack{
            Image("background")
                .resizable().aspectRatio(contentMode: .fill).offset(y:-5)
            



            VStack{
                VideoPlayer(player: player).offset(y:-30).scaleEffect(x: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).onAppear {
                    player.play()
                }
            }
            VStack{
                Image("top").resizable().aspectRatio(contentMode: .fit).offset(y:-10)
            }
            VStack{
                Rectangle().fill(Color(red: 0.15, green: 0.15, blue: 0.15)).frame(width: 415, height: 60).offset(y:620)
                
                Image("bottom").resizable().aspectRatio(contentMode: .fit).offset(y:-10)
            }
            VStack{
                
                Button(action: {
                    if (self.thing==false){
                        self.thing=true
                    }
                    else if (self.thing==true){
                        self.thing=false
                    }
                }){
                //Image("center").resizable().aspectRatio(contentMode: .fit).offset(y:30).opacity(self.thing ? 0.7 : 0.0)
                }
            
                let x = datecheck()
                Text(x).font(Font.custom("SoinSansNeue-Black", size:30)).foregroundColor(Color.white).offset(y:290)
            }
            
        
        }
        

        /* here
        ZStack{
            
            
        Image("background")
            .resizable().aspectRatio(contentMode: .fill).offset(y:-28)
            VStack{
                Image("top").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).offset(y:-28)
            }
            
                VStack(alignment: .leading, spacing:0){
          
                        Rectangle()
                            .fill(thing ? Color(red: 0.204, green: 0.765, blue: 0.831) : Color(red: 52/255, green: 1, blue: 51/255))
                            .frame(width: 400, height: 200).offset(y:-6)
                        
                        Rectangle()
                            .fill(thing ? Color(red: 0.0, green: 0.706, blue: 0.796) : Color(red: 52/255, green: 1, blue: 51/255))
                            .frame(width: 400, height: 200).offset(y:-6)
                         

                    
                }
 
            Image("wave").resizable().opacity(0.01).transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))

            Button(action: {
                if (self.thing==false){
                    self.thing=true
                }
                else if (self.thing==true){
                    self.thing=false
                }
            }){
                
                Image(thing ? "center text" : "centergreen").resizable().aspectRatio(contentMode: .fill).offset(y:-29)

            }
            
            let x = datecheck()
            Text(x).font(Font.custom("SoinSansNeue-Black", size:30)).foregroundColor(Color.white).offset(y:280)
        }
         here*/
        
    }
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
