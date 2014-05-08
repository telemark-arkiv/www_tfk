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
