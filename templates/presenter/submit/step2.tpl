{**
 * step2.tpl
 *
 * Copyright (c) 2003-2004 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 2 of presenter paper submission.
 *
 * $Id$
 *}

{assign var="pageTitle" value="presenter.submit.step2"}
{include file="presenter/submit/submitHeader.tpl"}
<p>{translate key="presenter.submit.metadataDescription"}</p>
<h3>{translate key="presenter.submit.privacyStatement"}</h3>
<br />
{$schedConfSettings.privacyStatement|nl2br}

<div class="separator"></div>

<form name="submit" method="post" action="{url op="saveSubmit" path=$submitStep}">
<input type="hidden" name="paperId" value="{$paperId}" />
{include file="common/formErrors.tpl"}

{literal}
<script type="text/javascript">
<!--
// Move presenter up/down
function movePresenter(dir, presenterIndex) {
	var form = document.submit;
	form.movePresenter.value = 1;
	form.movePresenterDir.value = dir;
	form.movePresenterIndex.value = presenterIndex;
	form.submit();
}
// -->
</script>
{/literal}

<h3>{translate key="paper.presenters"}</h3>
<p>{translate key="presenter.submit.presentersDescription"}</p>
<input type="hidden" name="deletedPresenters" value="{$deletedPresenters|escape}" />
<input type="hidden" name="movePresenter" value="0" />
<input type="hidden" name="movePresenterDir" value="" />
<input type="hidden" name="movePresenterIndex" value="" />

{foreach name=presenters from=$presenters key=presenterIndex item=presenter}
<input type="hidden" name="presenters[{$presenterIndex}][presenterId]" value="{$presenter.presenterId|escape}" />
<input type="hidden" name="presenters[{$presenterIndex}][seq]" value="{$presenterIndex+1}" />
{if $smarty.foreach.presenters.total <= 1}
<input type="hidden" name="primaryContact" value="{$presenterIndex}" />
{/if}

<table width="100%" class="data">
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-$presenterIndex-firstName" required="true" key="user.firstName"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="presenters[{$presenterIndex}][firstName]" id="presenters-{$presenterIndex}-firstName" value="{$presenter.firstName|escape}" size="20" maxlength="40" /></td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-$presenterIndex-middleName" key="user.middleName"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="presenters[{$presenterIndex}][middleName]" id="presenters-{$presenterIndex}-middleName" value="{$presenter.middleName|escape}" size="20" maxlength="40" /></td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-$presenterIndex-lastName" required="true" key="user.lastName"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="presenters[{$presenterIndex}][lastName]" id="presenters-{$presenterIndex}-lastName" value="{$presenter.lastName|escape}" size="20" maxlength="90" /></td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-$presenterIndex-affiliation" key="user.affiliation"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="presenters[{$presenterIndex}][affiliation]" id="presenters-{$presenterIndex}-affiliation" value="{$presenter.affiliation|escape}" size="30" maxlength="255"/></td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-$presenterIndex-country" key="common.country"}</td>
	<td width="80%" class="value">
		<select name="presenters[{$presenterIndex}][country]" id="presenters-{$presenterIndex}-country" class="selectMenu">
			<option value=""></option>
			{html_options options=$countries selected=$presenter.country}
		</select>
	</td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-$presenterIndex-email" required="true" key="user.email"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="presenters[{$presenterIndex}][email]" id="presenters-{$presenterIndex}-email" value="{$presenter.email|escape}" size="30" maxlength="90" /></td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-$presenterIndex-url" key="user.url"}</td>
	<td width="80%" class="value">
		<input type="text" class="textField" name="presenters[{$presenterIndex}][url]" id="presenters-{$presenterIndex}-url" value="{$presenter.url|escape}" size="30" maxlength="90" /><br/>
		<span class="instruct">{translate key="user.url.description"}</span>
	</td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-$presenterIndex-biography" key="user.biography"}<br />{translate key="user.biography.description"}</td>
	<td width="80%" class="value"><textarea name="presenters[{$presenterIndex}][biography]" class="textArea" id="presenters-{$presenterIndex}-biography" rows="5" cols="40">{$presenter.biography|escape}</textarea></td>
</tr>
{if $smarty.foreach.presenters.total > 1}
<tr valign="top">
	<td colspan="2">
		{translate key="presenter.submit.reorderPresenterName"} <a href="javascript:movePresenter('u', '{$presenterIndex}')" class="action">&uarr;</a> <a href="javascript:movePresenter('d', '{$presenterIndex}')" class="action">&darr;</a><br/>
		{translate key="presenter.submit.reorderInstructions"}
	</td>
</tr>
<tr valign="top">
	<td width="80%" class="value" colspan="2"><input type="radio" name="primaryContact" value="{$presenterIndex}"{if $primaryContact == $presenterIndex} checked="checked"{/if} /> <label for="primaryContact">{translate key="presenter.submit.selectPrincipalContact"}</label> <input type="submit" name="delPresenter[{$presenterIndex}]" value="{translate key="presenter.submit.deletePresenter"}" class="button" /></td>
