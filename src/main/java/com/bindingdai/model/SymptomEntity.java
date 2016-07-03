package com.bindingdai.model;

import javax.persistence.*;

/**
 * Created by daibinding on 16/6/24.
 */
@Entity
@Table(name = "Symptom", schema = "ElectronicHealthRecord", catalog = "")
public class SymptomEntity {
    private int idSymptom;
    private String symptomName;

    @Id
    @Column(name = "idSymptom", nullable = false)
    public int getIdSymptom() {
        return idSymptom;
    }

    public void setIdSymptom(int idSymptom) {
        this.idSymptom = idSymptom;
    }

    @Basic
    @Column(name = "Symptom_name", nullable = true, length = 45)
    public String getSymptomName() {
        return symptomName;
    }

    public void setSymptomName(String symptomName) {
        this.symptomName = symptomName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SymptomEntity that = (SymptomEntity) o;

        if (idSymptom != that.idSymptom) return false;
        if (symptomName != null ? !symptomName.equals(that.symptomName) : that.symptomName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idSymptom;
        result = 31 * result + (symptomName != null ? symptomName.hashCode() : 0);
        return result;
    }
}
