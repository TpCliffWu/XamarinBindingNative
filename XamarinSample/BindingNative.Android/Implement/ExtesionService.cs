using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using BindingNative.Droid;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Xamarin.Forms;
using TP.Example.Magictoollibrary;

[assembly: Dependency(typeof(ExtensionService))]
namespace BindingNative.Droid
{
    public class ExtensionService : IExtensionService
    {
        public string FunctionGetString()
        {
            var magic = new MagicTool();

            return magic.String;
        }

        public int SumArray(int[] intArray)
        {
            var magic = new MagicTool();
            return magic.MathIntAdditionWithIntArray(intArray);
        }

        public string ToBase64(string str)
        {
            var magic = new MagicTool();
            return magic.StringToBase64WithStr(str);
        }
    }
}