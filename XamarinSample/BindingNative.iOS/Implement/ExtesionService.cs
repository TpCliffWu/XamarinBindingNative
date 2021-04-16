using BindingNative.iOS;
using Foundation;
using MagicTooliOS;
using Xamarin.Forms;


[assembly: Dependency(typeof(ExtensionService))]
namespace BindingNative.iOS
{
    public class ExtensionService : IExtensionService
    {
        public string FunctionGetString()
        {

            var magic = new MagicTool();


            return magic.GetString;
        }

        public int SumArray(int[] intArray)
        {
            var magic = new MagicTool();


            var nsArray = new NSNumber[intArray.Length];
            for(int i = 0; i <= intArray.Length - 1; i++)
            {
                nsArray[i] =(NSNumber) intArray[i];
            }

            var sum = (int)magic.MathIntAdditionWithIntArray(nsArray);

            return sum;
        }

        public string ToBase64(string str)
        {
            var magic = new MagicTool();
            return magic.StringToBase64WithStr(str);
        }
    }
}
