using System;
using System.Windows.Input;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace BindingNative.ViewModels
{
    public class AboutViewModel : BaseViewModel
    {
        public AboutViewModel()
        {
            Title = "About";
            OpenWebCommand = new Command(async () => await Browser.OpenAsync("https://aka.ms/xamarin-quickstart"));

            ShowText = extensionService.FunctionGetString();

            var intArray = new int[] { 1, 2, 3, 4, 5 };
            ShowNumberOfSum = extensionService.SumArray(intArray).ToString();

            ShowBase64 = extensionService.ToBase64(this.ShowText);
        }

        public ICommand OpenWebCommand { get; }


        public string ShowText { get; set; }

        public string ShowNumberOfSum { get; set; }

        public string ShowBase64 { get; set; }
    }
}