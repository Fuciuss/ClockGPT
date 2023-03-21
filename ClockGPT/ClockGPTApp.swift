//
//  ClockGPTApp.swift
//  ClockGPT
//
//  Created by Rees Pawson on 21/3/2023.
//

//import SwiftUI
//
//@main
//struct ClockGPTApp: App {
//    let persistenceController = PersistenceController.shared
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
//    }
//}


import Cocoa
import SwiftUI

@main
struct ClockGPTApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
     
     var body: some Scene {
         WindowGroup {
             EmptyView()
         }
     }
 }

 class AppDelegate: NSObject, NSApplicationDelegate {
     var statusBarItem: NSStatusItem!
     var popover = NSPopover()

     func applicationDidFinishLaunching(_ notification: Notification) {
         statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
         
         if let button = statusBarItem.button {
             button.image = NSImage(systemSymbolName: "timer", accessibilityDescription: nil)
             button.action = #selector(togglePopover)
         }
         
         popover.contentSize = NSSize(width: 300, height: 200)
         popover.behavior = .transient
         popover.contentViewController = NSHostingController(rootView: ContentView())
     }
     
     @objc func togglePopover() {
         if popover.isShown {
             popover.performClose(nil)
         } else {
             if let button = statusBarItem.button {
                 popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
             }
         }
     }
 }
