///:
/*****************************************************************************
 **                                                                         **
 **                               .======.                                  **
 **                               | INRI |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                      .========'      '========.                         **
 **                      |   _      xxxx      _   |                         **
 **                      |  /_;-.__ / _\  _.-;_\  |                         **
 **                      |     `-._`'`_/'`.-'     |                         **
 **                      '========.`\   /`========'                         **
 **                               | |  / |                                  **
 **                               |/-.(  |                                  **
 **                               |\_._\ |                                  **
 **                               | \ \`;|                                  **
 **                               |  > |/|                                  **
 **                               | / // |                                  **
 **                               | |//  |                                  **
 **                               | \(\  |                                  **
 **                               |  ``  |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                   \\    _  _\\| \//  |//_   _ \// _                     **
 **                  ^ `^`^ ^`` `^ ^` ``^^`  `^^` `^ `^                     **
 **                                                                         **
 **                       Copyright (c) 2014 Tong G.                        **
 **                          ALL RIGHTS RESERVED.                           **
 **                                                                         **
 ****************************************************************************/

#import "BLAppDelegate.h"
#import "BLMainWindowController.h"
#import "BLDashboardView.h"

// BLAppDelegate class
@implementation BLAppDelegate
    {
    NSWindow* _mainWindow;
    }

@synthesize _mainWindowController;

@synthesize _operationsMenu;

#pragma mark -
#pragma mark Conforms <NSNibLoading> protocol
- ( void ) awakeFromNib
    {
    self._mainWindowController = [ BLMainWindowController mainWindowController ];

    _mainWindow = [ [ self._mainWindowController window ] retain ];

    [ self._mainWindowController showWindow: self ];

    // Add `Operations...` custom menu item into `View`.
    NSMenuItem* viewMenuItemInMainMenuBar = [ [ NSApp mainMenu ] itemWithTitle: NSLocalizedString( @"View", nil ) ];
    NSMenu* viewMenu = [ viewMenuItemInMainMenuBar submenu ];

    [ viewMenu addItem: [ NSMenuItem separatorItem ] ];

    NSMenuItem* operationsMenuItem = [ [ [ NSMenuItem alloc ] initWithTitle: NSLocalizedString( @"Operations...", nil ) action: @selector( customTwoAction: ) keyEquivalent: @"" ] autorelease ];
    [ operationsMenuItem setView: self._operationsMenu ];
    [ operationsMenuItem setTarget: self ];
    [ operationsMenuItem setTag: 0x22 ];
    [ viewMenu addItem: operationsMenuItem ];
    }

- ( IBAction ) customOneAction: ( id )_Sender
    {
    __CAVEMEN_DEBUGGING__PRINT_WHICH_METHOD_INVOKED__;
    }

- ( IBAction ) customTwoAction: ( id )_Sender
    {
    __CAVEMEN_DEBUGGING__PRINT_WHICH_METHOD_INVOKED__;
    }

- ( void ) dealloc
    {
    [ _mainWindow release ];
    _mainWindow = nil;

    [ super dealloc ];
    }

- ( IBAction ) keyEquivalent: ( id )_Sender
    {
    [ USER_DEFAULTS setInteger: NSCommandKeyMask | NSShiftKeyMask forKey: BLUserDefaultsKeyKeyEquivalentModifier ];
    }

@end // BLAppDelegate

/////////////////////////////////////////////////////////////////////////////

/****************************************************************************
 **                                                                        **
 **      _________                                      _______            **
 **     |___   ___|                                   / ______ \           **
 **         | |     _______   _______   _______      | /      |_|          **
 **         | |    ||     || ||     || ||     ||     | |    _ __           **
 **         | |    ||     || ||     || ||     ||     | |   |__  \          **
 **         | |    ||     || ||     || ||     ||     | \_ _ __| |  _       **
 **         |_|    ||_____|| ||     || ||_____||      \________/  |_|      **
 **                                           ||                           **
 **                                    ||_____||                           **
 **                                                                        **
 ***************************************************************************/
///:~