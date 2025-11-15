class_name JK_Enums
extends Node

enum Key_Codes {
	VK_LBUTTON  = 0x01 , # Left mouse button
	VK_RBUTTON  = 0x02 , # Right mouse button
	VK_CANCEL  = 0x03 , # Control-break processing
	VK_MBUTTON  = 0x04 , # Middle mouse button
	VK_XBUTTON1  = 0x05 , # X1 mouse button
	VK_XBUTTON2  = 0x06 , # X2 mouse button
	RESERVED_1 = 0x07 , # Reserved
	VK_BACK  = 0x08 , # Backspace key
	VK_TAB  = 0x09 , # Tab key
	#RESERVED_2 = 0x0A-0B , # Reserved
	VK_CLEAR  = 0x0C , # Clear key
	VK_RETURN  = 0x0D , # Enter key
	#RESERVED_3 = 0x0E-0F , # Unassigned
	VK_SHIFT  = 0x10 , # Shift key
	VK_CONTROL  = 0x11 , # Ctrl key
	VK_MENU  = 0x12 , # Alt key
	VK_PAUSE  = 0x13 , # Pause key
	VK_CAPITAL  = 0x14 , # Caps lock key
	VK_KANA  = 0x15 , # IME Kana mode
	VK_HANGUL  = 0x15 , # IME Hangul mode
	VK_IME_ON  = 0x16 , # IME On
	VK_JUNJA  = 0x17 , # IME Junja mode
	VK_FINAL  = 0x18 , # IME final mode
	VK_HANJA  = 0x19 , # IME Hanja mode
	VK_KANJI  = 0x19 , # IME Kanji mode
	VK_IME_OFF  = 0x1A , # IME Off
	VK_ESCAPE  = 0x1B , # Esc key
	VK_CONVERT  = 0x1C , # IME convert
	VK_NONCONVERT  = 0x1D , # IME nonconvert
	VK_ACCEPT  = 0x1E , # IME accept
	VK_MODECHANGE  = 0x1F , # IME mode change request
	VK_SPACE  = 0x20 , # Spacebar key
	VK_PRIOR  = 0x21 , # Page up key
	VK_NEXT  = 0x22 , # Page down key
	VK_END  = 0x23 , # End key
	VK_HOME  = 0x24 , # Home key
	VK_LEFT  = 0x25 , # Left arrow key
	VK_UP  = 0x26 , # Up arrow key
	VK_RIGHT  = 0x27 , # Right arrow key
	VK_DOWN  = 0x28 , # Down arrow key
	VK_SELECT  = 0x29 , # Select key
	VK_PRINT  = 0x2A , # Print key
	VK_EXECUTE  = 0x2B , # Execute key
	VK_SNAPSHOT  = 0x2C , # Print screen key
	VK_INSERT  = 0x2D , # Insert key
	VK_DELETE  = 0x2E , # Delete key
	VK_HELP  = 0x2F , # Help key
	VK_0  = 0x30 , # 0 key
	VK_1  = 0x31 , # 1 key
	VK_2  = 0x32 , # 2 key
	VK_3  = 0x33 , # 3 key
	VK_4  = 0x34 , # 4 key
	VK_5  = 0x35 , # 5 key
	VK_6  = 0x36 , # 6 key
	VK_7  = 0x37 , # 7 key
	VK_8  = 0x38 , # 8 key
	VK_9  = 0x39 , # 9 key
	 #= 0x3A-40 , # Undefined
	VK_A  = 0x41 , # A key
	VK_B  = 0x42 , # B key
	VK_C = 0x43 , # C key
	VK_D = 0x44 , # D key
	VK_E = 0x45 , # E key
	VK_F = 0x46 , # F key
	VK_G  = 0x47 , # G key
	VK_H = 0x48 , # H key
	VK_I = 0x49 , # I key
	VK_J = 0x4A , # J key
	VK_K = 0x4B , # K key
	VK_L = 0x4C , # L key
	VK_M = 0x4D , # M key
	VK_N = 0x4E , # N key
	VK_O = 0x4F , # O key
	VK_P = 0x50 , # P key
	VK_Q = 0x51 , # Q key
	VK_R = 0x52 , # R key
	VK_S = 0x53 , # S key
	VK_T = 0x54 , # T key
	VK_U = 0x55 , # U key
	VK_V = 0x56 , # V key
	VK_W = 0x57 , # W key
	VK_X = 0x58 , # X key
	VK_Y = 0x59 , # Y key
	VK_Z = 0x5A , # Z key
	VK_LWIN  = 0x5B , # Left Windows logo key
	VK_RWIN  = 0x5C , # Right Windows logo key
	VK_APPS  = 0x5D , # Application key
	 #= 0x5E , # Reserved
	VK_SLEEP  = 0x5F , # Computer Sleep key
	VK_NUMPAD0  = 0x60 , # Numeric keypad 0 key
	VK_NUMPAD1  = 0x61 , # Numeric keypad 1 key
	VK_NUMPAD2  = 0x62 , # Numeric keypad 2 key
	VK_NUMPAD3  = 0x63 , # Numeric keypad 3 key
	VK_NUMPAD4  = 0x64 , # Numeric keypad 4 key
	VK_NUMPAD5  = 0x65 , # Numeric keypad 5 key
	VK_NUMPAD6  = 0x66 , # Numeric keypad 6 key
	VK_NUMPAD7  = 0x67 , # Numeric keypad 7 key
	VK_NUMPAD8  = 0x68 , # Numeric keypad 8 key
	VK_NUMPAD9  = 0x69 , # Numeric keypad 9 key
	VK_MULTIPLY  = 0x6A , # Multiply key
	VK_ADD  = 0x6B , # Add key
	VK_SEPARATOR  = 0x6C , # Separator key
	VK_SUBTRACT  = 0x6D , # Subtract key
	VK_DECIMAL  = 0x6E , # Decimal key
	VK_DIVIDE  = 0x6F , # Divide key
	VK_F1  = 0x70 , # F1 key
	VK_F2  = 0x71 , # F2 key
	VK_F3  = 0x72 , # F3 key
	VK_F4  = 0x73 , # F4 key
	VK_F5  = 0x74 , # F5 key
	VK_F6  = 0x75 , # F6 key
	VK_F7  = 0x76 , # F7 key
	VK_F8  = 0x77 , # F8 key
	VK_F9  = 0x78 , # F9 key
	VK_F10  = 0x79 , # F10 key
	VK_F11  = 0x7A , # F11 key
	VK_F12  = 0x7B , # F12 key
	VK_F13  = 0x7C , # F13 key
	VK_F14  = 0x7D , # F14 key
	VK_F15  = 0x7E , # F15 key
	VK_F16  = 0x7F , # F16 key
	VK_F17  = 0x80 , # F17 key
	VK_F18  = 0x81 , # F18 key
	VK_F19  = 0x82 , # F19 key
	VK_F20  = 0x83 , # F20 key
	VK_F21  = 0x84 , # F21 key
	VK_F22  = 0x85 , # F22 key
	VK_F23  = 0x86 , # F23 key
	VK_F24  = 0x87 , # F24 key
	 #= 0x88-8F , # Reserved
	VK_NUMLOCK  = 0x90 , # Num lock key
	VK_SCROLL  = 0x91 , # Scroll lock key
	 #= 0x92-96 , # OEM specific
	 #= 0x97-9F , # Unassigned
	VK_LSHIFT  = 0xA0 , # Left Shift key
	VK_RSHIFT  = 0xA1 , # Right Shift key
	VK_LCONTROL  = 0xA2 , # Left Ctrl key
	VK_RCONTROL  = 0xA3 , # Right Ctrl key
	VK_LMENU  = 0xA4 , # Left Alt key
	VK_RMENU  = 0xA5 , # Right Alt key
	VK_BROWSER_BACK  = 0xA6 , # Browser Back key
	VK_BROWSER_FORWARD  = 0xA7 , # Browser Forward key
	VK_BROWSER_REFRESH  = 0xA8 , # Browser Refresh key
	VK_BROWSER_STOP  = 0xA9 , # Browser Stop key
	VK_BROWSER_SEARCH  = 0xAA , # Browser Search key
	VK_BROWSER_FAVORITES  = 0xAB , # Browser Favorites key
	VK_BROWSER_HOME  = 0xAC , # Browser Start and Home key
	VK_VOLUME_MUTE  = 0xAD , # Volume Mute key
	VK_VOLUME_DOWN  = 0xAE , # Volume Down key
	VK_VOLUME_UP  = 0xAF , # Volume Up key
	VK_MEDIA_NEXT_TRACK  = 0xB0 , # Next Track key
	VK_MEDIA_PREV_TRACK  = 0xB1 , # Previous Track key
	VK_MEDIA_STOP  = 0xB2 , # Stop Media key
	VK_MEDIA_PLAY_PAUSE  = 0xB3 , # Play/Pause Media key
	VK_LAUNCH_MAIL  = 0xB4 , # Start Mail key
	VK_LAUNCH_MEDIA_SELECT  = 0xB5 , # Select Media key
	VK_LAUNCH_APP1  = 0xB6 , # Start Application 1 key
	VK_LAUNCH_APP2  = 0xB7 , # Start Application 2 key
	 #= 0xB8-B9 , # Reserved
	VK_OEM_1  = 0xBA , # It can vary by keyboard. For the US ANSI keyboard , the Semiсolon and Colon key
	VK_OEM_PLUS  = 0xBB , # For any country/region, the Equals and Plus key
	VK_OEM_COMMA  = 0xBC , # For any country/region, the Comma and Less Than key
	VK_OEM_MINUS  = 0xBD , # For any country/region, the Dash and Underscore key
	VK_OEM_PERIOD  = 0xBE , # For any country/region, the Period and Greater Than key
	VK_OEM_2  = 0xBF , # It can vary by keyboard. For the US ANSI keyboard, the Forward Slash and Question Mark key
	VK_OEM_3  = 0xC0 , # It can vary by keyboard. For the US ANSI keyboard, the Grave Accent and Tilde key
	 #= 0xC1-DA , # Reserved
	VK_OEM_4  = 0xDB , # It can vary by keyboard. For the US ANSI keyboard, the Left Brace key
	VK_OEM_5  = 0xDC , # It can vary by keyboard. For the US ANSI keyboard, the Backslash and Pipe key
	VK_OEM_6  = 0xDD , # It can vary by keyboard. For the US ANSI keyboard, the Right Brace key
	VK_OEM_7  = 0xDE , # It can vary by keyboard. For the US ANSI keyboard, the Apostrophe and Double Quotation Mark key
	VK_OEM_8  = 0xDF , # It can vary by keyboard. For the Canadian CSA keyboard, the Right Ctrl key
	 #= 0xE0 , # Reserved
	 #= 0xE1 , # OEM specific
	VK_OEM_102  = 0xE2 , # It can vary by keyboard. For the European ISO keyboard, the Backslash and Pipe key
	 #= 0xE3-E4 , # OEM specific
	VK_PROCESSKEY  = 0xE5 , # IME PROCESS key
	 #= 0xE6 , # OEM specific
	VK_PACKET  = 0xE7 , # Used to pass Unicode characters as if they were keystrokes. The VK_PACKET key is the low word of a 32-bit Virtual Key value used for non-keyboard input methods. For more information, see Remark in KEYBDINPUT, SendInput, WM_KEYDOWN, and WM_KEYUP
	 #= 0xE8 , # Unassigned
	 #= 0xE9-F5 , # OEM specific
	VK_ATTN  = 0xF6 , # Attn key
	VK_CRSEL  = 0xF7 , # CrSel key
	VK_EXSEL  = 0xF8 , # ExSel key
	VK_EREOF  = 0xF9 , # Erase EOF key
	VK_PLAY  = 0xFA , # Play key
	VK_ZOOM  = 0xFB , # Zoom key
	VK_NONAME  = 0xFC , # Reserved
	VK_PA1  = 0xFD , # PA1 key
	VK_OEM_CLEAR  = 0xFE , # Clear key
}

