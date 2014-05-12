<div class="content">
    <div class="constrained-content">

        {def $campaigns=fetch( 'content', 'list', hash( 'parent_node_id', '2',
                                                           'class_filter_type', 'include',
                                                           'class_filter_array', array( 'kampanjecontainer' ) ) ) }

        {if $campaigns}
            {foreach $campaigns as $campaign}
                {node_view_gui content_node=$campaign view=full}
            {/foreach}
        {/if}

        {def $slogans=array()}
        {def $slogans_count = 0}
        {def $slogans=fetch( 'content', 'list', hash( 'parent_node_id', '7184',
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'did_u_know_line' ) ) ) }
        {def $slogans_count=$slogans|count()}
        {def $random_slogan=$slogans[rand(0, sub($slogans_count, 1))]}
  
        {undef $slogans_count}
        {undef $slogans}

        <div class="social-block quote">
            <div class="social-block__social-links">
                <ul class="social-links">
                    <li><a href="https://www.facebook.com/telemarkfylke" title="Følg oss på Facebook" target="_blank" class="social-links__link"><span title="Facebook" class="social-links__link__icon icon--facebook"></span><span class="visuallyhidden">Facebook</span></a></li>
                    <li><a href="https://twitter.com/telemarkfylke" title="Følg oss på Twitter" target="_blank" class="social-links__link"><span title="Twitter" class="social-links__link__icon icon--twitter"></span><span class="visuallyhidden">Twitter</span></a></li>
                    <li><a href="https://plus.google.com/108353607427028279455/" title="Følg oss på Google+" target="_blank" class="social-links__link"><span title="Google+" class="social-links__link__icon icon--google"></span><span class="visuallyhidden">Google+</span></a></li>
                    <li><a href="http://www.telemark.no/rss/feed/aktuelt" title="Abonner på siste nytt via rss" target="_blank" class="social-links__link"><span title="RSS-feed" class="social-links__link__icon icon--rss"></span><span class="visuallyhidden">RSS-feed</span></a></li>
                    <li><a href="mailto:post@t-fk.no" title="Send oss en e-post" class="social-links__link"><span title="Send oss en e-post" class="social-links__link__icon icon--mailto"></span><span class="visuallyhidden">Send oss en e-post</span></a></li>
                </ul>
            </div>
            <div class="social-block__other">{$random_slogan.data_map.entry.data_text}</div>
        </div>
    </div>
</div>


{def $tabcontainers=fetch( 'content', 'list', hash( 'parent_node_id', '2',
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'tabboks' ) ) ) }

{if $tabcontainers}
     <div class="content highlight">
        <div class="constrained-content">
            {foreach $tabcontainers as $tabcontainer}
                {node_view_gui content_node=$tabcontainer view=forside}
            {/foreach}
        </div>
    </div>
{else}
    <div class="content highlight">
        <div class="constrained-content">
            <p>Opppsann... her ser det ut til å være noe galt som ikke er riktig.</p>
            <p>Noen jobber med saken.</p>
        </div>
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

