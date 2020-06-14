# FC Parisii

## Web Page hosting apps

https://fc-parisii-f139f.web.app/

## Mise à jour ios
- commande ``flutter build ios``
- créer une archive ad-hoc ios depuis Xcode
- nom ipa : FC-Parisii
- url ipa : https://fc-parisii-f139f.web.app/apps/ios/FC-Parisii.ipa
- copier le manifets.plist et les ipa de /Apps/* dans web-deploy/apps/ios/ 

## Mise à jour android
- commande ``flutter build apk``
- copier build/app/outputs/apk/release/app-release.apk dans web-deploy/apps/android/

## Dans les deux cas terminer par la commande :
``firebase deploy``
