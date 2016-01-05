module Ggg where


import qualified Data.List.Split as L
import Data.List
import Data.Char

-- See the challenge on reddit: https://www.reddit.com/r/dailyprogrammer/comments/3x3hqa/20151216_challenge_245_intermediate_ggggggg_gggg/

line1 :: [Char]
line1 = "H GgG d gGg e ggG l GGg o gGG r Ggg w ggg"
line2 :: [Char]
line2 = "GgGggGGGgGGggGG, ggggGGGggGGggGg!"
keys :: [[Char]]
keys = L.splitOn " " line1

buildmapping :: [t] -> [(t, t)]
buildmapping [] = []
buildmapping (a:a':as) = (a', a):buildmapping as
buildmapping ([_]) = error "Number of keys not equal to number of words."

decode :: Eq a => [([a], [a])] -> [a] -> [a]
decode _ [] = []
decode mapping string = go mapping
  where
    go ((from, to):ms)
     | from  `isPrefixOf` string = to ++ decode mapping (drop (length from) string)
     | otherwise = go ms
    -- go [] = maybe (string) (\h -> h:decode mapping (tail string)) (listToMaybe string)
    go [] = head string : (decode mapping $ tail string)

fromIntToGGG :: Int -> String
fromIntToGGG k = 'G' : replicate k 'g'

generateMapping :: Foldable t => t Char -> [Char]
generateMapping string = tail $ concatMap (\k -> ' ' : k : ' ' : (fromIntToGGG $ ord k)) string
