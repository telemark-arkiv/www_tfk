<header role="banner" class="page-header">
    <div class="page-header__content-wrapper js-headroom">
        <div class="constrained">
            <div class="page-header__content"><a href="#main" class="page-header__skip-to visuallyhidden-focusable">Hovedinnhold</a><a id="menu-trigger" href="#footer-menu" class="menu-trigger icon--menu-mobile">Meny</a><a href="/" class="page-header__logo"><img src="/extension/www_tfk/design/tfk2/images/logo/logo.svg" alt="Telemark Fylkeskommune" title="Gå til forside"/></a>
                <nav role="navigation" class="page-header__nav">
                    <ul class="nav nav--small">
                        <li class="nav__item"><a href={'/Fylkeskommunen/Presse'|ezurl()} title="Informasjon tilrettelagt for pressen" class="nav__item__link">Presse</a></li>
                        <li class="nav__item"><a href="http://apps.t-fk.no/postlister/"  title="Søk i postlistene (åpnes i nytt vindu)" target="_blank" class="nav__item__link">Postlister</a></li>
                        <li class="nav__item"><a href={'/Fylkeskommunen/English'|ezurl()} title="Information in English" class="nav__item__link">English</a></li>
                        <li class="nav__item"><a href={'/Fylkeskommunen/Ledige-stillinger'|ezurl()} title="Informasjon om ledige stillinger i Telemark fylkeskommune" class="nav__item__link">Ledige stillinger</a></li>
                        <li class="nav__item"><a href={'/Vaare-tjenester/Soeknader-og-tilskudd'|ezurl()} title="Samleside for alle våre søknader og tilskudd" class="nav__item__link">Søknader og tilskudd</a></li>
                        <li class="nav__item"><a href={'/Kontakt-oss'|ezurl()} title="Finn kontaktinformasjon" class="nav__item__link">Kontakt</a></li>
                        <li class="nav__item"><a href="/hvordan-justere-tesktstoerrelsen.html" class="nav__item__link"><abbr class="font-adjust js-font-adjust" title="Hvordan justere tekststørrelsen?"><span class="font-adjust__char--small">a</span> &rarr; <span class="font-adjust__char--large">a</span></abbr></a></li>
                    </ul>
                </nav>
                <div class="page-header__search">
                  <form role="search" class="search">
                    <label for="page-header__search__field" class="visuallyhidden">Søk</label>
                    <input id="page-header__search__field" type="search" class="search__field"/>
                    <button type="submit" class="search__btn icon--search">Søk</button>
                  </form>
                </div>
                <div class="font-adjust__message js-font-adjust-message">For å endre tekststørrelsen, hold inne <kbd>Ctrl</kbd> (Windows/Linux) eller <kbd>Cmd</kbd> (Mac) og trykk på <kbd>+</kbd> for å forstørre eller <kbd>-</kbd> for å forminske.</div>
              </div>
            </div>
          </div>
          <!-- Hovedmeny -->
          <!-- Top menu area: START -->
          {if $pagedata.top_menu}
            {include uri='design:menu/menu_top.tpl' nodebane=$dennenoden.path_array}
          {/if}
          <!--  Top menu area: END -->
</header>

{*

<!-- search-from -->
<form action="/content/search" class="search-form">
	<div id="ezautocomplete">
	    <fieldset>
	        <legend class="hide">Søkefelt</legend>
			    <label for="SearchText" class="hide">Søk på nettstedet</label>
				<input tabindex="3" accesskey="2" name="SearchText" id="SearchText" class="text" type="text" value="" placeholder="Skriv søketekst her" autocomplete="off" />
				<input tabindex="4" class="btn" type="submit" value="SØK" />
	    </fieldset>
	    <div id="ezautocompletecontainer"></div>
	</div>
</form>

*}