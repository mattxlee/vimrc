# Copyright (C) 2014 Google Inc.
#
# This file is part of ycmd.
#
# ycmd is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ycmd is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with ycmd.  If not, see <http://www.gnu.org/licenses/>.

import os
import ycm_core

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
    '-Wall',
    # '-Wextra',
    # '-Werror',
    '-fexceptions',
    '-DDEBUG',
    # '-DHAVE_CONFIG_H',
    # THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
    # language to use when compiling headers. So it will guess. Badly. So C++
    # headers will be compiled as C headers. You don't want that so ALWAYS specify
    # a "-std=<something>".
    # For a C project, you would set this to something like 'c99' instead of
    # 'c++11'.
    '-std=c++17',
    '-stdlib=libc++',
    # ...and the same thing goes for the magic -x option which specifies the
    # language that the files to be compiled are written in. This is mostly
    # relevant for c++ headers.
    # For a C project, you would set this to 'c' instead of 'c++'.
    '-x', 'c++',

    # For C++ header files in Linux operating system.
    '-isystem', '/usr/include/c++/5/',
    '-isystem', '/usr/include/x86_64-linux-gnu/c++/5/',
    '-isystem', '/usr/include/c++/6/',
    '-isystem', '/usr/include/x86_64-linux-gnu/c++/6/',
    '-isystem', '/usr/include/c++/7/',
    '-isystem', '/usr/include/x86_64-linux-gnu/c++/7/',

    # For Common headers.
    '-isystem', '/usr/include',
    '-isystem', '/usr/local/include',
    '-isystem', '/usr/local/opt/llvm/include/c++/v1',

    # For MacOS system headers.
    '-sysroot', '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk',
    '-isystem', '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include',
    '-isystem', '/System/Library/Frameworks/Python.framework/Headers',

    # OpenSSL headers
    '-isystem', '/usr/local/opt/openssl/include',

    # For SQLite3
    '-system', '/usr/local/opt/sqlite/include',

    # For wxWidgets.
    '-isystem', '/usr/local/lib/wx/include/osx_cocoa-unicode-3.0',
    '-isystem', '/usr/local/include/wx-3.0',
    '-isystem', '/usr/local/lib/wx/include/osx_cocoa-unicode-3.1',
    '-isystem', '/usr/local/include/wx-3.1',
    '-D_FILE_OFFSET_BITS=64',
    '-DWXUSINGDLL',
    '-D__WXMAC__',
    '-D__WXOSX__',
    '-D__WXOSX_COCOA__',

    # For Qt
    '-DQT_CORE_LIB',
    '-DQT_GUI_LIB',
    '-DQT_NETWORK_LIB',
    '-DQT_QML_LIB',
    '-DQT_QUICK_LIB',
    '-DQT_SQL_LIB',
    '-DQT_WIDGETS_LIB',
    '-DQT_XML_LIB',
    '-isystem', '/usr/local/opt/qt/include',
    '-isystem', '/usr/local/opt/qt/include/QtCore',
    '-isystem', '/usr/local/opt/qt/include/QtWidgets',
    '-isystem', '/usr/local/opt/qt/include/QtGui',
    '-isystem', '/usr/local/opt/qt/include/QtAccessibilitySupport',
    '-isystem', '/usr/local/opt/qt/include/QtBluetooth',
    '-isystem', '/usr/local/opt/qt/include/QtBodymovin',
    '-isystem', '/usr/local/opt/qt/include/QtCharts',
    '-isystem', '/usr/local/opt/qt/include/QtClipboardSupport',
    '-isystem', '/usr/local/opt/qt/include/QtConcurrent',
    '-isystem', '/usr/local/opt/qt/include/QtDBus',
    '-isystem', '/usr/local/opt/qt/include/QtDataVisualization',
    '-isystem', '/usr/local/opt/qt/include/QtDesigner',
    '-isystem', '/usr/local/opt/qt/include/QtDesignerComponents',
    '-isystem', '/usr/local/opt/qt/include/QtDeviceDiscoverySupport',
    '-isystem', '/usr/local/opt/qt/include/QtEdidSupport',
    '-isystem', '/usr/local/opt/qt/include/QtEventDispatcherSupport',
    '-isystem', '/usr/local/opt/qt/include/QtFbSupport',
    '-isystem', '/usr/local/opt/qt/include/QtFontDatabaseSupport',
    '-isystem', '/usr/local/opt/qt/include/QtGamepad',
    '-isystem', '/usr/local/opt/qt/include/QtGraphicsSupport',
    '-isystem', '/usr/local/opt/qt/include/QtHelp',
    '-isystem', '/usr/local/opt/qt/include/QtLocation',
    '-isystem', '/usr/local/opt/qt/include/QtMacExtras',
    '-isystem', '/usr/local/opt/qt/include/QtMultimedia',
    '-isystem', '/usr/local/opt/qt/include/QtMultimediaQuick',
    '-isystem', '/usr/local/opt/qt/include/QtMultimediaWidgets',
    '-isystem', '/usr/local/opt/qt/include/QtNetwork',
    '-isystem', '/usr/local/opt/qt/include/QtNetworkAuth',
    '-isystem', '/usr/local/opt/qt/include/QtNfc',
    '-isystem', '/usr/local/opt/qt/include/QtOpenGL',
    '-isystem', '/usr/local/opt/qt/include/QtOpenGLExtensions',
    '-isystem', '/usr/local/opt/qt/include/QtPacketProtocol',
    '-isystem', '/usr/local/opt/qt/include/QtPlatformCompositorSupport',
    '-isystem', '/usr/local/opt/qt/include/QtPlatformHeaders',
    '-isystem', '/usr/local/opt/qt/include/QtPositioning',
    '-isystem', '/usr/local/opt/qt/include/QtPositioningQuick',
    '-isystem', '/usr/local/opt/qt/include/QtPrintSupport',
    '-isystem', '/usr/local/opt/qt/include/QtPurchasing',
    '-isystem', '/usr/local/opt/qt/include/QtQml',
    '-isystem', '/usr/local/opt/qt/include/QtQmlDebug',
    '-isystem', '/usr/local/opt/qt/include/QtQuick',
    '-isystem', '/usr/local/opt/qt/include/QtQuickControls2',
    '-isystem', '/usr/local/opt/qt/include/QtQuickParticles',
    '-isystem', '/usr/local/opt/qt/include/QtQuickShapes',
    '-isystem', '/usr/local/opt/qt/include/QtQuickTemplates2',
    '-isystem', '/usr/local/opt/qt/include/QtQuickTest',
    '-isystem', '/usr/local/opt/qt/include/QtQuickWidgets',
    '-isystem', '/usr/local/opt/qt/include/QtRemoteObjects',
    '-isystem', '/usr/local/opt/qt/include/QtRepParser',
    '-isystem', '/usr/local/opt/qt/include/QtScript',
    '-isystem', '/usr/local/opt/qt/include/QtScriptTools',
    '-isystem', '/usr/local/opt/qt/include/QtScxml',
    '-isystem', '/usr/local/opt/qt/include/QtSensors',
    '-isystem', '/usr/local/opt/qt/include/QtSerialBus',
    '-isystem', '/usr/local/opt/qt/include/QtSerialPort',
    '-isystem', '/usr/local/opt/qt/include/QtServiceSupport',
    '-isystem', '/usr/local/opt/qt/include/QtSql',
    '-isystem', '/usr/local/opt/qt/include/QtSvg',
    '-isystem', '/usr/local/opt/qt/include/QtTest',
    '-isystem', '/usr/local/opt/qt/include/QtTextToSpeech',
    '-isystem', '/usr/local/opt/qt/include/QtThemeSupport',
    '-isystem', '/usr/local/opt/qt/include/QtUiPlugin',
    '-isystem', '/usr/local/opt/qt/include/QtUiTools',
    '-isystem', '/usr/local/opt/qt/include/QtVirtualKeyboard',
    '-isystem', '/usr/local/opt/qt/include/QtWebChannel',
    '-isystem', '/usr/local/opt/qt/include/QtWebEngine',
    '-isystem', '/usr/local/opt/qt/include/QtWebEngineCore',
    '-isystem', '/usr/local/opt/qt/include/QtWebEngineWidgets',
    '-isystem', '/usr/local/opt/qt/include/QtWebSockets',
    '-isystem', '/usr/local/opt/qt/include/QtWebView',
    '-isystem', '/usr/local/opt/qt/include/QtXml',
    '-isystem', '/usr/local/opt/qt/include/QtXmlPatterns',
    '-isystem', '/usr/local/opt/qt/include/Qt3DAnimation',
    '-isystem', '/usr/local/opt/qt/include/Qt3DCore',
    '-isystem', '/usr/local/opt/qt/include/Qt3DExtras',
    '-isystem', '/usr/local/opt/qt/include/Qt3DInput',
    '-isystem', '/usr/local/opt/qt/include/Qt3DLogic',
    '-isystem', '/usr/local/opt/qt/include/Qt3DQuick',
    '-isystem', '/usr/local/opt/qt/include/Qt3DQuickAnimation',
    '-isystem', '/usr/local/opt/qt/include/Qt3DQuickExtras',
    '-isystem', '/usr/local/opt/qt/include/Qt3DQuickInput',
    '-isystem', '/usr/local/opt/qt/include/Qt3DQuickRender',
    '-isystem', '/usr/local/opt/qt/include/Qt3DQuickScene2D',
    '-isystem', '/usr/local/opt/qt/include/Qt3DRender',

    # For google test
    '-isystem', './googletest/googletest/include',

    # For local headers
    '-isystem', './include',

    # For your own header files, please add '-iquote', '[your local include directory]'
]


# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def GetCompilationInfoForFile( filename ):
  # The compilation_commands.json file generated by CMake does not have entries
  # for header files. So we do our best by asking the db for flags for a
  # corresponding source file, if any. If one exists, the flags for that file
  # should be good enough.
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )


# This is the entry point; this function is called by ycmd to produce flags for
# a file.
def FlagsForFile( filename, **kwargs ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = GetCompilationInfoForFile( filename )
    if not compilation_info:
      return None

    final_flags = MakeRelativePathsInFlagsAbsolute(
      compilation_info.compiler_flags_,
      compilation_info.compiler_working_dir_ )
  else:
    relative_to = DirectoryOfThisScript()
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True
  }

