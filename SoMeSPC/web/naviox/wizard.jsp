
<%
    Servlets.setCharacterEncoding(request, response);
%>
<%@include file="../xava/imports.jsp"%>
<%@page import="org.openxava.web.servlets.Servlets"%>
<%@page import="org.openxava.util.Locales"%>
<%@page import="com.openxava.naviox.web.NaviOXStyle"%>
<jsp:useBean id="context" class="org.openxava.controller.ModuleContext" scope="session" />
<jsp:useBean id="modules" class="com.openxava.naviox.Modules" scope="session" />
<%
    String oxVersion = org.openxava.controller.ModuleManager
					.getVersion();
%>

<!DOCTYPE html>
<html lang="pt-br">

  <head>
    <meta charset='utf-8' />
    <meta http-equiv="X-UA-Compatible" content="chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<link rel="icon" href="<%=request.getContextPath()%>/naviox/images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/naviox/images/favicon.ico" type="image/x-icon" />	
	
	<!-- CSS Modules -->
	<link href="style/loading.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="angularWizard/angular-wizard.css">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">	    
	<link href="<%=request.getContextPath()%>/naviox/style/naviox.css" rel="stylesheet" type="text/css">
	<link href="style/wizard.css" rel="stylesheet"  type="text/css">
	
	<%-- Naviox --%>
	<script type='text/javascript' src='<%=request.getContextPath()%>/xava/js/dwr-engine.js?ox=<%=oxVersion%>'></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Modules.js?ox=<%=oxVersion%>'></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Folders.js?ox=<%=oxVersion%>'></script>
    
	<!-- Angular Modules - Wizard and Angular JS -->
    <script type="text/javascript" src="js/angular/shared/angular.min.js"></script>
    <script type="text/javascript" src="angularWizard/lodash.js"></script>
    <script type="text/javascript" src="angularWizard/angular-wizard.js"></script>    
	<script type='text/javascript' src='js/angular/shared/angular-route.min.js'></script>
	<script type='text/javascript' src='js/angular/shared/angular-resource.min.js'></script>
	<script type='text/javascript' src='js/angular/shared/angular-filter.js'></script>
	
	<!-- Custom Modules -->
	<script type="text/javascript" src="js/angular/angularWizard.js"></script>
	<!-- Controllers -->
	<script type="text/javascript" src="js/angular/controllers/IntegratorController.js"></script>
	<!-- Services -->
	<script type="text/javascript" src="js/angular/services/IntegratorService.js"></script>

	<%--  JQuery --%>
	<script type='text/javascript' src="js/jquery.js"></script>
	<script type='text/javascript' src="js/jquery-ui.js"></script>
	
	<%--  Bootstrap --%>
	<script type='text/javascript' src='bootstrap/js/bootstrap.min.js'></script>
	<link rel='stylesheet' href='<%=request.getContextPath()%>/naviox/js/themes/default/style.min.css' />
	<script type='text/javascript' src='<%=request.getContextPath()%>/naviox/js/typewatch.js'></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/naviox/js/naviox.js'></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/naviox/js/jstree.min.js'></script>

    <title>SoMeSPC Wizard</title>
  </head>

  <body <%=NaviOXStyle.getBodyClass(request)%> ng-app="SoMeSPCWizardApp" ng-controller="WizardCtrl">

	<div id="main_navigation" style="box-sizing: content-box !important;">
		<jsp:include page="mainNavigation.jsp" />
	</div>

	<table width="100%">
		<tr>
			<td id="modules_list">
				<div id="modules_list_popup">
					<img id="modules_list_corner" src="<%=request.getContextPath()%>/naviox/images/corner.png" />
					<div id="modules_list_outbox">
						<table id="modules_list_box">
							<tr id="modules_list_content">
								<td>
									<jsp:include page="modulesMenu.jsp" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</td>
		
			<td valign="top" class="container">
				<div class="module-wrapper">							
					<div class="row" style="margin-left: -30px;">										
						<div id="tree-row" class="col-md-3">
							<jsp:include page="menus.jsp" />							
						</div>
										
						<div id="content-row" class="col-md-8 fundo1">	
						    <div id="header_wrap" class="fundo2">
					        	<header class="text-center">
					        		<h3>Novo Plano de Medi��o Integrado</h3>
					        	</header>
						    </div>					
						    <div id="main_content_wrap" class="fundo3">				    
					      <section id="main_content">
					        <wizard on-finish="finished()">
						      <wz-step title="Instru��es">
						          <fieldset class="wizard-content">
						            <h3 class="text-center">Criando um Plano de Medi��o</h3>						            
						            <div style="font-size: medium; padding-top: 10px;">
							            <p>Para utilizar este wizard, siga os seguintes passos:</p>
							            <p>
							            	<ul id="descricao-wizard" style="list-style-type: decimal; padding-left: 50px; padding-top: 20px;">
												<li>Selecione os objetivos de medi��o que deseja monitorar e a periodicidade de coleta das medidas.</li>
												<li>Os passos do wizard se adaptam para exibir a tela de login da ferramenta respons�vel pela coleta das medidas vinculadas aos objetivos selecionados. Preencha os dados necess�rios e siga em frente.</li>
												<li>Pesquise e selecione os projetos para os quais deseja criar os planos de medi��o e siga em frente para a tela de resumo</li>
												<li>Avalie se tudo foi preenchido corretamente e cliquei em finalizar.</li>
											</ul>  
							            </p>
						            </div>
						          </fieldset>
						         	<nav>
									  <div class="pager pager-size">							  	
					            		<input type="button" class="nav navbar-nav navbar-right btn-wizard" wz-next value="Pr�ximo" />					    
									  </div>
								  	</nav>	
					          </wz-step>
					          <wz-step title="Objetivos e Medidas" canexit="validacao_Dados">
 								<fieldset class="wizard-content container">		
					            	<div class="row text-center" style="font-size:14px; color:red; margin-top: 10px;">
					            		<b>{{mensagem_Objetivos}}</b>
					            	</div>
					            	<div class="row2">
										<div class="label">Selecione os Objetivos de Medi��o:</div>
									</div>
					            	<div class="bg-objetivos">					            	
										<div class="row2" style="font-size: 14px; " ng-repeat="(OE, OMs) in itens | groupBy: 'nome_ObjetivoEstrategico'">		
											<div class="row2 fonte" style="padding-left: 15px;">
												<b>OE - {{OE}}</b>	
											</div>
											<div>
												<div id="itens" class="row" ng-repeat="(OM, items) in OMs | groupBy: 'nome_ObjetivoDeMedicao'">									
													<div class="row fonte">
														<label for="checkbox_{{$index}}" class="row">
															<input class="col-md-1" style="margin-top: 15px; margin-left: -5px !important; margin-right: 5px !important;"  
																		id="checkbox_{{OM}}_{{$index}}"  
																		type="checkbox" ng-checked="itens_selected.indexOf(item) > -1"
																		ng-click="toggleSelectionItem(items)" 
																		ng-model=show ng-class='{open:show}'/>		
															<span class="col-md-8 objetivo-medicao">
																<b><i>OM - {{OM}}</i></b>									
															</span>
														</label>
													</div>
													<div ng-show=show class="row fonte">
														<div class="col-md-12" ng-repeat="i in items">
															<span class="row" style="margin-bottom: -10px;">	
																<span class="necessidade-informacao">											
																	NI - {{i.nome_NecessidadeDeInformacao}}
																</span>												
															</span>											
															<span class="row">											
																<span class="medida">												
																	<i>ME - {{i.nome_Medida}}</i>
																</span>
															</span>										
														</div>
													</div>
												</div>
												</div>
											
											</div>
										</div>
											<div class="row" style="margin-right: 30px;">		            
						            		<div class="row2">
												<div class="label">Selecione a periodicidade:</div>
											</div>
											<select class="form-control" id="selectPeriodicidades" ng-model="periodicidade.selecionada"
												ng-options="periodicidades[periodicidades.indexOf(p)].nome for p in periodicidades">
											</select>					
										</div>
									</fieldset>
									<nav>
									  <div class="pager pager-size">
									  	<input type="button" class="nav navbar-nav navbar-left btn-wizard"  wz-previous value="Anterior" />							  	
					            		<input type="button" class="nav navbar-nav navbar-right btn-wizard" wz-next ng-click="validacao_DadosTaiga()" value="Pr�ximo" />					    
									  </div>
								  	</nav>						
					          </wz-step>
					          <wz-step title="Conex�o Taiga" wz-disabled="{{disabledTaiga}}">
								<fieldset class="wizard-content container">
									<form name="loginFormTaiga" novalidate>
										<div class="row2">
											<h3 class="text-center">Conex�o com o Taiga</h3>
										</div>
										<div class="row">
											<div class="row2">
												<div class="label"><strong>URL *</strong></div>
											</div>
											<input id="url" class="form-control" placeholder="URL do servidor do Taiga" type="text" name="url" ng-model="loginTaiga.url" required>
											<span style="color: red" ng-show="loginFormTaiga.url.$dirty && loginFormTaiga.url.$invalid">
												<span ng-show="loginFormTaiga.url.$error.required">Digite a URL.</span>
												<span ng-show="loginFormTaiga.url.$error.url">Endere�o de URL inv�lido.</span>
											</span>
											<br />
											<br />
											<div class="row2">
												<div class="label"><strong>Usu�rio *</strong></div>
											</div>
											<input id="usuario" class="form-control" placeholder="Usu�rio do Taiga" type="text" name="usuario" ng-model="loginTaiga.usuario" required>
											<span style="color: red" ng-show="loginFormTaiga.usuario.$dirty && loginFormTaiga.usuario.$invalid">
												<span ng-show="loginFormTaiga.usuario.$error.required">Digite o Nome do Usu�rio.</span>
											</span>
											<br />
											<br />
											<div class="row2">
												<div class="label"><strong>Senha *</strong></div>
											</div>
											<input id="password" class="form-control" type="password" name="password" ng-model="loginTaiga.senha" required>
											<span style="color: red" ng-show="loginFormTaiga.password.$dirty && loginFormTaiga.password.$invalid">
												<span ng-show="loginFormTaiga.password.$error.required">Digite a Senha.</span>
											</span>
										</div>
									</form>
								</fieldset>
									<nav>
									  <div class="pager pager-size">
									  	<input type="button" class="nav navbar-nav navbar-left btn-wizard"  wz-previous value="Anterior" />							  	
					            		<input type="button" class="nav navbar-nav navbar-right btn-wizard" ng-click="post_projetoTaiga()" wz-next value="Pr�ximo" />					    
									  </div>
								  	</nav>	
					          </wz-step>
					          <wz-step title="Projetos Taiga" canexit="validacao_DadosProjetoTaiga" wz-disabled="{{disabledTaiga}}">
									<fieldset class="wizard-content">	
										<div class="row text-center" style="font-size:14px; color:red; margin-top: 10px;">
					            			<b>{{mensagem_Projetos}}</b>
					            		</div>
										<div class="row2">
											<h3 class="text-center">Projetos dispon�veis no Taiga</h3>
										</div>	
										<div class="row">												
											<div class="col-md-11">	
												<div class="label"><strong>Pesquisar</strong></div>
												<input class="form-control" ng-model="query" type="text" placeholder="Digite para pesquisar..." autofocus>
											</div>											
										</div>	
										<div class="projetos">
											<div class="row" ng-repeat="projeto in projetosTaiga | filter: query | orderBy: 'nome' ">
												<div class="col-md-12">													
													<div class="row">
														<label class="checkbox" for="projeto_taiga_{{$index}}">
															<input id="projeto_taiga_{{$index}}"  type="checkbox"
															ng-checked="projetosSelecionados_taiga.indexOf(projeto) > -1"
															ng-click="toggleSelectionProjeto_Taiga(projeto)" />
															<div style="padding-top: 4px;">
																<p>
																	<b>Projeto: {{projeto.nome}} ({{projeto.apelido}})</b>
																</p>
																<p style="width: 600px; font-weight: normal !important;">{{projeto.descricao}}</p>
															</div>	
														</label>
													</div>
												</div>
											</div>
										</div>
									</fieldset>
									<nav>
									  <div class="pager pager-size">
									  	<input type="button" class="nav navbar-nav navbar-left btn-wizard"  wz-previous value="Anterior" />							  	
					            		<input type="button" class="nav navbar-nav navbar-right btn-wizard" wz-next ng-click="validacao_DadosSonar()" value="Pr�ximo" />					    
									  </div>
								  	</nav>
					          </wz-step>
					          <wz-step title="Conex�o Sonar"  wz-disabled="{{disabledSonar}}">
									<fieldset class="wizard-content container">
										<div class="row2">
											<h3 class="text-center">Conex�o com o SonarQube</h3>
										</div>
										<form name="loginFormSonar" novalidate>
											<div class="row2">
												<div class="label"><strong>URL *</strong></div>
											</div>
											<div class="row" style="margin-right: 20px;">												
												<input class="form-control" placeholder="URL do servidor SonarQube" type="url" name="url" ng-model="loginSonar.url" required>
												<span style="color: red" ng-show="loginFormSonar.url.$dirty && loginFormSonar.url.$invalid">
													<span ng-show="loginFormSonar.url.$error.required">Digite a URL.</span>
													<span ng-show="loginFormSonar.url.$error.url">Endere�o de URL inv�lido.</span>
												</span>
											</div>
										</form>
									</fieldset>
									<nav>
									  <div class="pager pager-size">
									  	<input type="button" class="nav navbar-nav navbar-left btn-wizard"  wz-previous  ng-click="validacao_DadosTaigaRetorno()" value="Anterior" />							  	
					            		<input type="button" class="nav navbar-nav navbar-right btn-wizard" ng-click="post_projetoSonar()" wz-next value="Pr�ximo" />					    
									  </div>
								  	</nav>
					          </wz-step>
					          <wz-step title="Projetos Sonar"  canexit="validacao_DadosProjetoSonar" wz-disabled="{{disabledSonar}}">
									<fieldset class="wizard-content">
										<div class="row text-center" style="font-size:14px; color:red; margin-top: 10px;">
					            			<b>{{mensagem_Projetos}}</b>
					            		</div>
										<div class="row2">
											<h3 class="text-center">Projetos dispon�veis no SonarQube</h3>
										</div>
										<div class="row">												
											<div class="col-md-11">	
												<div class="label"><strong>Pesquisar</strong></div>
												<input class="form-control" ng-model="query" type="text" placeholder="Digite para pesquisar..." autofocus>
											</div>											
										</div>	
										<div class="projetos">
											<div id="projetosSonar" class="row" ng-repeat="projeto in projetosSonar | filter: query | orderBy: 'name' ">	
												<div class="col-md-12">											
													<div class="row">			
														<label class="checkbox" for="projeto_sonar_{{$index}}">
															<input id="projeto_sonar_{{$index}}" type="checkbox"
															ng-checked="projetosSelecionados_sonar.indexOf(projeto) > -1"
															ng-click="toggleSelectionProjeto_Sonar(projeto)" />		
															<div style="padding-top: 4px;">
																<p>
																	<b>Projeto: {{projeto.name}}</b>
																</p>
															</div>														
														</label>	
													</div>
												</div>
											</div>
										</div>
									</fieldset>
									<nav>
									  <div class="pager pager-size">
									  	<input type="button" class="nav navbar-nav navbar-left btn-wizard"  wz-previous value="Anterior" />							  	
					            		<input type="button" class="nav navbar-nav navbar-right btn-wizard" wz-next value="Pr�ximo" />					    
									  </div>
								  	</nav>
					          </wz-step>
					           <wz-step title="Resumo">
									<fieldset class="wizard-content container">
										<div class="row2">
											<h3 class="text-center">Resumo do Plano de Medi��o</h3>
										</div>
										<div class="row">
											<div class="col-md-5">
												<div class="row">
													<div class="row2">
														<div class="label"><strong>Projeto(s) do Taiga:</strong></div>
													</div>
													<div class="projetos-resumo">
														<ul>
															<span ng-repeat="projeto in projetosSelecionados_taiga">
																<li style="margin-bottom: 5px;">{{projeto.nome}}</li>
															</span>
														</ul>
													</div>
												</div>										
												<div class="row">
													<div class="row2">
														<div class="label"><strong>Projeto(s) do SonarQube:</strong></div>
													</div>
													<div class="projetos-resumo">
														<ul>
															<span ng-repeat="projeto in projetosSelecionados_sonar">
																<li style="margin-bottom: 5px;">{{projeto.name}}</li>
															</span>
														</ul>
													</div>
												</div>
												<div class="row">
													<div class="row2">
														<div class="label"><strong>Periodicidade da coleta:</strong></div>
													</div>
													<div class="periodicidade-resumo">
														{{periodicidade.selecionada.nome}}
													</div>													
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="row2">
														<div class="label"><strong>Medida(s) para coleta: </strong></div>
													</div>
													<div class="medidas-resumo">
														<ul>
															<span ng-repeat="medida in itens_selected">
																<li style="margin-bottom: 10px;">{{medida.nome_Medida}}</li>
															</span>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</fieldset>
									<nav>
									  <div class="pager pager-size">
									  	<input type="button" class="nav navbar-nav navbar-left btn-wizard"  wz-cancel ng-click="validacao_RetornoResumo()" value="Reiniciar" />							  	
					            		<input type="button" class="nav navbar-nav navbar-right btn-wizard" ng-click="post_plano()" wz-next value="Finalizar" />					    
									  </div>
								  	</nav>
					          </wz-step>
					          
					        </wizard>
					      </section>
					    </div>  
	  					</div>		
    				</div>
  				</div>
  			</td>
  		</tr>
  	</table>
  	
  	 <%-- Loading --%>
	<div class="overlay" ng-show="loading"></div>
	<div class="modal-message" ng-show="loading">
		<h5>
			<b>Processando...</b>
		</h5>
		<div id="squaresWaveG">
			<div id="squaresWaveG_1" class="squaresWaveG"></div>
			<div id="squaresWaveG_2" class="squaresWaveG"></div>
			<div id="squaresWaveG_3" class="squaresWaveG"></div>
			<div id="squaresWaveG_4" class="squaresWaveG"></div>
			<div id="squaresWaveG_5" class="squaresWaveG"></div>
			<div id="squaresWaveG_6" class="squaresWaveG"></div>
			<div id="squaresWaveG_7" class="squaresWaveG"></div>
			<div id="squaresWaveG_8" class="squaresWaveG"></div>
		</div>
	</div> 	
  	
  	<script>
  	$(function() {
			naviox.init();

			$('#menu_tree').jstree({
				"core" : {
					"themes" : {
						"dots" : false
					}
				},
				"plugins" : [ "state", "types" ]
			});

			var partesUrl = window.location.href.split("/");
			var moduloAtual = partesUrl[partesUrl.length - 1];

			if (moduloAtual == 'painel.jsp')
				$('#menu_tree').jstree('select_node', 'PainelControle');
			else if (moduloAtual == 'wizard.jsp')
				$('#menu_tree').jstree('select_node','Wizard');
			else
				$('#menu_tree').jstree('select_node', '#' + moduloAtual);

			$('#menu_tree').on("changed.jstree", function(e, data) {
				var href = data.node.a_attr.href;
				window.location = href;
			});
		});
	</script>
  	
  </body>
</html>