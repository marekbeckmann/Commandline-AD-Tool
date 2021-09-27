function getUser($username, $givenname, $surname, $email) {
    if ($username) {
        $userInfo = Get-ADUser -Properties * -Identity $username
        Write-Host "Full Name: " $userInfo.Title $userInfo.givenname $userInfo.surname "`nUsername: " $userInfo.Name "`nEmail: " $userInfo.mail "`nEnabled: " $userInfo.enabled "`nPassword expired: "$userInfo.PasswordExpired "`nPassword last changed on: " $userInfo.PasswordLastSet.ToString("dd.MM.yyyy") "`nPassword expires on: " $userInfo.PasswordLastSet.AddDays(180).ToString("dd.MM.yyyy") "`nPhone: " $userInfo.OfficePhone "`nOffice: " $userInfo.Office
        $membership = Get-ADPrincipalGroupMembership $username
        write-host "`n----------------------------------------`n"
        foreach ($i in $membership) {
            write-host "Member Of: " $i.Name
        }
    }
    elseif ($givenname -and $null -eq $surname) {
        Get-ADUser -Properties * -Filter { givenname -like $givenname } | Select-Object Title, givenname, surname, name, mail, enabled | sort-object name
    }
    elseif ($surname -and $null -eq $givenname) {
        Get-ADUser -Properties * -Filter { surname -like $surname } | Select-Object Title, givenname, surname, name, mail, enabled | sort-object name
    }
    elseif ($givenname -and $surname) {
        Get-ADUser -Properties * -Filter { givenname -like $givenname -and surname -like $surname } | Select-Object Title, givenname, surname, name, mail, enabled | sort-object name
    }
    elseif ($email) {
        Get-ADUser -Properties * -Filter { mail -like $email } | Select-Object Title, givenname, surname, name, mail, enabled | sort-object name
    }
}
