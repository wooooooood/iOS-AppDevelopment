# PerformSelectorAfterDelay
- after `double` seconds delay, performs action
- difference with `Timer`: `Timer` is repeatable, `PerformSelector` performs only **once**

#### Examples
- this works
> https://docs.microsoft.com/en-us/dotnet/api/foundation.nsobject.performselector?view=xamarin-ios-sdk-12#Foundation_NSObject_PerformSelector_ObjCRuntime_Selector_Foundation_NSObject_System_Double_
```cs
public override bool FinishedLaunching (UIApplication app, NSDictionary options)
{
	window = new UIWindow (UIScreen.MainScreen.Bounds);
	window.MakeKeyAndVisible ();
	// Invoke our method in 10 seconds
	PerformSelector (new MonoTouch.ObjCRuntime.Selector ("demo:"), new NSString ("hello world"), 10);
	return true;
}
// This registers the method "RunDemo" as responding to the selector "demo:"
[Export ("demo:")]
void RunDemo (NSString arg)
{
	Console.WriteLine ("This is the parameter I got {0}", arg);
}
``` 

- this also works
```cs
public override bool FinishedLaunching(UIApplication app, NSDictionary options)
{
    global::Xamarin.Forms.Forms.SetFlags("CollectionView_Experimental");
    global::Xamarin.Forms.Forms.Init();
    LoadApplication(new App());

    PerformSelector(new ObjCRuntime.Selector("demo:"), new NSString("hello world"), 10);

    return base.FinishedLaunching(app, options);
}

[Export("demo:")]
void RunDemo(NSString arg)
{
    Console.WriteLine("This is the parameter I got {0}", arg);
}
```

- this works too (using `class`)
```cs
public override bool FinishedLaunching(UIApplication app, NSDictionary options)
{
    global::Xamarin.Forms.Forms.SetFlags("CollectionView_Experimental");
    global::Xamarin.Forms.Forms.Init();
    LoadApplication(new App());

    var target2 = new Target2();
    target2.PerformSelector(new ObjCRuntime.Selector("Test2:"), new NSString("hello world"), 10);

    return base.FinishedLaunching(app, options);
}

[Register("Target2")]
public class Target2 : NSObject
{
    public Target2() : base(NSObjectFlag.Empty) { }

    [Export("Test2:")]
    void Test2(NSString arg)
    {
        Console.WriteLine("Test2 WithData" + arg);
    }
}
```
