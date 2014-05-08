<nav>
    <ul class="top-nav">
       {section loop=$node.object.related_contentobject_array}
            <li><a href={$:item.main_node.url|ezurl}>{$:item.name}</a></li>    
        {/section}
    </ul>
</nav>