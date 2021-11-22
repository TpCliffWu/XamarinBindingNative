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
	}
}