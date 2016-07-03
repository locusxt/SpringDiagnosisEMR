package com.bindingdai.model;

import javax.persistence.*;

/**
 * Created by daibinding on 16/6/24.
 */
@Entity
@Table(name = "physical_exam", schema = "ElectronicHealthRecord", catalog = "")
public class PhysicalExamEntity {
    private int idphysicalExam;
    private String physicalExamContent;
    private String physicalExamValue;
    private String physicalExamOrgan;

    @Id
    @Column(name = "idphysical_exam", nullable = false)
    public int getIdphysicalExam() {
        return idphysicalExam;
    }

    public void setIdphysicalExam(int idphysicalExam) {
        this.idphysicalExam = idphysicalExam;
    }

    @Basic
    @Column(name = "physical_examContent", nullable = true, length = 45)
    public String getPhysicalExamContent() {
        return physicalExamContent;
    }

    public void setPhysicalExamContent(String physicalExamContent) {
        this.physicalExamContent = physicalExamContent;
    }

    @Basic
    @Column(name = "physical_examValue", nullable = true, length = 45)
    public String getPhysicalExamValue() {
        return physicalExamValue;
    }

    public void setPhysicalExamValue(String physicalExamValue) {
        this.physicalExamValue = physicalExamValue;
    }

    @Basic
    @Column(name = "physical_exam_organ", nullable = true, length = 45)
    public String getPhysicalExamOrgan() {
        return physicalExamOrgan;
    }

    public void setPhysicalExamOrgan(String physicalExamOrgan) {
        this.physicalExamOrgan = physicalExamOrgan;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PhysicalExamEntity that = (PhysicalExamEntity) o;

        if (idphysicalExam != that.idphysicalExam) return false;
        if (physicalExamContent != null ? !physicalExamContent.equals(that.physicalExamContent) : that.physicalExamContent != null)
            return false;
        if (physicalExamValue != null ? !physicalExamValue.equals(that.physicalExamValue) : that.physicalExamValue != null)
            return false;
        if (physicalExamOrgan != null ? !physicalExamOrgan.equals(that.physicalExamOrgan) : that.physicalExamOrgan != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idphysicalExam;
        result = 31 * result + (physicalExamContent != null ? physicalExamContent.hashCode() : 0);
        result = 31 * result + (physicalExamValue != null ? physicalExamValue.hashCode() : 0);
        result = 31 * result + (physicalExamOrgan != null ? physicalExamOrgan.hashCode() : 0);
        return result;
    }
}
