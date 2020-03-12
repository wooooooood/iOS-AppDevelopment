# Picker

### .xaml

```
<ContentPage ...
             xmlns:iOSSpecific="clr-namespace:Xamarin.Forms.PlatformConfiguration.iOSSpecific;assembly=Xamarin.Forms.Core"
             ... >
...

<Picker Title="SomePicker"
        ItemsSource="{Binding PickerList}"
        SelectedIndexChanged="OnSomePickerIndexChanged"
        iOSSpecific:Picker.UpdateMode="WhenFinished">
</Picker>
```

- Picker Title change after clicking **Done**: `iOSSpecific:Picker.UpdateMode="WhenFinished"`
