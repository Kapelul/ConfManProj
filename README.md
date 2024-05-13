# Palvelinten hallinta miniproju

Tässä on kurssin palvelinten hallinta miniprojekti loppuun. 

Moduulin tarkoitus on laittaa nopeasti ja helposti webpalvelimen testi/kehitysympäristö. Se asettaa myös *home* kansioon www/html tiedoston.

Moduuli sisältää:

apache2

micro-editori

git

curl

Apachelle on oma tilatiedostonsa ja konfiguraatiotiedostot, muut hyödylliset paketit tulevat myös omasta tilastaan. Moduuli sisältää top.sls tiedoston, jotta tilojen ajaminen onnistuu yhdellä kertaa. 

Projektin toteutin ja testasin itse vagrantin kautta debian/bullseye64 ympäristössä. 

Yksinkertaisimmin asennus tapahtuu kloonaamalla tämä varasto vaikkapa /home/USER/ kansioon. Ensimmäisenä kannattaa/täytyy tehdä kuitenkin pakettivarastojen päivitys.
```
sudo apt-get update
sudo apt-get upgrade
```
Tämän varaston kloonaamiseen tarvitaan myös git, ja tilojen ajamiseen Salt. 
```
sudo apt install -y git
sudo apt install -y salt-minion
```
Kun tarvittavat paketit on asennettu, kloonaaminen tapahtuu painamalla tämän varaston etusivulla olevaa **CODE** painiketta ja kopioimalla sieltä HTTPS url.
```
git clone https://github.com/Kapelul/ConfManProj.git
```
Jos käytät jotain muuta kuin vagrantia asennukseen, täytyy apache tilakansiossa olevissa init.sls ja example.conf muuttaa **vagrant** nimet omaan käyttäjänimeensä.

Kun varasto on kloonattu, täytyy koneesta löytyä /srv/salt kansio, joka voidaan luoda komennolla
```
sudo mkdir -p /srv/salt
```
Nyt tiedostot/kansiot voidaan kopioida juuri luotuun kansioon komennolla
```
sudo cp -r ConfManProj/* /srv/salt
```
Tilat ovat nyt valmiita ajamiseen. Tilat on testattu toimivan lokaalisti, ja myös herra-orja tekniikalla. Omalle koneelle lokaalisti ajaminen tapahtuu komennolla
```
sudo salt-call --local state.apply
```
ja jos käyttää herra-orja tehtuuria
```
sudo salt '*' state.apply
```
Tähti tarkoittaa, että se asentaa siis kaikille orja-koneille, voit myös laittaa tietyn orja-koneen nimen.

Ajamisen onnistumisen voi tarkistaa *curl localhost* komennolla, ja lopputuloksen pitäisi näkyä kuvan mukaiselta:

![done](https://github.com/Kapelul/ConfManProj/assets/165004665/b05f8be0-0b09-4548-b262-118dcd40f03b)

Pidempi asennusprossi [H7](https://github.com/Kapelul/palvelin-course/blob/main/h7.md)
