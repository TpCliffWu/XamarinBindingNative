using BindingNative.iOS;
using Foundation;
using MagicTooliOS;
using Xamarin.Forms;

namespace BindingNative.iOS
{
    public class ExtensionService
    {
        public MagicTool mg;

        public ExtensionService()
        {
            mg = new MagicTool();
        }
        public string GeneratePublicKey(string guid)
        {
            return mg.GeneratePublicKeyWithGuid(guid);
        }

    }
}
