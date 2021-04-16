using System;
using Foundation;

namespace Binding
{
	// @interface MagicTool : NSObject
	[BaseType (typeof(NSObject))]
	interface MagicTool
	{
		// -(NSString * _Nonnull)GetString __attribute__((warn_unused_result("")));
		[Export ("GetString")]
		[Verify (MethodToProperty)]
		string String { get; }

		// -(NSInteger)MathIntAdditionWithIntArray:(NSArray<NSNumber *> * _Nonnull)intArray __attribute__((warn_unused_result("")));
		[Export ("MathIntAdditionWithIntArray:")]
		nint MathIntAdditionWithIntArray (NSNumber[] intArray);

		// -(NSString * _Nonnull)StringToBase64WithStr:(NSString * _Nonnull)str __attribute__((warn_unused_result("")));
		[Export ("StringToBase64WithStr:")]
		string StringToBase64WithStr (string str);
	}
}
