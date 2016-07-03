package com.bindingdai.model;

import javax.persistence.*;

/**
 * Created by daibinding on 16/6/24.
 */
@Entity
@Table(name = "instrument_exam", schema = "ElectronicHealthRecord", catalog = "")
public class InstrumentExamEntity {
    private int idinstrumentExam;
    private String instrumentExamContent;
    private String instrumentExamValue;

    @Id
    @Column(name = "idinstrument_exam", nullable = false)
    public int getIdinstrumentExam() {
        return idinstrumentExam;
    }

    public void setIdinstrumentExam(int idinstrumentExam) {
        this.idinstrumentExam = idinstrumentExam;
    }

    @Basic
    @Column(name = "instrument_examContent", nullable = true, length = 45)
    public String getInstrumentExamContent() {
        return instrumentExamContent;
    }

    public void setInstrumentExamContent(String instrumentExamContent) {
        this.instrumentExamContent = instrumentExamContent;
    }

    @Basic
    @Column(name = "instrument_examValue", nullable = true, length = 45)
    public String getInstrumentExamValue() {
        return instrumentExamValue;
    }

    public void setInstrumentExamValue(String instrumentExamValue) {
        this.instrumentExamValue = instrumentExamValue;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InstrumentExamEntity that = (InstrumentExamEntity) o;

        if (idinstrumentExam != that.idinstrumentExam) return false;
        if (instrumentExamContent != null ? !instrumentExamContent.equals(that.instrumentExamContent) : that.instrumentExamContent != null)
            return false;
        if (instrumentExamValue != null ? !instrumentExamValue.equals(that.instrumentExamValue) : that.instrumentExamValue != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idinstrumentExam;
        result = 31 * result + (instrumentExamContent != null ? instrumentExamContent.hashCode() : 0);
        result = 31 * result + (instrumentExamValue != null ? instrumentExamValue.hashCode() : 0);
        return result;
    }
}
