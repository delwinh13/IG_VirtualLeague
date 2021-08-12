*** Variables ***
#*********************************************** LoginVirtualLeague  ******************************************************
${TYPE OF FILE}                 png
${Path}
${BROWSER}                      chrome
${VLURL}                        https://staging.betlion.ke/home/virtualleague
${BetLionLogoXpath}             xpath://div[@class='BetLion-Lite-Mobile']/div/div[2]/div/div[3]/a/img
${HomeLoginBtnXpath}            xpath://div[@class='BLM-mainHeader-rightSection']//button[text()='Login']
${AllowNotificationsBtnXpath}   xpath://div[@id='dengage-push-perm-slide']/div/div[2]/div/button[text()='Allow']
${MobileNoID}                   id:userMobile
${PinID}                        id:userPass
${LoginBtnXpath}                xpath://body/div[1]/div[2]/div[1]/div[1]/button[1]/span[1]
${DepositBtnXpath}              xpath://body/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/a[1]/button[1]
${WelcomePlayNowBtn}            xpath://div[@class='virtual-league-app']//button[text()='Play Now']
${iframe}                       xpath://iframe[@id='virtualFrame']
${BlankCredentialsMsg}          xpath://span[text()='Please enter valid credentials']
${InvalidCredentialsMsg}        xpath://span[text()='Sorry, that username / password combination has not been recognised Code:401']
${HamburgerMenu}                xpath://div[@class='BLM-hamBurger-menu']
${MyAccount}                    xpath://div[@class='BLM-tabs']//a[text()='My Account']
${LogoutBtn}                    xpath://div[@class='BLM-logout-container']//button[text()='Logout']

#*********************************************** VirtualLeague  *************************************************************
${VLeagueHomeActive}            xpath://div[@class='BLM-layout-header']//div[@class='BLM-subHeader']/ul[@class='topHeaderAddActiveClass']//li[contains(@class, 'active')]/a//i[@class='bl-icon-home']
${VLeagueHeader}                xpath://div[@class='BLM-layout-header']//div[@class='BLM-subHeader']/ul[@class='topHeaderAddActiveClass']//li//a[@href='/Home/VirtualLeague']
${VLeagueHeaderActive}          xpath://div[@class='BLM-layout-header']//div[@class='BLM-subHeader']/ul[@class='topHeaderAddActiveClass']//li[contains(@class, 'active')]//a[@href='/Home/VirtualLeague']
${VLeagueiframe}                xpath://div[@class='BLM-virtual-iframe']
${VLeagueNextStartTimer}        xpath://header[@class='header']//span[@class='header__game-state--time']
${VLeagueCompSelectorDD}        xpath://div[@class='competition-selector__select']
${VLeagueCompVEPL}              xpath://div[@class='competition-selector__options-wrapper competition-selector__options-wrapper--active']/div[text()='V-EPL']
${VLeagueCompVLaLiga}           xpath://div[@class='competition-selector__options-wrapper competition-selector__options-wrapper--active']/div[text()='V-La Liga']
${VLeagueCompVAfricanNations}   xpath://div[@class='competition-selector__options-wrapper competition-selector__options-wrapper--active']/div[text()='V-African Nations']
${VLeagueCompVWorldLeague}      xpath://div[@class='competition-selector__options-wrapper competition-selector__options-wrapper--active']/div[text()='V-World League']
${VLeagueMatchesTab}            xpath://li[@class='menu__item']//a[@class='active'][text()='Matches']
${VLeague0Selected}             xpath://div[@class='bonus-bar']//span
${VLeague0Bonus}                xpath://div[@class='bonus-bar']//div[@class='bonus-bar__current-multiplier--0__number']
${VLeagueLiveTab}               xpath://a[text()='Live']
${VLeagueResultsTab}            xpath://a[text()='Results']
${VLeagueBetslip}               xpath://a[@href='/matches']//div[text()='V-Betslip']
${VLeagueTableTab}              xpath://a[text()='Table']
${VLeague1X2MenuItem}           xpath://div[@class='market-menu']//div[@class='market-menu__item active'][text()='1 X 2']
${VLeagueGGMenuItem}            xpath://div[@class='market-menu']//div[@class='market-menu__item'][text()='GG']
${VLeague0U25MenuItem}          xpath://div[@class='market-menu']//div[@class='market-menu__item'][text()='O/U 2.5']
${VLeagueDCMenuItem}            xpath://div[@class='market-menu']//div[@class='market-menu__item'][text()='DC']
${VLeagueMatchTableRows}        xpath://div[@class='match-table__row']
${VLeagueBetslipInactive}       xpath://div[@class='menu__item-betslip menu__item-betslip--inactive']
${VLeagueBetslipActive}         xpath://div[@class='menu__item-betslip ']/a/div[@class='menu__item--total-bets menu__item--there-are-bets'][text()='1']
${VLeagueBonusProgress0}        xpath://div[@class='bonus-bar__progress-wrapper--bonus-progress']//div[@class][1][text()='1']
${VLeagueBonusProgress1}        xpath://div[@class='bonus-bar__progress-wrapper--bonus-progress']//div[@class='bonus-bar__progress-wrapper--bonus-progress__1']








${VLeagueBonus%_0}              xpath://div[@class='bonus-bar__current-multiplier--0']
${VLeagueBonus%_1}              xpath://div[@class='bonus-bar__current-multiplier--1']
${VLeagueMatchBet1Inactive_1}     xpath:(//div[@class='match-table']//div[@class='match-table__row'])[1]//div[@class='match-table__col-wrapper'][1]//div[@class='match-table__selection-name'][text()='1']
${VLeagueMatchBet2Inactive_X}     xpath:(//div[@class='match-table']//div[@class='match-table__row'])[2]//div[@class='match-table__col-wrapper'][1]//div[@class='match-table__selection-name'][text()='X']

