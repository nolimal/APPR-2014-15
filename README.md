
# Analiza podatkov s programom R, 2014/15

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

#Avtor

Matevz Nolimal

#Mentor

Janos Vidali

## Trg dela znotraj Evropske Unije

Izbrana tematika obsega statistično obdelavo razmer na trgu dela znotraj Evropske Unije. Razsežnost problema vpliva ne le na denarne tokovi, temveč tudi na območja motiva bega možganov in iskanja višjega zadovoljstva posameznikov. S pomočjo podatkov zbranih na portalu Eurostat in metodologije Zavoda za nacionalno statistiko (Office for National Statistics) bom oblikoval trenutno in preteklo podobo stanj na trgu, opredeljeno na državni oziroma regionalni ravni znotraj Europskega obroča.

Zaradi velikih odstopanj v regionalni podobi deleža in derivata zaposlenih, obstaja ogromno uporabnih tabel, katere bodo ključ moje obdelave zbranih podatkov. Pričakujem, da bom numerično potrdil znan Okunov zakon, ki pravi da višjo gospodarsko rast dosegamo ob nižji brezposelnosti, zato bom veliko časa namenil tudi obdelavi tega izredno pomembnega dejavnika. Podatki v obliki XSL, CSV, HTML in PDF bom obdelal po večih spremenljivkah, kot so npr. spol, starost, najvišja raven izobrazbe, regija itn. Posvetil se bom tudi stroškom dela, strukturi zaslužka, meri aktivnosti, saj vsi našteti pomembno vplivajo na končno podobo. 

Namen in cilj projekta je, da spoznam orodja analiziranja v programu R na konkretnem primeru in pridobim novo znanje s področja, ki ga bom analiziral. Dodana vrednost tega je interdisciplinarno povezovanje znanj, ki je zelo uporabno v modernih modelih poslovnega management-a.

## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
