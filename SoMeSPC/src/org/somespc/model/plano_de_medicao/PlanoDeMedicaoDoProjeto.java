/*
 * SoMeSPC - powerful tool for measurement
 * 
 * Copyright (C) 2013 Ciro Xavier Maretto
 * Copyright (C) 2015 Henrique N�spoli Castro, Vin�cius Soares Fonseca
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/lgpl.html>.
 */
package org.somespc.model.plano_de_medicao;

import javax.persistence.*;

import org.somespc.model.organizacao_de_software.*;
import org.openxava.annotations.*;

@Entity
@Views({
	@View(members = "data;" +
		"nome, " +
		"versao; " +
		"descricao; " +
		"alteracoes; " +
		"planoDeMedicaoDaOrganizacao; " +
		"projeto; " +
		"recursoHumano; " +
		"planoTree; " +
		"MedidasDoPlano { medidaPlanoDeMedicao }"),
	@View(name = "Simple", members = "nome")
})
@Tabs({
	@Tab(properties = "nome, versao", defaultOrder = "${nome} asc, ${versao} desc")
})
public class PlanoDeMedicaoDoProjeto extends PlanoDeMedicao
{

    @ManyToOne
    @ReferenceView("Simple")
    @NoCreate
    @NoModify
    private PlanoDeMedicaoDaOrganizacao planoDeMedicaoDaOrganizacao;

    @ManyToOne
    @ReferenceView("Simple")
    @NoCreate
    @NoModify
    @Required
    private Projeto projeto;

    public PlanoDeMedicaoDaOrganizacao getPlanoDeMedicaoDaOrganizacao()
    {
	return planoDeMedicaoDaOrganizacao;
    }

    public void setPlanoDeMedicaoDaOrganizacao(
	    PlanoDeMedicaoDaOrganizacao planoDeMedicaoDaOrganizacao)
    {
	this.planoDeMedicaoDaOrganizacao = planoDeMedicaoDaOrganizacao;
    }

    public Projeto getProjeto()
    {
	return projeto;
    }

    public void setProjeto(Projeto projeto)
    {
	this.projeto = projeto;
    }

}
