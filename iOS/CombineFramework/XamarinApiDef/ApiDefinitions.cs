using Foundation;

namespace Binding
{
	// @interface MagicTool : NSObject
	[BaseType (typeof(NSObject), Name = "_TtC9MagicTool9MagicTool")]
	interface MagicTool
	{
		// -(NSString * _Nonnull)GeneratePublicKeyWithGuid:(NSString * _Nonnull)guid __attribute__((warn_unused_result("")));
		[Export ("GeneratePublicKeyWithGuid:")]
		string GeneratePublicKeyWithGuid (string guid);

		// -(NSString * _Nonnull)SignWithGuid:(NSString * _Nonnull)guid plainText:(NSString * _Nonnull)plainText __attribute__((warn_unused_result("")));
		[Export ("SignWithGuid:plainText:")]
		string SignWithGuid (string guid, string plainText);

		// -(BOOL)VerifySignWithGuid:(NSString * _Nonnull)guid plainText:(NSString * _Nonnull)plainText signText:(NSString * _Nonnull)signText __attribute__((warn_unused_result("")));
		[Export ("VerifySignWithGuid:plainText:signText:")]
		bool VerifySignWithGuid (string guid, string plainText, string signText);
	}
}
