<?php

/**
 * @defgroup plugins_reports_paper
 */
 
/**
 * @file plugins/reports/papers/index.php
 *
 * Copyright (c) 2000-2011 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Wrapper for paper report plugin.
 *
 * @ingroup plugins_reports_paper
 */

//$Id$

require_once('PaperReportPlugin.inc.php');

return new PaperReportPlugin();

?>
