package com.bindingdai.model;

import javax.persistence.*;

/**
 * Created by daibinding on 16/6/24.
 */
@Entity
@Table(name = "diagnosis", schema = "ElectronicHealthRecord", catalog = "")
public class DiagnosisEntity {
    private int iddiagnosis;
    private String diagnosisName;

    @Id
    @Column(name = "iddiagnosis", nullable = false)
    public int getIddiagnosis() {
        return iddiagnosis;
    }

    public void setIddiagnosis(int iddiagnosis) {
        this.iddiagnosis = iddiagnosis;
    }

    @Basic
    @Column(name = "diagnosis_name", nullable = true, length = 45)
    public String getDiagnosisName() {
        return diagnosisName;
    }

    public void setDiagnosisName(String diagnosisName) {
        this.diagnosisName = diagnosisName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DiagnosisEntity that = (DiagnosisEntity) o;

        if (iddiagnosis != that.iddiagnosis) return false;
        if (diagnosisName != null ? !diagnosisName.equals(that.diagnosisName) : that.diagnosisName != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = iddiagnosis;
        result = 31 * result + (diagnosisName != null ? diagnosisName.hashCode() : 0);
        return result;
    }
}
