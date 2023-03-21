import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var timeRemaining = 0
    @State private var minutesInput: Double = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = false
    @State private var hasRun = false
    @State private var audioPlayer: AVAudioPlayer?
    
    
    var timeRemainingFormatted: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    var body: some View {
        VStack {
            Text("Enter time in minutes:")
                .font(.title)

//            Time in seconds
//
//            TextField("", value: $timeRemaining, formatter: NumberFormatter())
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
            
//            Time in minutes
            TextField("", value: $minutesInput, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            

            Button(action: {
                timeRemaining = Int(minutesInput * 60)
                hasRun = true
                isActive.toggle()
                if isActive {
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                } else {
                    timer.upstream.connect().cancel()
                }
            }, label: {
                Text(isActive ? "Stop" : "Start")
                    .frame(width: 200, height: 50)
                    .background(isActive ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            })

            Text(timeRemainingFormatted)
                .font(.largeTitle)
                .padding(.top, 20)

        }
        .padding()
        .onReceive(timer) { _ in
            if isActive && timeRemaining > 0 {
                timeRemaining -= 1
            } else if timeRemaining == 0 && hasRun {
                isActive = false
                timer.upstream.connect().cancel()
                playAlarm()
            }
        }
    }

    func playAlarm() {
        print("playAlarm")
        if let soundURL = Bundle.main.url(forResource: "alarm", withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Unable to play alarm sound: \(error.localizedDescription)")
            }
        }
    }
}
