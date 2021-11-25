# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.CGL.Debug:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/Debug/libCGL.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/Debug/libCGL.a


PostBuild.glew.Debug:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/Debug/libglew.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/Debug/libglew.a


PostBuild.glfw.Debug:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/Debug/libglfw3.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/Debug/libglfw3.a


PostBuild.pathtracer.Debug:
PostBuild.CGL.Debug: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/Debug/pathtracer
PostBuild.glew.Debug: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/Debug/pathtracer
PostBuild.glfw.Debug: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/Debug/pathtracer
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/Debug/pathtracer:\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/Debug/libCGL.a\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/usr/local/lib/libfreetype.dylib\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/Debug/libglew.a\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/Debug/libglfw3.a\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/Debug/pathtracer


PostBuild.CGL.Release:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/Release/libCGL.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/Release/libCGL.a


PostBuild.glew.Release:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/Release/libglew.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/Release/libglew.a


PostBuild.glfw.Release:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/Release/libglfw3.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/Release/libglfw3.a


PostBuild.pathtracer.Release:
PostBuild.CGL.Release: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/Release/pathtracer
PostBuild.glew.Release: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/Release/pathtracer
PostBuild.glfw.Release: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/Release/pathtracer
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/Release/pathtracer:\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/Release/libCGL.a\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/usr/local/lib/libfreetype.dylib\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/Release/libglew.a\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/Release/libglfw3.a\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/Release/pathtracer


PostBuild.CGL.MinSizeRel:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/MinSizeRel/libCGL.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/MinSizeRel/libCGL.a


PostBuild.glew.MinSizeRel:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/MinSizeRel/libglew.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/MinSizeRel/libglew.a


PostBuild.glfw.MinSizeRel:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/MinSizeRel/libglfw3.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/MinSizeRel/libglfw3.a


PostBuild.pathtracer.MinSizeRel:
PostBuild.CGL.MinSizeRel: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/MinSizeRel/pathtracer
PostBuild.glew.MinSizeRel: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/MinSizeRel/pathtracer
PostBuild.glfw.MinSizeRel: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/MinSizeRel/pathtracer
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/MinSizeRel/pathtracer:\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/MinSizeRel/libCGL.a\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/usr/local/lib/libfreetype.dylib\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/MinSizeRel/libglew.a\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/MinSizeRel/libglfw3.a\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/MinSizeRel/pathtracer


PostBuild.CGL.RelWithDebInfo:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/RelWithDebInfo/libCGL.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/RelWithDebInfo/libCGL.a


PostBuild.glew.RelWithDebInfo:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/RelWithDebInfo/libglew.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/RelWithDebInfo/libglew.a


PostBuild.glfw.RelWithDebInfo:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a:
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a


PostBuild.pathtracer.RelWithDebInfo:
PostBuild.CGL.RelWithDebInfo: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/RelWithDebInfo/pathtracer
PostBuild.glew.RelWithDebInfo: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/RelWithDebInfo/pathtracer
PostBuild.glfw.RelWithDebInfo: /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/RelWithDebInfo/pathtracer
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/RelWithDebInfo/pathtracer:\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/RelWithDebInfo/libCGL.a\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/usr/local/lib/libfreetype.dylib\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/RelWithDebInfo/libglew.a\
	/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd\
	/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd
	/bin/rm -f /Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/RelWithDebInfo/pathtracer




# For each target create a dummy ruleso the target does not have to exist
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/OpenGL.framework/OpenGL.tbd:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/Debug/libCGL.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/MinSizeRel/libCGL.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/RelWithDebInfo/libCGL.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/Release/libCGL.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/Debug/libglew.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/MinSizeRel/libglew.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/RelWithDebInfo/libglew.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glew/Release/libglew.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/Debug/libglfw3.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/MinSizeRel/libglfw3.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/RelWithDebInfo/libglfw3.a:
/Users/max/Desktop/cs284/p3-1-pathtracer-sp20-MaxTang233/build/CGL/deps/glfw/src/Release/libglfw3.a:
/usr/local/lib/libfreetype.dylib:
