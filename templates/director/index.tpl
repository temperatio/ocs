{**
 * index.tpl
 *
 * Copyright (c) 2003-2004 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Director index.
 *
 * $Id$
 *}

{assign var="pageTitle" value="director.home"}
{assign var="pageCrumbTitle" value="user.role.director"}
{include file="common/header.tpl"}

<h3>{translate key="paper.submissions"}</h3>

<ul class="plain">
	<li>&#187; <a href="{url op="submissions" path="submissionsUnassigned"}">{translate key="common.queue.short.submissionsUnassigned"}</a>&nbsp;({if $submissionsCount[0]}{$submissionsCount[0]}{else}0{/if})</li>
	<li>&#187; <a href="{url op="submissions" path="submissionsInReview"}">{translate key="common.queue.short.submissionsInReview"}</a>&nbsp;({if $submissionsCount[1]}{$submissionsCount[1]}{else}0{/if})</li>
	<li>&#187; <a href="{url op="submissions" path="submissionsInEditing"}">{translate key="common.queue.short.submissionsInEditing"}</a>&nbsp;({if $submissionsCount[2]}{$submissionsCount[2]}{else}0{/if})</li>
	<li>&#187; <a href="{url op="submissions" path="submissionsAccepted"}">{translate key="common.queue.short.submissionsAccepted"}</a></li>
	<li>&#187; <a href="{url op="submissions" path="submissionsArchives"}">{translate key="common.queue.short.submissionsArchives"}</a></li>
	{call_hook name="Templates::Director::Index::Submissions"}
</ul>

<br />

<ul class="plain">
	<li>&#187; <a href="{url op="timeline"}">{translate key="director.timeline"}</a></li>
</ul>

{include file="common/footer.tpl"}