</tr>
<tr>
	<td colspan="2"><br/></td>
</tr>
{/if}
</table>
{foreachelse}
<input type="hidden" name="presenters[0][presenterId]" value="0" />
<input type="hidden" name="primaryContact" value="0" />
<input type="hidden" name="presenters[0][seq]" value="1" />
<table width="100%' class="data">
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-0-firstName" required="true" key="user.firstName"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="presenters[0][firstName]" id="presenters-0-firstName" size="20" maxlength="40" /></td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-0-middleName" key="user.middleName"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="presenters[0][middleName]" id="presenters-0-middleName" size="20" maxlength="40" /></td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-0-lastName" required="true" key="user.lastName"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="presenters[0][lastName]" id="presenters-0-lastName" size="20" maxlength="90" /></td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-0-affiliation" key="user.affiliation"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="presenters[0][affiliation]" id="presenters-0-affiliation" size="30" maxlength="255" /></td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-0-country" key="common.country"}</td>
	<td width="80%" class="value">
		<select name="presenters[0][country]" id="presenters-0-country" class="selectMenu">
			<option value=""></option>
			{html_options options=$countries}
		</select>
	</td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-0-email" required="true" key="user.email"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="presenters[0][email]" id="presenters-0-email" size="30" maxlength="90" /></td>
</tr>
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="presenters-0-biography" key="user.biography"}<br />{translate key="user.biography.description"}</td>
	<td width="80%" class="value"><textarea name="presenters[0][biography]" class="textArea" id="presenters-0-biography" rows="5" cols="40"></textarea></td>
</tr>
</table>
{/foreach}

<p><input type="submit" class="button" name="addPresenter" value="{translate key="presenter.submit.addPresenter"}" /></p>

<div class="separator"></div>

<h3>{translate key="submission.titleAndAbstract"}</h3>

<table width="100%" class="data">

<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="title" required="true" key="paper.title"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="title" id="title" value="{$title|escape}" size="60" maxlength="255" /></td>
</tr>
{if $alternateLocale1}
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="titleAlt1" key="paper.title"} ({$languageToggleLocales.$alternateLocale1|escape})</td>
	<td width="80%" class="value"><input type="text" class="textField" name="titleAlt1" id="titleAlt1" value="{$titleAlt1|escape}" size="60" maxlength="255" /></td>
</tr>
{/if}
{if $alternateLocale2}
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="titleAlt2" key="paper.title"} ({$languageToggleLocales.$alternateLocale2|escape})</td>
	<td width="80%" class="value"><input type="text" class="textField" name="titleAlt2" id="titleAlt2" value="{$titleAlt2|escape}" size="60" maxlength="255" /></td>
</tr>
{/if}

<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="abstract" key="paper.abstract" required="true"}</td>
	<td width="80%" class="value"><textarea name="abstract" id="abstract" class="textArea" rows="15" cols="60">{$abstract|escape}</textarea></td>
</tr>
{if $alternateLocale1}
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="abstractAlt1" key="paper.abstract"} ({$languageToggleLocales.$alternateLocale1|escape})</td>
	<td width="80%" class="value"><textarea name="abstractAlt1" class="textArea" id="abstractAlt1" rows="15" cols="60">{$abstractAlt1|escape}</textarea></td>
</tr>
{/if}
{if $alternateLocale2}
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="abstractAlt2" key="paper.abstract"} ({$languageToggleLocales.$alternateLocale2|escape})</td>
	<td width="80%" class="value"><textarea name="abstractAlt2" class="textArea" id="abstractAlt2" rows="15" cols="60">{$abstractAlt2|escape}</textarea></td>
</tr>
{/if}
</table>

<div class="separator"></div>