enum Input_Types {
	KEY_CODE,
	UNICODE,
	MOUSE
}

var Char_To_Key_Code: Dictionary = {
	'a' = Key_Codes.VK_A,
	'b' = Key_Codes.VK_B,
	'c' = Key_Codes.VK_C,
	'd' = Key_Codes.VK_D,
	'e' = Key_Codes.VK_E,
	'f' = Key_Codes.VK_F,
	'g' = Key_Codes.VK_G,
	'h' = Key_Codes.VK_H,
	'i' = Key_Codes.VK_I,
	'j' = Key_Codes.VK_J,
	'k' = Key_Codes.VK_K,
	'l' = Key_Codes.VK_L,
	'm' = Key_Codes.VK_M,
	'n' = Key_Codes.VK_N,
	'o' = Key_Codes.VK_O,
	'p' = Key_Codes.VK_P,
	'q' = Key_Codes.VK_Q,
	'r' = Key_Codes.VK_R,
	's' = Key_Codes.VK_S,
	't' = Key_Codes.VK_T,
	'u' = Key_Codes.VK_U,
	'v' = Key_Codes.VK_V,
	'w' = Key_Codes.VK_W,
	'x' = Key_Codes.VK_X,
	'y' = Key_Codes.VK_Y,
	'z' = Key_Codes.VK_Z,
	#'`' = Key_Codes. # look into using c++ code to convert chars to scan codes?
}

