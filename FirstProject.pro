TEMPLATE = app
CONFIG -= console
CONFIG -= app_bundle
CONFIG -= qt
CONFIG +=  c++11

QMAKE_CFLAGS_RELEASE -= /MD
QMAKE_CXXFLAGS_RELEASE -= /MD

#QMAKE_LIBS_QT_ENTRY -= -lqtmain

QMAKE_CFLAGS_RELEASE += /MT
#QMAKE_CXXFLAGS_RELEASE = /MT


TARGET = Spline

#This might be an overkill but I just added all of them as I saw them in the pkgconfig file
#it is for a release build with static library linkage and having angelscript enabled
DEFINES += WIN32 _WINDOWS NDEBUG _SECURE_SCL=0 ENABLE_SSE ENABLE_MINIDUMPS;
DEFINES += ENABLE_FILEWATCHER ENABLE_PROFILING ENABLE_LOGGING #ENABLE_ANGELSCRIPT
DEFINES += _CRT_SECURE_NO_WARNINGS HAVE_STDINT_H


# $(URHO_HOME) should point to your Urho3D installation folder
#URHO_HOME = D:\Urho3D\install
INCLUDEPATH += D:\Urho3D\install\include D:\Urho3D\install\include\Urho3D\ThirdParty
message($$INCLUDEPATH)


#If you wish you can add these ones depending on your needs
# INCLUDEPATH += $(URHO_HOME)\include\Bullet $(URHO_HOME)\include\Direct3D9 $(URHO_HOME)\include\kNet


#$(DIRECTX_SDK) = where your directX sdk is installed for Windows and don't forget to replace x86 with x64 for those on x64 systems
LIBS += -LD:\Urho3D\install\lib   -lUrho3D  # "$(DIRECTX_SDK) \Lib\x86\d3d9.lib"

#Then these guys, every single one of them seems to be needed on Windows
LIBS += kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib
LIBS += dbghelp.lib imm32.lib version.lib winmm.lib ws2_32.lib d3dcompiler.lib d3d11.lib dxgi.lib dxguid.lib

SOURCES += main.cpp
