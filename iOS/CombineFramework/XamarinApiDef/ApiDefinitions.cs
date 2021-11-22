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
	}
}
