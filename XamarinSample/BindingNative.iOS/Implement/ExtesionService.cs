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

        public string Sign(string guid, string plainText)
        {
            var mg = new MagicTool();
            return mg.SignWithGuid(guid, plainText);
        }
        public bool VerifySign(string guid, string plainText, string signText)
        {
            var mg = new MagicTool();
            return mg.VerifySignWithGuid(guid, plainText, signText);
        }

    }
}
