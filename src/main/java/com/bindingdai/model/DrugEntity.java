package com.bindingdai.model;

import javax.persistence.*;

/**
 * Created by daibinding on 16/7/5.
 */
@Entity
@Table(name = "drug", schema = "ElectronicHealthRecord", catalog = "")
public class DrugEntity {
    private int iddrug;
    private String drugname;
    private String drugspec;
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
    @Column(name = "drugname", nullable = true, length = 45)
    public String getDrugname() {
        return drugname;
    }

    public void setDrugname(String drugname) {
        this.drugname = drugname;
    }

    @Basic
    @Column(name = "drugspec", nullable = true, length = 45)
    public String getDrugspec() {
        return drugspec;
    }

    public void setDrugspec(String drugspec) {
        this.drugspec = drugspec;
    }

    @Basic
    @Column(name = "drugProduceCompany", nullable = true, length = 45)
    public String getDrugProduceCompany() {
        return drugProduceCompany;
    }

    public void setDrugProduceCompany(String drugProduceCompany) {
        this.drugProduceCompany = drugProduceCompany;
    }

    @Basic
    @Column(name = "drugPerPrize", nullable = true, length = 45)
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
        if (drugname != null ? !drugname.equals(that.drugname) : that.drugname != null) return false;
        if (drugspec != null ? !drugspec.equals(that.drugspec) : that.drugspec != null) return false;
        if (drugProduceCompany != null ? !drugProduceCompany.equals(that.drugProduceCompany) : that.drugProduceCompany != null)
            return false;
        if (drugPerPrize != null ? !drugPerPrize.equals(that.drugPerPrize) : that.drugPerPrize != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = iddrug;
        result = 31 * result + (drugname != null ? drugname.hashCode() : 0);
        result = 31 * result + (drugspec != null ? drugspec.hashCode() : 0);
        result = 31 * result + (drugProduceCompany != null ? drugProduceCompany.hashCode() : 0);
        result = 31 * result + (drugPerPrize != null ? drugPerPrize.hashCode() : 0);
        return result;
    }
}