var godot_vK_to_windows_vK : Dictionary = {
	# Godot's values are here right now
	# I need Godot's values on left, and Windows Virtual Key Codes on Right so I can convert
	# godot's into windows so then I can print it FUCK THIS
	# I think I will have to manually type out all of them
	KEY_NONE : 0,
	KEY_SPECIAL : 4194304,
	KEY_ESCAPE : 0x1B,
	KEY_TAB : 0x09,
	KEY_BACKTAB : 4194307,
	KEY_BACKSPACE : 0x08,
	KEY_ENTER : 0x0D,
	KEY_KP_ENTER : 4194310,
	KEY_INSERT : 0x2D,
	KEY_DELETE : Key_Codes.VK_DELETE,
	KEY_PAUSE : 4194313,
	KEY_PRINT : 4194314,
	KEY_SYSREQ : 4194315,
	KEY_CLEAR : 4194316,
	KEY_HOME : Key_Codes.VK_HOME,
	KEY_END : Key_Codes.VK_END,
	KEY_LEFT : 4194319,
	KEY_UP : 4194320,
	KEY_RIGHT : 4194321,
	KEY_DOWN : 4194322,
	KEY_PAGEUP : 4194323,
	KEY_PAGEDOWN : 4194324,
	KEY_SHIFT : 0x10,
	KEY_CTRL : 0x11,
	KEY_META : 4194327,
	KEY_ALT : 0x12,
	KEY_CAPSLOCK : 0x14,
	KEY_NUMLOCK : 4194330,
	KEY_SCROLLLOCK : 4194331,
	KEY_F1 : 4194332,
	KEY_F2 : 4194333,
	KEY_F3 : 4194334,
	KEY_F4 : 4194335,
	KEY_F5 : 4194336,
	KEY_F6 : 4194337,
	KEY_F7 : 4194338,
	KEY_F8 : 4194339,
	KEY_F9 : 4194340,
	KEY_F10 : 4194341,
	KEY_F11 : 4194342,
	KEY_F12 : 4194343,
	KEY_F13 : 4194344,
	KEY_F14 : 4194345,
	KEY_F15 : 4194346,
	KEY_F16 : 4194347,
	KEY_F17 : 4194348,
	KEY_F18 : 4194349,
	KEY_F19 : 4194350,
	KEY_F20 : 4194351,
	KEY_F21 : 4194352,
	KEY_F22 : 4194353,
	KEY_F23 : 4194354,
	KEY_F24 : 4194355,
	KEY_F25 : 4194356,
	KEY_F26 : 4194357,
	KEY_F27 : 4194358,
	KEY_F28 : 4194359,
	KEY_F29 : 4194360,
	KEY_F30 : 4194361,
	KEY_F31 : 4194362,
	KEY_F32 : 4194363,
	KEY_F33 : 4194364,
	KEY_F34 : 4194365,
	KEY_F35 : 4194366,
	KEY_KP_MULTIPLY : 4194433,
	KEY_KP_DIVIDE : 4194434,
	KEY_KP_SUBTRACT : 4194435,
	KEY_KP_PERIOD : 4194436,
	KEY_KP_ADD : 4194437,
	KEY_KP_0 : 4194438,
	KEY_KP_1 : 4194439,
	KEY_KP_2 : 4194440,
	KEY_KP_3 : 4194441,
	KEY_KP_4 : 4194442,
	KEY_KP_5 : 4194443,
	KEY_KP_6 : 4194444,
	KEY_KP_7 : 4194445,
	KEY_KP_8 : 4194446,
	KEY_KP_9 : 4194447,
	KEY_MENU : 4194370,
	KEY_HYPER : 4194371,
	KEY_HELP : 4194373,
	KEY_BACK : 4194376,
	KEY_FORWARD : 4194377,
	KEY_STOP : 4194378,
	KEY_REFRESH : 4194379,
	KEY_VOLUMEDOWN : 4194380,
	KEY_VOLUMEMUTE : 4194381,
	KEY_VOLUMEUP : 4194382,
	KEY_MEDIAPLAY : 4194388,
	KEY_MEDIASTOP : 4194389,
	KEY_MEDIAPREVIOUS : 4194390,
	KEY_MEDIANEXT : 4194391,
	KEY_MEDIARECORD : 4194392,
	KEY_HOMEPAGE : 4194393,
	KEY_FAVORITES : 4194394,
	KEY_SEARCH : 4194395,
	KEY_STANDBY : 4194396,
	KEY_OPENURL : 4194397,
	KEY_LAUNCHMAIL : 4194398,
	KEY_LAUNCHMEDIA : 4194399,
	KEY_LAUNCH0 : 4194400,
	KEY_LAUNCH1 : 4194401,
	KEY_LAUNCH2 : 4194402,
	KEY_LAUNCH3 : 4194403,
	KEY_LAUNCH4 : 4194404,
	KEY_LAUNCH5 : 4194405,
	KEY_LAUNCH6 : 4194406,
	KEY_LAUNCH7 : 4194407,
	KEY_LAUNCH8 : 4194408,
	KEY_LAUNCH9 : 4194409,
	KEY_LAUNCHA : 4194410,
	KEY_LAUNCHB : 4194411,
	KEY_LAUNCHC : 4194412,
	KEY_LAUNCHD : 4194413,
	KEY_LAUNCHE : 4194414,
	KEY_LAUNCHF : 4194415,
	KEY_GLOBE : 4194416,
	KEY_KEYBOARD : 4194417,
	KEY_JIS_EISU : 4194418,
	KEY_JIS_KANA : 4194419,
	KEY_UNKNOWN : 8388607,
	KEY_SPACE : 32,
	KEY_EXCLAM : 33,
	KEY_QUOTEDBL : 34,
	KEY_NUMBERSIGN : 35,
	KEY_DOLLAR : 36,
	KEY_PERCENT : 37,
	KEY_AMPERSAND : 38,
	KEY_APOSTROPHE : 39,
	KEY_PARENLEFT : 40,
	KEY_PARENRIGHT : 41,
	KEY_ASTERISK : 42,
	KEY_PLUS : 43,
	KEY_COMMA : 44,
	KEY_MINUS : 45,
	KEY_PERIOD : Key_Codes.VK_OEM_PERIOD,
	#KEY_SLASH : Key_Codes.,
	KEY_0 : 48,
	KEY_1 : 49,
	KEY_2 : 50,
	KEY_3 : 51,
	KEY_4 : 52,
	KEY_5 : 53,
	KEY_6 : 54,
	KEY_7 : 55,
	KEY_8 : 56,
	KEY_9 : 57,
	KEY_COLON : 58,
	KEY_SEMICOLON : 59,
	KEY_LESS : 60,
	KEY_EQUAL : 61,
	KEY_GREATER : 62,
	KEY_QUESTION : 63,
	KEY_AT : 64,
	KEY_A : 65,
	KEY_B : 66,
	KEY_C : 67,
	KEY_D : 68,
	KEY_E : 69,
	KEY_F : 70,
	KEY_G : 71,
	KEY_H : 72,
	KEY_I : 73,
	KEY_J : 74,
	KEY_K : 75,
	KEY_L : 76,
	KEY_M : 77,
	KEY_N : 78,
	KEY_O : 79,
	KEY_P : 80,
	KEY_Q : 81,
	KEY_R : 82,
	KEY_S : 83,
	KEY_T : 84,
	KEY_U : 85,
	KEY_V : 86,
	KEY_W : 87,
	KEY_X : 88,
	KEY_Y : 89,
	KEY_Z : 90,
	KEY_BRACKETLEFT : 91,
	KEY_BACKSLASH : 92,
	KEY_BRACKETRIGHT : 93,
	KEY_ASCIICIRCUM : 94,
	KEY_UNDERSCORE : 95,
	KEY_QUOTELEFT : 96,
	KEY_BRACELEFT : 123,
	KEY_BAR : 124,
	KEY_BRACERIGHT : 125,
	KEY_ASCIITILDE : 126,
	KEY_YEN : 165,
	KEY_SECTION : 167,

}
