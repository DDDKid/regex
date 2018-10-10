# regex

### usage

```swift
extension Regex {
    static let pureDigital: Regex = "^\\d*$"
    static let pureLetter: Regex = "^[a-zA-Z]*$"
}

var value = "ABC"

if value == Regex.pureDigital {
    print("value pass")
} else {
    print("value failure")
}
if Regex.pureDigital == value {
    print("value pass")
} else {
    print("value failure")
}

if value --> Regex.pureDigital {
    print("value pass")
} else {
    print("value failure")
}
if Regex.pureDigital --> value {
    print("value pass")
} else {
    print("value failure")
}

switch value {
case Regex.pureDigital:
    print("pureDigital pass")
case Regex.pureLetter:
    print("pureLetter pass")
default:
    print("no pass")
}
```
