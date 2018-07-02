<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
	
	<#-- Include custom CSS and JS if it exists -->
	
	<#--
	<#if fileService.getFileEntry(getterUtil.getLong(systemGroupId),  0, "${globalCSSFileName}")>
		<link href="${cssIncludePath}" rel="stylesheet">
	</#if> 

	<#if fileService.getFileEntry(getterUtil.getLong(systemGroupId),  0, "${globalJSFileName}")>
		<script type="text/javascript" src="${jsIncludePath}"></script>
	</#if>
	-->
	
	<#if fileService.getFileEntry(themeDisplay.getScopeGroupId(),  0, "${localCSSFileName}")??>
		<link href="${cssDKIncludePath}" rel="stylesheet">
	</#if>
	
	<#if fileService.getFileEntry(themeDisplay.getScopeGroupId(),  0, "${localJSFileName}")??>
		<script type="text/javascript" src="${jsDKIncludePath}">alert("Hi");</script>
	</#if>
	
	<link href="https://fonts.googleapis.com/css?family=Libre+Franklin" rel="stylesheet"> 
</head>


<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div id="wrapper">


<div id="contentHeader" class="portlet-layout row">
	<div id="contentHeaderInner" class="col-md-12 portlet-column portlet-column-only yui3-dd-drop">
		<div id="layout-column_columnHeader" class="portlet-dropzone portlet-column-content portlet-column-content-only">
 			
 			<#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone") />
 			<#assign pageID = themeDisplay.getPlid() />
 
			<@liferay_portlet["runtime"]
			defaultPreferences="${freeMarkerPortletPreferences}"
			portletProviderAction=portletProviderAction.VIEW
			instanceId="${pageID}"
			portletName="com_liferay_journal_content_web_portlet_JournalContentPortlet" />
			${freeMarkerPortletPreferences.reset()}
			
		</div>
	</div>
</div>


	<header class="container-fluid-1280" id="banner" role="banner">	
		<div id="scroller" class="row headerRow">
			<div class="navbar-header" id="heading">
				<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
					<img alt="${logo_description}" height="60" src="${site_logo}" />
				</a>

				<#if show_site_name>
					<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />" style="display:none;">
						${site_name}
					</span>
				</#if>

				<#if is_setup_complete>
					<button aria-controls="navigation" aria-expanded="false" class="collapsed navbar-toggle" data-target="#navigationCollapse" data-toggle="collapse" type="button">
						<span class="icon-bar"></span>

						<span class="icon-bar"></span>

						<span class="icon-bar"></span>
					</button>

					<div id="personal-bar" class="pull-right user-personal-bar">
						<@liferay.user_personal_bar />
					</div>
				</#if>
			</div>
	
			<#include "${full_templates_path}/navigation.ftl" />
			
		</div>
	</header>

	
	<section class="container-fluid-1280" id="content">
		<h1 class="hide-accessible">${the_title}</h1>

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>

	<footer class="container-fluid-1280" id="footer" role="contentinfo">
		<div class="row">
			<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
		</div>
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>

</html>