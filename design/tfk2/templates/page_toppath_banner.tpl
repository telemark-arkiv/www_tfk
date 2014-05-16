<div class="content">
    <div class="constrained">
        <div class="media">
            <div class="media__img--right">
                <ul class="social-links social-links--small">
                    <li><a href="https://www.facebook.com/telemarkfylke" class="social-links__link social-links__link--small"><span title="Facebook" class="social-links__link__icon social-links__link__icon--small icon--facebook-16"></span><span class="visuallyhidden">Facebook</span></a></li>
                    <li><a href="https://twitter.com/telemarkfylke" class="social-links__link social-links__link--small"><span title="Twitter" class="social-links__link__icon social-links__link__icon--small icon--twitter-16"></span><span class="visuallyhidden">Twitter</span></a></li>
                    <li><a href="https://plus.google.com/108353607427028279455/" class="social-links__link social-links__link--small"><span title="Google+" class="social-links__link__icon social-links__link__icon--small icon--google-16"></span><span class="visuallyhidden">Google+</span></a></li>
                    <li><a href="http://www.linkedin.com/shareArticle?mini=true&amp;url=http%3A%2F%2Fwww.telemark.no%2FVaare-tjenester%2FArealbruk-og-transport%23.U1fBfzuMMK0.linkedin&amp;title=Arealbruk+og+transport+%2F+V%C3%A5re+tjenester+%2F+Start+-+Telemark+fylkeskommune&amp;ro=false&amp;summary=&amp;source=" class="social-links__link social-links__link--small"><span title="LinkedIn" class="social-links__link__icon social-links__link__icon--small icon--linkedin-16"></span><span class="visuallyhidden">LinkedIn</span></a></li>
                    <li><a href="mailto:post@t-fk.no" class="social-links__link social-links__link--small"><span title="Send oss en e-post" class="social-links__link__icon social-links__link__icon--small icon--mailto-16"></span><span class="visuallyhidden">Send oss en e-post</span></a></li>
                </ul>
            </div>
            <div class="media__bd">
                {include uri=concat('design:parts/', $pagedata.show_path, '.tpl')}
            </div>
        </div>
        <div class="top-image top-image--large">
            <picture><!--[if IE 9]><video style="display: none;"><![endif]-->
                  <source srcset="/{$banner_bilde.data_map.image.content.[responsive_12].full_path}" media="(min-width: 886px)">
                  <source srcset="/{$banner_bilde.data_map.image.content.[responsive_09].full_path}" media="(min-width: 600px)">
                  <source srcset="/{$banner_bilde.data_map.image.content.[responsive_06].full_path}" media="(min-width: 400px)">
                  <source srcset="/{$banner_bilde.data_map.image.content.[responsive_04].full_path}"><!--[if IE 9]></video><![endif]-->
                  <img srcset="/{$banner_bilde.data_map.image.content.[responsive_04].full_path}" alt="{$banner_bilde.data_map.image.content.alternative_text}">
            </picture>
            <!--img.top-image__img(src="/{$banner_bilde.data_map.image.content.[responsive_12].full_path}")-->
            <div class="top-image__text-wrapper">
                <div class="top-image__text">
                    <h2 class="top-image__header">{$dennemappen.data_map.banner_title.content}</h2>
                    <div class="top-image__body">
                        {$dennemappen.data_map.banner_text.content}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



{*
<div class="visual-block visual-holder">
            <div class="visual-block-holder">
                <div class="frame">
                    <div class="breadcrumbs">
                        <strong class="title">Du er her:</strong>
                        {include uri=concat('design:parts/', $pagedata.show_path, '.tpl')}
                    </div>
                    <div class="plugin-holder">
                        <!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style addthis_16x16_style">
<a title="Del på Facebook" class="addthis_button_facebook"></a>
<a title="Del på Twitter" class="addthis_button_twitter"></a>
<a title="Del på Google+" class="addthis_button_google_plusone_share"></a>
<a title="Del på LinkedIn" class="addthis_button_linkedin"></a>
<a title="Del via e-post" class="addthis_button_email"></a>
</div>
{literal}
<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4fd5e24713b656c1"></script>
{/literal}
<!-- AddThis Button END -->
                    </div>
                </div>
                <div class="intro-block">
                    <img src="/{$banner_bilde.data_map.image.content.[original].full_path}" width="968" height="268" alt="{$banner_bilde.data_map.image.content.alternative_text}">
                    <div class="text-area">
                        <strong class="title">{$dennemappen.data_map.banner_title.content}</strong>
                        <div class="holder">
                            <p>{$dennemappen.data_map.banner_text.content}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
*}