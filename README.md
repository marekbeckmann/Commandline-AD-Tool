# Quick-AD-Tools

**As of now German only**

## 1. How to use

Simply run the script with one of the following parameters: 

| Option | Description |
|--|--|
| -username | Search for Username |
| -givenname | Search for Givenname |
| -surname | Search for Surname |
| -email | Search for Email |

You can use wildcards for all options, except the username. You can combine given- and surname, however not username and email (since they are unique). In any case, the following order applies: 

 1. Username
 2. Email
 3. Givenname
 4. Surname

## 1.1 Examples

List Info for specific User

```
getUser -username userName
```
Output: 
```
Full Name:  Mr Marek Beckmann
Username:  ****
Email:  ****
Enabled:  True
Password expired:  False
Password changed on:  17.04.2021
Password expires on:  13.12.2021
Phone: +49 **** ** ****
Office:  ***

----------------------------------------

Member Of:  Users
Member Of:  Admins
...
```
Please note, that the "Password expires on ..." option, expects a password policy, that requries users to change their password every 180 days. If it differs for you, change the number in the script.

List found Users, when searching for the lastname

```
getUser -surname beckmann
```
Output: 
```
Title     : Ms
givenname : ****
surname   : Beckmann
name      : ****
mail      : ****

Title     : Mr
givenname : Marek
surname   : Beckmann
name      : ****
mail      : ****
```

Search for a fullname: 
```
getUser -givenname marek -surname beckmann
```
Output:
```
Title     : Herr
givenname : Marek
surname   : Beckmann
name      : ****
mail      : ****
```
