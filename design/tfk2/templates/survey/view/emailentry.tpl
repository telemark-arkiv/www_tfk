{default show_header=true()
         show_question_number=true()}
{if $show_header}<label for="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}">{if $show_question_number}{$question.question_number}. {/if}{$question.text|wash('xhtml')} {section show=$question.mandatory}<strong class="required">*</strong>{/section}</label>{/if}

<div class="survey-choices">
{section show=$question_result}
  <input class="box" name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" id="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" type="text" size="20" value="{$question_result.text|wash('xhtml')}" />
{section-else}
  <input class="box" name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" id="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" type="text" size="20" value="{$question.answer|wash('xhtml')}" />
{/section}
</div>
{/default}