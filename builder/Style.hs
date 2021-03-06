module Style (Style.style) where

import Clay
import qualified Clay.Flexbox as F

import Data.Text.Lazy (unpack)

style :: String
style = unpack $ render css

css :: Css
css = do
  "body" ? do
    maxWidth $ px 900
    margin auto auto auto auto
    color "#FAEDE8"
    backgroundColor "#041816"
    fontFamily ["Fira Sans"] [sansSerif]
    fontSize $ pt 12

  "a" <> "a"#visited ? do
    color "#F94C39"
    textDecoration none

  "a"#hover <> "a"#focus ? do
    color "#A83614"

  "#header" <> "#footer" ? "a" ? do
    color "#C92C29"

  "#navigation" <> "#footer" ? "a"#hover ? do
    color "#96161B"

  "#header" ? do
    padding (px 12) (px 10) (px 3) (px 10)
    margin 0 (px 10) 0 (px 10)
    borderBottom solid (px 2) "#C92C29"
    display flex
    flexWrap F.wrap
    justifyContent spaceBetween
    fontWeight bold

  "#logo" ? do
    F.flex 1 1 auto
    fontSize $ pt 20

  "#navigation" ? do
    F.flex 1 1 auto
    textAlign $ alignSide sideRight
    alignSelf flexEnd
    textTransform uppercase

  "#content" ? do
    backgroundColor "#071410"
    padding (px 5) (px 20) (px 5) (px 20)
    margin (px 20) (px 15) (px 0) (px 15)
    borderRadius (px 20) (px 20) (px 20) (px 20)

  "#postlist" ? do
    listStyleType none
    padding (px 0) (px 8) (px 0) (px 8)

    "li" ? do
      borderTop solid (px 1) "#FAEDE8"
      padding (px 10) (px 10) (px 10) (px 10)
      display flex
      flexWrap F.wrap
      justifyContent spaceBetween
      lastChild & borderBottom solid (px 1) "#FAEDE8"
      "a" ? F.flex 1 1 auto;
      "span" ? do
        color "#756E63"
        F.flex 0 0 auto
        textAlign $ alignSide sideRight

  "#projectlist" ? do
    listStyleType none
    margin (px 0) (px 0) (px 0) (px 0)
    padding (px 0) (px 10) (px 25) (px 10)

    "li" ? do
      backgroundColor "#202522"
      borderRadius (px 15) (px 15) (px 15) (px 15)
      padding (px 5) (px 23) (px 5) (px 23)
      marginTop (px 20)

      "h2" # ".project-name" ? marginBottom (px 0)

  "#footer" ? do
    backgroundColor "#202A28"
    fontSize $ pt 10
    borderRadius (px 20) (px 20) (px 20) (px 20)
    width $ px 240
    padding (px 5) (px 0) (px 5) (px 0)
    margin (px 10) auto (px 10) auto
    textAlign center
