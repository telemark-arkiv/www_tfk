<script type="text/javascript">

    //
    // The first section of JavaScript includes parent iframe callbacks that Pentaho content generators may call.
    //

    // mantle_initialized must be set for content generators to behave correctly with the parent window.
    var mantle_initialized=true;
</script>

<div class="content-view-full">

    <h2>{$node.object.data_map.title.content}</h2>

    {$node.object.data_map.text_top.data_text}

    <iframe src="{$node.object.data_map.pentahourl.content}" seamless width="100%" height="800" frameborder="0"></iframe>

    <br clear="all" />

    {$node.object.data_map.text_bottom.data_text}

</div>