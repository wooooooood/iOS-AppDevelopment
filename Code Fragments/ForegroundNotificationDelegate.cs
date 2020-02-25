//https://forums.xamarin.com/discussion/128350/xamarin-ios-notifications-how-to-turn-shouldalwaysalertwhileappisforeground-to-yes

[Export("userNotificationCenter:willPresentNotification:withCompletionHandler:")]
public void WillPresentNotification(UNUserNotificationCenter center, UNNotification notification, 
Action<UNNotificationPresentationOptions> completionHandler)
{
    //multiple options
    completionHandler(UNNotificationPresentationOptions.Sound | UNNotificationPresentationOptions.Alert);
    
    //single option
    //completionHandler(UNNotificationPresentationOptions.Alert);
}
