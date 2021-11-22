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


        public string OfflineBarcode(string guid, string cvc, string walletId)
        {
            return mg.OfflineBarcodeWithGuid(guid, cvc, walletId);
        }

        public string GeneratePublicKey(string guid)
        {
            return mg.GeneratePublicKeyWithGuid(guid);
        }

    }
}
