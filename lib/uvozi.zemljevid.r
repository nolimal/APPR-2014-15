# Uvoz potrebnih knjižnic
library(sp)
library(maptools)
gpclibPermit()

# Funkcija uvozi.zemljevid(url, ime.zemljevida, pot.zemljevida,
#                         encoding = "Windows-1250", force = FALSE)
#
# Funkcija najprej preveri, ali zemljevid na podani lokaciji že obstaja. Če
# ne obstaja ali če je parameter force nastavljen na TRUE, pobere arhiv z
# navedenega naslova in ga razširi. Nato uvozi zemljevid in ga vrne.
#
# Parametri:
#   * url             Naslov URL, iz katerega naj dobimo arhiv z zemljevidom.
#   * ime.zemljevida  Ime mape, kamor se bo razširil zemljevid.
#   * pot.zemljevida  Pot do datoteke SHP, kakršna je v pobranem arhivu.
#   * mapa            Pot do mape, kamor naj se shrani zemljevid (privzeto
#                     trenutna mapa)
#   * encoding        Kodiranje znakov v zemljevidu (privzeta vrednost
#                     "Windows-1250").
#   * force           Ali naj se zemljevid v vsakem primeru pobere z navedenega
#                     naslova (privzeta vrednost FALSE).
#
# Vrača:
#   * zemljevid (SpatialPolygonsDataFrame) iz pobranega arhiva
uvozi.zemljevid <- function(url, ime.zemljevida, pot.zemljevida,
                            mapa = ".", encoding = "Windows-1250",
                            force = FALSE) {
  map <- paste0(mapa, "/", ime.zemljevida)
  pot <- paste0(map, "/", pot.zemljevida)
  zip <- paste0(map, "/", ime.zemljevida, ".zip")
  if (force || !file.exists(pot)) {
    if (!file.exists(map)) {
      dir.create(map, recursive = TRUE)
    }
    download.file(url, zip)
    unzip(zip, exdir = map)
  }
  zemljevid <- readShapeSpatial(pot)

  for (col in names(zemljevid)) {
    if (is.factor(zemljevid[[col]])) {
      zemljevid[[col]] <- factor(iconv(zemljevid[[col]], encoding))
    }
  }
  
  return(zemljevid)
}

# Primer uvoza zemljevida (drzave v EU)
drzave <- uvozi.zemljevid("http://www.eurogeographics.org/sites/default/files/EuroBoundaryMap_v81_Shapefiles.zip",
                             "drzave", "zemljevid/EuroBoundaryMap_v81_sample/BasicGeometry/EBM_A.shp", mapa = "zemljevid",
                           encoding = "Windows-1250")
drzave1 <- uvozi.zemljevid("http://www.mapcruzin.com/download-shapefile/europe-places-shape.zip",
                        "drzave1", "zemljevid/eu_places/places.shp", mapa = "zemljevdk",
                        encoding = "Windows-1250")
