# Safe area

### Using Safe area

**Common: .xaml**
```
<ContentPage ...
     xmlns:iOS="clr-namespace:Xamarin.Forms.PlatformConfiguration.iOSSpecific;assembly=Xamarin.Forms.Core"
     iOS:Page.UseSafeArea="true">
 ```

### Get Safe area size

**Platform Specific: .cs**
```cs
var safeAreaInsets = UIApplication.SharedApplication.KeyWindow.SafeAreaInsets;
```
