public void ShowWelcomePopup()
{
    var alert = UIAlertController.Create("Look,", "Launching this missile will destroy the entire universe. Is this what you intended to do?", UIAlertControllerStyle.Alert);
    alert.AddAction(UIAlertAction.Create("Hmm", UIAlertActionStyle.Default, async action =>
    {
        //What is your default action?
    }));
    alert.AddAction(UIAlertAction.Create("BLOW", UIAlertActionStyle.Destructive, action =>
    {
        //Blow EVERYTHING
    }));
    alert.AddAction(UIAlertAction.Create("Cancel", UIAlertActionStyle.Cancel, null));

    UIApplication.SharedApplication.KeyWindow.RootViewController.PresentViewController(alert, true, null);
}
