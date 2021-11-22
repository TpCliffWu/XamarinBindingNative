using System;

using ObjCRuntime;
using Foundation;
using UIKit;

namespace MagicTooliOS
{
	// @interface MagicTool : NSObject
	[BaseType(typeof(NSObject), Name = "_TtC9MagicTool9MagicTool")]
	interface MagicTool
	{
		// -(NSString * _Nonnull)GeneratePublicKeyWithGuid:(NSString * _Nonnull)guid __attribute__((warn_unused_result("")));
		[Export("GeneratePublicKeyWithGuid:")]
		string GeneratePublicKeyWithGuid(string guid);

		// -(NSString * _Nonnull)SignWithGuid:(NSString * _Nonnull)guid plainText:(NSString * _Nonnull)plainText __attribute__((warn_unused_result("")));
		[Export("SignWithGuid:plainText:")]
		string SignWithGuid(string guid, string plainText);

		// -(BOOL)VerifySignWithGuid:(NSString * _Nonnull)guid plainText:(NSString * _Nonnull)plainText signText:(NSString * _Nonnull)signText __attribute__((warn_unused_result("")));
		[Export("VerifySignWithGuid:plainText:signText:")]
		bool VerifySignWithGuid(string guid, string plainText, string signText);

		// -(UIImage * _Nullable)GenerateQRcodeWithRecipientID:(NSString * _Nonnull)recipientID dn:(NSString * _Nonnull)dn won:(NSString * _Nonnull)won __attribute__((warn_unused_result("")));
		[Export("GenerateQRcodeWithRecipientID:dn:won:")]
		[return: NullAllowed]
		UIImage GenerateQRcodeWithRecipientID(string recipientID, string dn, string won);

		// -(UIImage * _Nullable)GenerateQRcodeWithRecipientID:(NSString * _Nonnull)recipientID dn:(NSString * _Nonnull)dn won:(NSString * _Nonnull)won cvc:(NSString * _Nonnull)cvc __attribute__((warn_unused_result("")));
		[Export("GenerateQRcodeWithRecipientID:dn:won:cvc:")]
		[return: NullAllowed]
		UIImage GenerateQRcodeWithRecipientID(string recipientID, string dn, string won, string cvc);

		// -(UIImage * _Nullable)GenerateQRcodeWithRecipientID:(NSString * _Nonnull)recipientID dn:(NSString * _Nonnull)dn won:(NSString * _Nonnull)won amount:(NSInteger)amount __attribute__((warn_unused_result("")));
		[Export("GenerateQRcodeWithRecipientID:dn:won:amount:")]
		[return: NullAllowed]
		UIImage GenerateQRcodeWithRecipientID(string recipientID, string dn, string won, nint amount);

		// -(UIImage * _Nullable)GenerateQRcodeWithRecipientID:(NSString * _Nonnull)recipientID dn:(NSString * _Nonnull)dn won:(NSString * _Nonnull)won cvc:(NSString * _Nonnull)cvc amount:(NSInteger)amount __attribute__((warn_unused_result("")));
		[Export("GenerateQRcodeWithRecipientID:dn:won:cvc:amount:")]
		[return: NullAllowed]
		UIImage GenerateQRcodeWithRecipientID(string recipientID, string dn, string won, string cvc, nint amount);

		// -(UIImage * _Nullable)GenerateQRcodeWithQrcodeString:(NSString * _Nonnull)qrcodeString __attribute__((warn_unused_result("")));
		[Export("GenerateQRcodeWithQrcodeString:")]
		[return: NullAllowed]
		UIImage GenerateQRcodeWithQrcodeString(string qrcodeString);

		// -(void)SaveHMACKeyWithGuid:(NSString * _Nonnull)guid HMACKey:(NSString * _Nonnull)HMACKey;
		[Export("SaveHMACKeyWithGuid:HMACKey:")]
		void SaveHMACKeyWithGuid(string guid, string HMACKey);

		// -(BOOL)SaveHMACKeyCheckWithGuid:(NSString * _Nonnull)guid __attribute__((warn_unused_result("")));
		[Export("SaveHMACKeyCheckWithGuid:")]
		bool SaveHMACKeyCheckWithGuid(string guid);

		// -(NSString * _Nonnull)SaveHMACKeyGetWithGuid:(NSString * _Nonnull)guid __attribute__((warn_unused_result("")));
		[Export("SaveHMACKeyGetWithGuid:")]
		string SaveHMACKeyGetWithGuid(string guid);

		// -(NSString * _Nonnull)OfflineBarcodeWithGuid:(NSString * _Nonnull)guid cvc:(NSString * _Nonnull)cvc walletId:(NSString * _Nonnull)walletId __attribute__((warn_unused_result("")));
		[Export("OfflineBarcodeWithGuid:cvc:walletId:")]
		string OfflineBarcodeWithGuid(string guid, string cvc, string walletId);

		// -(NSString * _Nonnull)NumberOTPWithGuid:(NSString * _Nonnull)guid cvc:(NSString * _Nonnull)cvc payableNumber:(NSString * _Nonnull)payableNumber amount:(NSString * _Nonnull)amount __attribute__((warn_unused_result("")));
		[Export("NumberOTPWithGuid:cvc:payableNumber:amount:")]
		string NumberOTPWithGuid(string guid, string cvc, string payableNumber, string amount);

		// -(NSString * _Nonnull)DecryptWithGuid:(NSString * _Nonnull)guid encryptData:(NSString * _Nonnull)encryptData publicKey:(NSString * _Nonnull)publicKey __attribute__((warn_unused_result("")));
		[Export("DecryptWithGuid:encryptData:publicKey:")]
		string DecryptWithGuid(string guid, string encryptData, string publicKey);
	}
}