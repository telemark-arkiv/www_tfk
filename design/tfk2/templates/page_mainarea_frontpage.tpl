{*
{def $slogans=array('Fylkeskommunen eier 80 prosent av veiene i Telemark',
                    'Fylkeskommunen brukte i 2012 227 mill. kr på kollektivtransport',
                    'Fylkeskommunen brukte i 2012 165 mill. kr på fylkesveier',
                    'I Telemark bor 76 prosent av innbyggerne i byer og tettsteder',
                    'Bypakke Grenland gjør det tryggere for syklister og gående',
                    'Bypakke Grenland skal redusere CO2-utslipp',
                    'Fylkeskommunen arbeider for god helse fra barnehage til videregående',
                    'Elevene i Telemark er best i landet på å sykle til skolen',
                    'Elever i Telemark får gode fiske- og sjømatretter i kantina',
                    'Fylkeskommunen arbeider for sentrumsnære turveier',
                    'Fylkeskommunen arbeider for en bedre skolehelsetjeneste',
                    'Telemark fylkeskommune har ansvar for 17 tannklinikker',
                    'Tannklinikken i Skien er universitetsklinikk for universitetet i Tromsø',
                    '19 og 20-åringer får tannbehandling mot 25 % egenandel',
                    'Tannhelsetjenesten i Telemark tar imot voksne betalende pasienter',
                    'Fylkeskommunen åpner internasjonale dører for næringslivet',
                    'Fylkeskommunen har et internasjonalt nettverk i Europa, USA og Kina',
                    '10 prosent av Norges samlede eksportverdi kommer fra Telemark',
                    'Telemark fylkeskommune har ansvar for 13 videregående skoler',
                    'Fylkeskommunen gir skoleplass til over 6 500 elever',
                    'Fylkeskommunen gir videregående opplæring til over 500 voksne',
                    'Telemark fylkeskommune driver Fagskolen Telemark i Porsgrunn',
                    'Kontakt fylkeskommunen om du vil ha lærling i din bedrift',
                    'Fylkeskommunen følger opp ungdommer som går på skole eller er i arbeid',
                    'Elev- og lærlingombudet jobber for unges rettigheter',
                    'Ungdomsrådet vil at barn og unge skal bli hørt i Telemark',
                    'Telemark fylkeskommune eier Telemarkskanalen',
                    'Det er  registrert ca. 11 000 arkeologiske kulturminner i Telemark',
                    'Telemark vil ha Notodden og Rjukan inn på UNESCOs verdensarvliste',
                    'For 110 år siden ble et bygg i Telemark fredet for første gang',
                    'Telemark er at av fylkene med flest kulturminner i Norge',
                    'Fylkeskommunen gir støtte til fredede bygg, anlegg og kulturmiljøer',
                    'Telemark fylkeskommune har 1600 ansatte',
                    'Åtte videregående skoler blir miljøfyrtårnsertifisert i 2013',
                    'Telemark fylkeskommune ble opprettet i 1976',
                    'Telemarks fylkesvåpen er ei bondestridsøks',
                    'Du finner Telemark i tall på telemarksbarometeret.no',
                    'Navnet Telemark kommer av norrønt Þilamǫrk, av folkenavnet Þilir og mǫrk, mark, skog.',
                    'Fylkesmannen i Telemark jobber ikke i fylkeskommunen',
                    'I 2012 ble det fordelt 30 mill. kr. til idrettsanlegg i Telemark',
                    'Fylkeskommunen investerer årlig millioner i fylkets kultur- og idrettsbygg',
                    'Telemark fylkeskommune tilbyr konserter til barnehager og institusjoner',
                    'Mange tusen elever fikk opplevelser fra Den kulturelle skolesekken i 2012',
                    'Evy-Anni Evensen er fylkesrådmann i Telemark',
                    'Terje Riis-Johansen er fylkesordfører i Telemark',
                    'Fylkesvaraordfører i Telemark heter Christian Tynning Bjørnø',
                    'Fylkestannlegen i Telemark heter Turid Kristoffersen',
                    'Opplæringssjefen i Telemark fylkeskommune heter Bjørn Larsen',
                    'Bjørg Hilde Herfindal er samferdselssjef i Telemark',
                    'Utviklingssjefen i Telemark heter Jon Skriubakken',
                    'Elev- og lærlingombudet i Telemark heter Ole Marius Vollen',
                    'Fylkeskommunen kan skrive lange og vanskelige ord',
                    'Fylkeskommunen skrevet baklengs er nenummokseklyF',
                    'Det er mer enn 570 millioner trær i Telemark')}

  {def $random_slogan=$slogans[rand(0, 37)]}

*}

{def $slogans=array()}
  {def $slogans_count = 0}
  {def $slogans=fetch( 'content', 'list', hash( 'parent_node_id', '7184',
                                                'class_filter_type', 'include',
                                                'class_filter_array', array( 'did_u_know_line' ) ) ) }
  {def $slogans_count=$slogans|count()}
  {def $random_slogan=$slogans[rand(0, sub($slogans_count, 1))]}
  
  {undef $slogans_count}
  {undef $slogans}
  
  <div class="info-row">
    <h1>{$random_slogan.data_map.entry.data_text}</h1>
    <ul class="social-networks">
      <li><a class="facebook" href="https://www.facebook.com/telemarkfylke" title="Følg oss på Facebook" target="_blank">facebook</a></li>
      <li><a class="twitter" href="https://twitter.com/telemarkfylke" title="Følg oss på Twitter" target="_blank">twitter</a></li>
      <li><a class="gplus" href="https://plus.google.com/108353607427028279455" title="Følg oss på Google+" target="_blank">google+</a></li>
      <li><a class="rss" href="http://www.telemark.no/rss/feed/aktuelt" title="Abonner på siste nytt via rss" target="_blank">rss</a></li>
      <li><a class="email" href="mailto:post@t-fk.no" title="Send oss en e-post">email</a></li>
    </ul>
  </div>

  {def $tabcontainers=fetch( 'content', 'list', hash( 'parent_node_id', '2',
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'tabboks' ) ) ) }

  {if $tabcontainers}
    <!-- info-block -->
    <div class="info-block">
        {foreach $tabcontainers as $tabcontainer}
            {node_view_gui content_node=$tabcontainer view=forside}
        {/foreach}
    </div>
  {else}
    <div class="info-block">
      <p>Opppsann... her ser det ut til å være noe galt som ikke er riktig.</p>
      <p>Noen jobber med saken.</p>
    </div>
  {/if}

<div class="tab-block" data-ng-app="tfk-recruitment-app" data-ng-controller="RecruitmentsCtrl">
    <div class="tab-content">
      <section class="holder">
            <article class="col" data-ng-repeat="r in recruitments_list.results | orderBy:predicate | limitTo:limit">
              <strong class="ledig_stilling"></strong>
              <div class="frame">
                <strong class="title"><a href="https://hrm.btvregion.no/tfk_recruitment" target="_blank">[[[ r.title ]]]</a></strong>
                <ul>
                  <li>Søknadsfrist: [[[ r.deadline | date:"dd.MM.yyyy" ]]]</li>
                  <!--<li>Stillingstype: [[[ r.contracttype ]]]</li>-->
                </ul>
              </div>
            </article>
      </section>
      <span class="link-more"><a href="https://hrm.btvregion.no/tfk_recruitment" target="_blank">SE ALLE LEDIGE STILLINGER</a></span>
    </div>
</div>

