# global-go-to-line
 
 Implemented as a macOS service/quick action, or called from peripheral devices like [Elgato's StreamDeck](https://www.elgato.com/en/stream-deck), global-go-to-line enables the "go/jump to line" feature found in code editors like [Microsoft's Visual Studio Code](https://code.visualstudio.com) for all line-based editing applications.

## Why?

Because I hate clicking things, and I don't want carpal tunnel syndrome before I turn thirty.

## How?

The script is the functional equivalent of moving the cursor to the head position, and then repeatedly striking the <kbd>↓</kbd> key the specified number of times.

---

<p align="center"><br></p>

<p align="center"><img src="https://get.stephancasas.com/static/go-to-line--fm.gif" width="45%"> &nbsp; &nbsp; <img src="https://get.stephancasas.com/static/go-to-line--runjs.gif" width="45%"></p>

<p align="center"><br></p>

---
## Install (as service/quick action)

1. Copy the `Go To Line.workflow` file into your user services directory:

```plaintext
~/Library/Services/
```

2. In **System Preferences**, navigate to _Security and Privacy_ → _Privacy_ → _Accessibility_ and use the :heavy_plus_sign: button to grant the following three files permissions:

```plaintext
 - /System/Library/CoreServices/AppleScript Utility.app
 - /System/Applications/Automator.app
 - /System/Applications/Utilities/Script Editor.app
```

3. In **System Preferences**, navigate to _Keyboard_ → _Shortcuts_ → _App Shortcuts_, use the :heavy_plus_sign: button to declare a new keyboard shortcut for the menu item `"Go to Line"`.
  
    * You may define the shortcut globbaly, if you wish, but if you don't want it to override the default behavior of an app which already has *Go to line* functionality, you should either declare a different key combination, or scope the shortcut only to those apps in which you want functionality.

## Install (as StreamDeck action)

If you wish to use the service as a StreamDeck action, install the [OSAScript Plugin](https://github.com/gabrielperales/streamdeck-osascript), and then paste the contents of `go-to-line.applescript` into the text field.

---

## App Idiosyncracies

Though most line-based editors use the <kbd>Command</kbd> + <kbd>↑</kbd> key combination to move the cursor to the first line, some do not. To compensate for this, you may consider adding conditional statements to the AppleScript source such that the key sent key codes correspond correctly to the application's UI. In the given files, an example is provided for the FileMaker application, which uses the key combination <kbd>Option</kbd> + <kbd>↑</kbd> to move the cursor:

```applescript
if appname contains "FileMaker" then
  key code 126 using {option down}
else
  key code 126 using {command down}
end if
```

Should you decide to do this, keep in mind that AppleScript string comparisons are **case-sensitive**, and because AppleScript sucks, case shifting is not an easily-accomplished task.

## Electron Apps

Some Electron apps, like [RunJS](https://runjs.app), capture all HID input when the text editor is focused. For this reason, you may be unable to define additional shortcut keys for the application. In these cases, the StreamDeck installation/setup works quite well.

## Text Wrapping

Applications which offer text wrapping may not position the cursor on the exact line you specify. This is, of course, because the wrapped text adds additional lines for the cursor to traverse.

---

## A Note From the Developer

I hate AppleScript.

---

## License

MIT — "Hell yeah, free software!"