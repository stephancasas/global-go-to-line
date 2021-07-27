set appname to path to frontmost application as Unicode text

tell application appname to set lineno to text returned of (display dialog "Go to line:" default answer "0")

tell application "System Events"
	if appname contains "FileMaker" then
		key code 126 using {option down}
	else
		key code 126 using {command down}
	end if
	if lineno is not equal to "0" then
		repeat ((lineno as number) - 1) times
			key code 125
		end repeat
	end if
end tell