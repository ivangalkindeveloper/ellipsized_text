# Ellipsized Text
✏️ The package provides a one line ellipsized text with the ability to adjust the position of the ellipsis.\
A very handy widget for shortening public addresses of crypto wallets or other information abbreviations.

<div align="center">

  <a href="">![Pub Likes](https://img.shields.io/pub/likes/ellipsized_text?color=success)</a>
  <a href="">![Pub Version](https://img.shields.io/pub/v/ellipsized_text?color=important)</a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>

</div>

<div align="center">
  <a href="https://www.buymeacoffee.com/ivangalkin" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="32px" width= "128px"></a>
</div>

## Usage
The widget is easy to use:
Start position:
```dart
EllipsizedText(
    "Ellipsized Text Ellipsized Text Ellipsized Text Ellipsized Text",
    type: EllipsisType.start,
    style: TextStyle(fontSize: 24),
),
```
![](https://github.com/ivangalkindeveloper/ellipsized_text/blob/master/images/ellipsized_text_start.png)

Middle position:
```dart
EllipsizedText(
    "Ellipsized Text Ellipsized Text Ellipsized Text Ellipsized Text",
    type: EllipsisType.middle,
    style: TextStyle(fontSize: 24),
),
```
![](https://github.com/ivangalkindeveloper/ellipsized_text/blob/master/images/ellipsized_text_middle.png)

End position:
```dart
EllipsizedText(
    "Ellipsized Text Ellipsized Text Ellipsized Text Ellipsized Text",
    type: EllipsisType.end,
    style: TextStyle(fontSize: 24),
),
```
![](https://github.com/ivangalkindeveloper/ellipsized_text/blob/master/images/ellipsized_text_end.png)

## Additional Information
For more details see example project.\
And feel free to open an issue if you find any bugs or errors or suggestions.
