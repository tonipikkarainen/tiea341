{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_testi (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/tonipikkarainen/master_degree/tiea341/omat_exer/testi/.stack-work/install/x86_64-osx/16532c4bc37ef13f7206204f2ffaa7eb78ac1341808ce14a5c77c8f921a94269/8.6.5/bin"
libdir     = "/Users/tonipikkarainen/master_degree/tiea341/omat_exer/testi/.stack-work/install/x86_64-osx/16532c4bc37ef13f7206204f2ffaa7eb78ac1341808ce14a5c77c8f921a94269/8.6.5/lib/x86_64-osx-ghc-8.6.5/testi-0.1.0.0-KFJdfwqFcw9LOYCdlEMaF1-testi"
dynlibdir  = "/Users/tonipikkarainen/master_degree/tiea341/omat_exer/testi/.stack-work/install/x86_64-osx/16532c4bc37ef13f7206204f2ffaa7eb78ac1341808ce14a5c77c8f921a94269/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/tonipikkarainen/master_degree/tiea341/omat_exer/testi/.stack-work/install/x86_64-osx/16532c4bc37ef13f7206204f2ffaa7eb78ac1341808ce14a5c77c8f921a94269/8.6.5/share/x86_64-osx-ghc-8.6.5/testi-0.1.0.0"
libexecdir = "/Users/tonipikkarainen/master_degree/tiea341/omat_exer/testi/.stack-work/install/x86_64-osx/16532c4bc37ef13f7206204f2ffaa7eb78ac1341808ce14a5c77c8f921a94269/8.6.5/libexec/x86_64-osx-ghc-8.6.5/testi-0.1.0.0"
sysconfdir = "/Users/tonipikkarainen/master_degree/tiea341/omat_exer/testi/.stack-work/install/x86_64-osx/16532c4bc37ef13f7206204f2ffaa7eb78ac1341808ce14a5c77c8f921a94269/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "testi_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "testi_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "testi_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "testi_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "testi_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "testi_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
