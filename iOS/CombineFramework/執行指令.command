FrameworkProjectName=MagicTool;



Echo ====== 合併Framework ======;
		
cd $(dirname $0);
				
cp -R "Release-iphoneos" "Release-fat";
		
cp -R "Release-iphonesimulator/$FrameworkProjectName.framework/Modules/$FrameworkProjectName.swiftmodule/" "Release-fat/$FrameworkProjectName.framework/Modules/$FrameworkProjectName.swiftmodule/";
		
lipo -create -output "Release-fat/$FrameworkProjectName.framework/$FrameworkProjectName" "Release-iphoneos/$FrameworkProjectName.framework/$FrameworkProjectName" "Release-iphonesimulator/$FrameworkProjectName.framework/$FrameworkProjectName";
				
Echo ====== 合併結束======;

lipo "Release-fat/$FrameworkProjectName.framework/$FrameworkProjectName" -info;

		
Echo =====確認安裝object sharpie======;		
	
		 sharpie -v;
		
Echo =====產生中繼層======;
		
sharpie bind --sdk=iphoneos13.2 --output="XamarinApiDef" --namespace="Binding" --scope="Release-fat/MagicTool.framework/Headers/" "Release-fat/MagicTool.framework/Headers/MagicTool-Swift.h"
		 
		
