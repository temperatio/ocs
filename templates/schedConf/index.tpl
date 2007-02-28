{**
 * index.tpl
 *
 * Copyright (c) 2003-2004 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Scheduled conference index page. Displayed when both a conference and a
 * scheduled conference have been specified.
 *
 * $Id$
 *}

{*
 * The page and crumb titles differ here since the breadcrumbs already include
 * the conference title, but the page title doesn't.
 *}
 
{assign var="pageCrumbTitleTranslated" value=$schedConf->getTitle()}
{assign var="pageTitleTranslated" value=$schedConf->getFullTitle()}
{include file="common/header.tpl"}

<h2>{$schedConf->getSetting("location")|nl2br}</h2>
<h2>{$schedConf->getSetting('startDate')|date_format:$dateFormatLong} &ndash; {$schedConf->getSetting('endDate')|date_format:$dateFormatLong}</h2>

<br />

<div>{$schedConf->getSetting("schedConfIntroduction")|nl2br}</div>

{if $enableAnnouncementsHomepage}
	{* Display announcements *}
	<br />
	<center><h3>{translate key="announcement.announcementsHome"}</h3></center>
	{include file="announcement/list.tpl"}	
	<table width="100%">
		<tr>
			<td>&nbsp;</td>
		<tr>
			<td align="right"><a href="{url page="announcement"}">{translate key="announcement.moreAnnouncements"}</a></td>
		</tr>
	</table>
{/if}

<br />

{if $homepageImage}
<div align="center"><img src="{$publicFilesDir}/{$homepageImage.uploadName|escape}" width="{$homepageImage.width}" height="{$homepageImage.height}" border="0" alt="" /></div>
{/if}

<h3>{translate key="schedConf.contents"}</h3>

<ul class="plain">
	<li>&#187; <a href="{url page="schedConf" op="overview"}">{translate key="schedConf.overview"}</a></li>
	{if $showCFP}
		<li>&#187; <a href="{url page="schedConf" op="cfp"}">{translate key="schedConf.cfp"}</a> ({$submissionOpenDate|date_format:$dateFormatLong} - {$submissionCloseDate|date_format:$dateFormatLong})</li>
	{/if}
	{if $showSubmissionLink}<li>&#187; <a href="{url page="presenter" op="submit"}">{translate key="schedConf.proposalSubmission"}</a></li>{/if}
	<li>&#187; <a href="{url page="schedConf" op="trackPolicies"}">{translate key="schedConf.trackPolicies"}</a></li>
	<li>&#187; <a href="{url page="schedConf" op="program"}">{translate key="schedConf.program"}</a></li>
	<li>&#187; <a href="{url page="schedConf" op="proceedings"}">{translate key="schedConf.proceedings"}</a></li>
{*	<li>&#187; <a href="{url page="schedConf" op="submissions"}">{translate key="schedConf.submissions"}</a></li>
	<li>&#187; <a href="{url page="schedConf" op="papers"}">{translate key="schedConf.papers"}</a></li>
	<li>&#187; <a href="{url page="schedConf" op="discussion"}">{translate key="schedConf.discussion"}</a></li>*}
{*	<li>&#187; <a href="{url page="schedConf" op="registration"}">{translate key="schedConf.registration"}</a></li>*}
	<li>&#187; <a href="{url page="about" op="conferenceSponsorship"}">{translate key="schedConf.supporters"}</a></li>
{*	<li>&#187; <a href="{url page="schedConf" op="schedule"}">{translate key="schedConf.schedule"}</a></li> *}
{*	<li>&#187; <a href="{url page="schedConf" op="links"}">{translate key="schedConf.links"}</a></li>*}
</ul>

{$additionalHomeContent}

{include file="common/footer.tpl"}