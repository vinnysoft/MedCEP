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
package org.somespc.model.medicao;

import javax.persistence.*;

import org.openxava.annotations.*;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@View(members = "valorMedido")
public class ValorMedido
{

    @Id
    @TableGenerator(name="TABLE_GENERATOR", table="ID_TABLE", pkColumnName="ID_TABLE_NAME", pkColumnValue="VALOR_MEDIDO_ID", valueColumnName="ID_TABLE_VALUE")
    @GeneratedValue(strategy = GenerationType.TABLE, generator="TABLE_GENERATOR")
      @Hidden
    private Integer id;

    public Integer getId()
    {
	return id;
    }

    public void setId(Integer id)
    {
	this.id = id;
    }

    //@Stereotype("NO_CHANGE")
    protected String valorMedido;

    public String getValorMedido()
    {
	return valorMedido;
    }

    public void setValorMedido(String valorMedido)
    {
	this.valorMedido = valorMedido;
    }

    /*
     * @OneToMany(mappedBy="valorMedido")
     * private Collection<Medicao> medicao;
     * 
     * public Collection<Medicao> getMedicao() {
     * return medicao;
     * }
     * 
     * public void setMedicao(Collection<Medicao> medicao) {
     * this.medicao = medicao;
     * }
     */

    //private Medicao medicao;

    //private ValorDeEscala valorDeEscala;

}
