module Paths_fpRotterdamDojo (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/kaiyin/haskellProjects/fpRotterdamDojo/.stack-work/install/x86_64-osx/lts-3.20/7.10.2/bin"
libdir     = "/Users/kaiyin/haskellProjects/fpRotterdamDojo/.stack-work/install/x86_64-osx/lts-3.20/7.10.2/lib/x86_64-osx-ghc-7.10.2/fpRotterdamDojo-0.1.0.0-1NfOoEs2OP8Jt7Nqa1XRpK"
datadir    = "/Users/kaiyin/haskellProjects/fpRotterdamDojo/.stack-work/install/x86_64-osx/lts-3.20/7.10.2/share/x86_64-osx-ghc-7.10.2/fpRotterdamDojo-0.1.0.0"
libexecdir = "/Users/kaiyin/haskellProjects/fpRotterdamDojo/.stack-work/install/x86_64-osx/lts-3.20/7.10.2/libexec"
sysconfdir = "/Users/kaiyin/haskellProjects/fpRotterdamDojo/.stack-work/install/x86_64-osx/lts-3.20/7.10.2/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "fpRotterdamDojo_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "fpRotterdamDojo_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "fpRotterdamDojo_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "fpRotterdamDojo_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "fpRotterdamDojo_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
