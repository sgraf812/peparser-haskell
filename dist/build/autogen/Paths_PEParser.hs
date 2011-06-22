module Paths_PEParser (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,1], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/ian/.cabal/bin"
libdir     = "/Users/ian/.cabal/lib/PEParser-0.1/ghc-6.12.3"
datadir    = "/Users/ian/.cabal/share/PEParser-0.1"
libexecdir = "/Users/ian/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "PEParser_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "PEParser_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "PEParser_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "PEParser_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)