package com.bindingdai.model;

import javax.persistence.*;

/**
 * Created by daibinding on 16/6/24.
 */
@Entity
@Table(name = "drug", schema = "ElectronicHealthRecord", catalog = "")
public class DrugEntity {
    private int iddrug;
    private String drugName;
    private String drugSpec;
    private String drugProduceCompany;
    private String drugPerPrize;

    @Id
    @Column(name = "iddrug", nullable = false)
    public int getIddrug() {
        return iddrug;
    }

    public void setIddrug(int iddrug) {
        this.iddrug = iddrug;
    }

    @Basic
    @Column(name = "drug_name", nullable = true, length = 45)
    public String getDrugName() {
        return drugName;
    }

    public void setDrugName(String drugName) {
        this.drugName = drugName;
    }

    @Basic
    @Column(name = "drug_spec", nullable = true, length = 45)
    public String getDrugSpec() {
        return drugSpec;
    }

    public void setDrugSpec(String drugSpec) {
        this.drugSpec = drugSpec;
    }

    @Basic
    @Column(name = "drug_produce_company", nullable = true, length = 45)
    public String getDrugProduceCompany() {
        return drugProduceCompany;
    }

    public void setDrugProduceCompany(String drugProduceCompany) {
        this.drugProduceCompany = drugProduceCompany;
    }

    @Basic
    @Column(name = "drug_per_prize", nullable = true, length = 45)
    public String getDrugPerPrize() {
        return drugPerPrize;
    }

    public void setDrugPerPrize(String drugPerPrize) {
        this.drugPerPrize = drugPerPrize;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DrugEntity that = (DrugEntity) o;

        if (iddrug != that.iddrug) return false;
        if (drugName != null ? !drugName.equals(that.drugName) : that.drugName != null) return false;
        if (drugSpec != null ? !drugSpec.equals(that.drugSpec) : that.drugSpec != null) return false;
        if (drugProduceCompany != null ? !drugProduceCompany.equals(that.drugProduceCompany) : that.drugProduceCompany != null)
            return false;
        if (drugPerPrize != null ? !drugPerPrize.equals(that.drugPerPrize) : that.drugPerPrize != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = iddrug;
        result = 31 * result + (drugName != null ? drugName.hashCode() : 0);
        result = 31 * result + (drugSpec != null ? drugSpec.hashCode() : 0);
        result = 31 * result + (drugProduceCompany != null ? drugProduceCompany.hashCode() : 0);
        result = 31 * result + (drugPerPrize != null ? drugPerPrize.hashCode() : 0);
        return result;
    }
}
