{* Feedback form - Full view *}

<div class="class-feedback-form">

        <div class="attribute-header">
            <h2>{$node.name|wash()}</h2>
        </div>

        {include name=Validation uri='design:content/collectedinfo_validation.tpl'
                 class='message-warning'
                 validation=$validation collection_attributes=$collection_attributes}

        <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.description}
        </div>
        
        <form method="post" action={"content/action"|ezurl}>

        <strong>{$node.data_map.sender_name.contentclass_attribute.name}</strong><br />
        <div class="attribute-sender-name">
                {attribute_view_gui attribute=$node.data_map.sender_name}
        </div>

        <strong>{$node.data_map.email.contentclass_attribute.name}</strong><br />
        <div class="attribute-email">
                {attribute_view_gui attribute=$node.data_map.email}
        </div>

        <strong>{$node.data_map.subject.contentclass_attribute.name}</strong><br />
        <div class="attribute-subject">
                {attribute_view_gui attribute=$node.data_map.subject}
        </div>

        <strong>{$node.data_map.message.contentclass_attribute.name}</strong><br />
        <div class="attribute-message">
                {attribute_view_gui attribute=$node.data_map.message}
        </div>

        <div class="content-action">
            <input type="submit" class="defaultbutton" name="ActionCollectInformation" value="{"Send form"|i18n("design/ezwebin/full/feedback_form")}" />
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
            <input type="hidden" name="ViewMode" value="full" />
        </div>
        </form>

</div>
