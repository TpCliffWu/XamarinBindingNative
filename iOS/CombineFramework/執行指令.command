FrameworkProjectName=MagicTool;

Echo ====== 合併Framework ====== 
		
cd $(dirname $0)
				
cp -R "Release-iphoneos" "Release-fat"
		
cp -R "Release-iphonesimulator/$FrameworkProjectName.framework/Modules/$FrameworkProjectName.swiftmodule/" "Release-fat/$FrameworkProjectName.framework/Modules/$FrameworkProjectName.swiftmodule/"
		
lipo -create -output "Release-fat/$FrameworkProjectName.framework/$FrameworkProjectName" "Release-iphoneos/$FrameworkProjectName.framework/$FrameworkProjectName" "Release-iphonesimulator/$FrameworkProjectName.framework/$FrameworkProjectName"
				
Echo ====== 合併結束====== 

lipo -info "Release-fat/$FrameworkProjectName.framework/$FrameworkProjectName"

		
		
	
		 sharpie -v
		
echo =====產生中繼層======
		
sharpie bind --sdk=iphoneos14.4 --output="XamarinApiDef" --namespace="Binding" --scope="Release-fat/$FrameworkProjectName.framework/Headers/" "Release-fat/$FrameworkProjectName.framework/Headers/$FrameworkProjectName-Swift.h"
		 
		
