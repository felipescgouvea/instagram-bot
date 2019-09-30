*** Settings ***
Documentation     A MVP Bot for Instagram, for knowledge purposes
Library           SeleniumLibrary
Resource           instagram-login.robot
*** Variables ***
${LOGIN URL}      https://www.instagram.com/accounts/login/?source=auth_switcher
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    Login On Instagram
    Like Photos


*** Keywords ***
Like Photos
    FOR    ${index}    IN RANGE    10000
        ${elements}=    Get WebElements    css:span[aria-label='Curtir'][class='glyphsSpriteHeart__outline__24__grey_9 u-__7']
        ${cnt}=    Get length       ${elements}
        Run keyword if  "${cnt}" == "0"    ScrollDown
        Like Global Photo       @{elements}
    END

Like Global Photo
    [Arguments]     @{elements}
    FOR    ${element}    IN    @{elements}
        Scroll Element Into View        ${element}
        Wait Until Element Is Visible       ${element}
        Click Element       ${element}
    END

ScrollDown
    Execute Javascript      window.scrollBy(0, 250)