{if $track->getMetaIndexed()==1}
	<h3>{translate key="submission.indexing"}</h3>
	<p>{translate key="presenter.submit.submissionIndexingDescription"}</p>
	<table width="100%" class="data">
	{if $schedConfSettings.metaDiscipline}
	<tr valign="top">
		<td{if $schedConfSettings.metaDisciplineExamples} rowspan="2"{/if} width="20%" class="label">{fieldLabel name="discipline" key="paper.discipline"}</td>
		<td width="80%" class="value"><input type="text" class="textField" name="discipline" id="discipline" value="{$discipline|escape}" size="40" maxlength="255" /></td>
	</tr>
	{if $schedConfSettings.metaDisciplineExamples}
	<tr valign="top">
		<td><span class="instruct">{$schedConfSettings.metaDisciplineExamples|escape}</span></td>
	</tr>
	{/if}
	<tr valign="top">
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	{/if}
	
	{if $schedConfSettings.metaSubjectClass}
	<tr valign="top">
		<td rowspan="2" width="20%" class="label">{fieldLabel name="subjectClass" key="paper.subjectClassification"}</td>
		<td width="80%" class="value"><input type="text" class="textField" name="subjectClass" id="subjectClass" value="{$subjectClass|escape}" size="40" maxlength="255" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><a href="{$schedConfSettings.metaSubjectClassUrl|escape}" target="_blank">{$schedConfSettings.metaSubjectClassTitle|escape}</a></td>
	</tr>
	<tr valign="top">
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	{/if}
	
	{if $schedConfSettings.metaSubject}
	<tr valign="top">
		<td{if $schedConfSettings.metaSubjectExamples} rowspan="2"{/if} width="20%" class="label">{fieldLabel name="subject" key="paper.subject"}</td>
		<td width="80%" class="value"><input type="text" class="textField" name="subject" id="subject" value="{$subject|escape}" size="40" maxlength="255" /></td>
	</tr>
	{if $schedConfSettings.metaSubjectExamples}
	<tr valign="top">
		<td><span class="instruct">{$schedConfSettings.metaSubjectExamples|escape}</span></td>
	</tr>
	{/if}
	<tr valign="top">
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	{/if}
	
	{if $schedConfSettings.metaCoverage}
	<tr valign="top">
		<td{if $schedConfSettings.metaCoverageGeoExamples} rowspan="2"{/if} width="20%" class="label">{fieldLabel name="coverageGeo" key="paper.coverageGeo"}</td>
		<td width="80%" class="value"><input type="text" class="textField" name="coverageGeo" id="coverageGeo" value="{$coverageGeo|escape}" size="40" maxlength="255" /></td>
	</tr>
	{if $schedConfSettings.metaCoverageGeoExamples}
	<tr valign="top">
		<td><span class="instruct">{$schedConfSettings.metaCoverageGeoExamples|escape}</span></td>
	</tr>
	{/if}
	<tr valign="top">
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr valign="top">
		<td{if $schedConfSettings.metaCoverageChronExamples} rowspan="2"{/if} width="20%" class="label">{fieldLabel name="coverageChron" key="paper.coverageChron"}</td>
		<td width="80%" class="value"><input type="text" class="textField" name="coverageChron" id="coverageChron" value="{$coverageChron|escape}" size="40" maxlength="255" /></td>
	</tr>
	{if $schedConfSettings.metaCoverageChronExamples}
	<tr valign="top">
		<td><span class="instruct">{$schedConfSettings.metaCoverageChronExamples|escape}</span></td>
	</tr>
	{/if}
	<tr valign="top">
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr valign="top">
		<td{if $schedConfSettings.metaCoverageResearchSampleExamples} rowspan="2"{/if} width="20%" class="label">{fieldLabel name="coverageSample" key="paper.coverageSample"}</td>
		<td width="80%" class="value"><input type="text" class="textField" name="coverageSample" id="coverageSample" value="{$coverageSample|escape}" size="40" maxlength="255" /></td>
	</tr>
	{if $schedConfSettings.metaCoverageResearchSampleExamples}
	<tr valign="top">
		<td><span class="instruct">{$schedConfSettings.metaCoverageResearchSampleExamples|escape}</span></td>
	</tr>
	{/if}
	<tr valign="top">
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	{/if}
	
	{if $schedConfSettings.metaType}
	<tr valign="top">
		<td width="20%" {if $schedConfSettings.metaTypeExamples}rowspan="2" {/if}class="label">{fieldLabel name="type" key="paper.type"}</td>
		<td width="80%" class="value"><input type="text" class="textField" name="type" id="type" value="{$type|escape}" size="40" maxlength="255" /></td>
	</tr>

	{if $schedConfSettings.metaTypeExamples}
	<tr valign="top">
		<td><span class="instruct">{$schedConfSettings.metaTypeExamples|escape}</span></td>
	</tr>
	{/if}
	<tr valign="top">
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	{/if}
	
	<tr valign="top">
		<td rowspan="2" width="20%" class="label">{fieldLabel name="language" key="paper.language"}</td>
		<td width="80%" class="value"><input type="text" class="textField" name="language" id="language" value="{$language|escape|default:en}" size="5" maxlength="10" /></td>
	</tr>
	<tr valign="top">
		<td><span class="instruct">{translate key="presenter.submit.languageInstructions"}</span></td>
	</tr>
	</table>

<div class="separator"></div>

{/if}


<h3>{translate key="presenter.submit.submissionSupportingAgencies"}</h3>
<p>{translate key="presenter.submit.submissionSupportingAgenciesDescription"}</p>

<table width="100%" class="data">
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="sponsor" key="presenter.submit.agencies"}</td>
	<td width="80%" class="value"><input type="text" class="textField" name="sponsor" id="sponsor" value="{$sponsor|escape}" size="60" maxlength="255" /></td>
</tr>
</table>

<div class="separator"></div>

<p><input type="submit" value="{translate key="common.saveAndContinue"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="confirmAction('{url page="presenter"}', '{translate|escape:"javascript" key="presenter.submit.cancelSubmission"}')" /></p>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

</form>

{include file="common/footer.tpl"}