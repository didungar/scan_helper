#include <File.au3>
#include <Array.au3>
#include <String.au3>

; Dossier cible
Local $sFolder = "C:\Users\didun\OneDrive\Documents\Scanned Documents"

; Liste tous les fichiers JPG
Local $aFiles = _FileListToArray($sFolder, "*.jpg", 1)

If @error Then
    MsgBox(16, "Erreur", "Aucun fichier trouvé dans " & $sFolder)
    Exit
EndIf

; Tableau pour stocker [index][nom, numero]
Local $aSorted[$aFiles[0]][2]

For $i = 1 To $aFiles[0]
    Local $sFile = $aFiles[$i]
    Local $iNum = 0

    ; Cherche un numéro entre parenthèses dans le nom
    Local $aMatch = StringRegExp($sFile, "\( *(\d+) *\)", 1)
    If @extended > 0 Then
        $iNum = Number($aMatch[0])
    EndIf

    $aSorted[$i - 1][0] = $sFile
    $aSorted[$i - 1][1] = $iNum
Next

; Tri selon la colonne [1] (le numéro trouvé ou 0)
_ArraySort($aSorted, 0, 0, 0, 1)

; Renommage avec compteur
For $i = 0 To UBound($aSorted) - 1
    Local $sOldName = $sFolder & "\" & $aSorted[$i][0]
    Local $sNewName = $sFolder & "\image_" & StringFormat("%03d", $i + 1) & ".jpg"

    If FileExists($sNewName) Then FileDelete($sNewName)
    FileMove($sOldName, $sNewName)
Next

MsgBox(64, "Terminé", "Renommage effectué avec succès !")
