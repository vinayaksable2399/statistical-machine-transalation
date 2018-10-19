#https://translate.yandex.com/developers/keys
install.packages("RYandexTranslate")
library("RYandexTranslate")
api_key="<your_api_key>"

directions=get_translation_direction(api_key)
directions


translate= function (api_key, text = "", lang = "") 
{
  url = "https://translate.yandex.net/api/v1.5/tr.json/translate?"
  url = paste(url, "key=", api_key, sep = "")
  if (text != "") {
    url = paste(url, "&text=", text, sep = "")
  }
  if (lang != "") {
    url = paste(url, "&lang=", lang, sep = "")
  }
  url = gsub(pattern = " ", replacement = "%20", x = url)
  d = RCurl::getURL(url, ssl.verifyhost = 0L, ssl.verifypeer = 0L)
  d = jsonlite::fromJSON(d)
  d$code = NULL
  d
}

translate(api_key,text="how are you ?",lang="en-mr")
translate(api_key,text="what are you doing?",lang="en-mr")
translate(api_key,text="we are ASI",lang="en-mr")
