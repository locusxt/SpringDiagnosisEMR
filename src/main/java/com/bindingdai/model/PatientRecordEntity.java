package com.bindingdai.model;

import javax.persistence.*;

/**
 * Created by daibinding on 16/7/4.
 */
@Entity
@Table(name = "patientRecord", schema = "ElectronicHealthRecord", catalog = "")
public class PatientRecordEntity {
    private int idpatientRecord;
    private String clinicid;
    private String patientRecordHeight;
    private String patientRecordWeight;
    private String patientRecordWidth;
    private String patientRecordTemperature;
    private String patientRecordPulse;
    private String patientRecordBreath;
    private String patientRecordBloodPUp;
    private String patientRecordBloodPDown;
    private String patientRecordSymptom;
    private String patientRecordExam;
    private String patientRecordDiagnosis;
    private String patientRecordTime;
    private Integer patientRecordState;
    private String patientRecordDrug;

    @Id
    @Column(name = "idpatientRecord", nullable = false)
    public int getIdpatientRecord() {
        return idpatientRecord;
    }

    public void setIdpatientRecord(int idpatientRecord) {
        this.idpatientRecord = idpatientRecord;
    }

    @Basic
    @Column(name = "clinicid", nullable = true, length = 45)
    public String getClinicid() {
        return clinicid;
    }

    public void setClinicid(String clinicid) {
        this.clinicid = clinicid;
    }

    @Basic
    @Column(name = "patientRecordHeight", nullable = true, length = 45)
    public String getPatientRecordHeight() {
        return patientRecordHeight;
    }

    public void setPatientRecordHeight(String patientRecordHeight) {
        this.patientRecordHeight = patientRecordHeight;
    }

    @Basic
    @Column(name = "patientRecordWeight", nullable = true, length = 45)
    public String getPatientRecordWeight() {
        return patientRecordWeight;
    }

    public void setPatientRecordWeight(String patientRecordWeight) {
        this.patientRecordWeight = patientRecordWeight;
    }

    @Basic
    @Column(name = "patientRecordWidth", nullable = true, length = 45)
    public String getPatientRecordWidth() {
        return patientRecordWidth;
    }

    public void setPatientRecordWidth(String patientRecordWidth) {
        this.patientRecordWidth = patientRecordWidth;
    }

    @Basic
    @Column(name = "patientRecordTemperature", nullable = true, length = 45)
    public String getPatientRecordTemperature() {
        return patientRecordTemperature;
    }

    public void setPatientRecordTemperature(String patientRecordTemperature) {
        this.patientRecordTemperature = patientRecordTemperature;
    }

    @Basic
    @Column(name = "patientRecordPulse", nullable = true, length = 45)
    public String getPatientRecordPulse() {
        return patientRecordPulse;
    }

    public void setPatientRecordPulse(String patientRecordPulse) {
        this.patientRecordPulse = patientRecordPulse;
    }

    @Basic
    @Column(name = "patientRecordBreath", nullable = true, length = 45)
    public String getPatientRecordBreath() {
        return patientRecordBreath;
    }

    public void setPatientRecordBreath(String patientRecordBreath) {
        this.patientRecordBreath = patientRecordBreath;
    }

    @Basic
    @Column(name = "patientRecordBloodPUp", nullable = true, length = 45)
    public String getPatientRecordBloodPUp() {
        return patientRecordBloodPUp;
    }

    public void setPatientRecordBloodPUp(String patientRecordBloodPUp) {
        this.patientRecordBloodPUp = patientRecordBloodPUp;
    }

    @Basic
    @Column(name = "patientRecordBloodPDown", nullable = true, length = 45)
    public String getPatientRecordBloodPDown() {
        return patientRecordBloodPDown;
    }

    public void setPatientRecordBloodPDown(String patientRecordBloodPDown) {
        this.patientRecordBloodPDown = patientRecordBloodPDown;
    }

    @Basic
    @Column(name = "patientRecordSymptom", nullable = true, length = 45)
    public String getPatientRecordSymptom() {
        return patientRecordSymptom;
    }

    public void setPatientRecordSymptom(String patientRecordSymptom) {
        this.patientRecordSymptom = patientRecordSymptom;
    }

    @Basic
    @Column(name = "patientRecordExam", nullable = true, length = 45)
    public String getPatientRecordExam() {
        return patientRecordExam;
    }

    public void setPatientRecordExam(String patientRecordExam) {
        this.patientRecordExam = patientRecordExam;
    }

    @Basic
    @Column(name = "patientRecordDiagnosis", nullable = true, length = 45)
    public String getPatientRecordDiagnosis() {
        return patientRecordDiagnosis;
    }

    public void setPatientRecordDiagnosis(String patientRecordDiagnosis) {
        this.patientRecordDiagnosis = patientRecordDiagnosis;
    }

    @Basic
    @Column(name = "patientRecordTime", nullable = true, length = 45)
    public String getPatientRecordTime() {
        return patientRecordTime;
    }

    public void setPatientRecordTime(String patientRecordTime) {
        this.patientRecordTime = patientRecordTime;
    }

    @Basic
    @Column(name = "patientRecordState", nullable = true)
    public Integer getPatientRecordState() {
        return patientRecordState;
    }

    public void setPatientRecordState(Integer patientRecordState) {
        this.patientRecordState = patientRecordState;
    }

    @Basic
    @Column(name = "patientRecordDrug", nullable = true, length = 45)
    public String getPatientRecordDrug() {
        return patientRecordDrug;
    }

    public void setPatientRecordDrug(String patientRecordDrug) {
        this.patientRecordDrug = patientRecordDrug;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PatientRecordEntity that = (PatientRecordEntity) o;

        if (idpatientRecord != that.idpatientRecord) return false;
        if (clinicid != null ? !clinicid.equals(that.clinicid) : that.clinicid != null) return false;
        if (patientRecordHeight != null ? !patientRecordHeight.equals(that.patientRecordHeight) : that.patientRecordHeight != null)
            return false;
        if (patientRecordWeight != null ? !patientRecordWeight.equals(that.patientRecordWeight) : that.patientRecordWeight != null)
            return false;
        if (patientRecordWidth != null ? !patientRecordWidth.equals(that.patientRecordWidth) : that.patientRecordWidth != null)
            return false;
        if (patientRecordTemperature != null ? !patientRecordTemperature.equals(that.patientRecordTemperature) : that.patientRecordTemperature != null)
            return false;
        if (patientRecordPulse != null ? !patientRecordPulse.equals(that.patientRecordPulse) : that.patientRecordPulse != null)
            return false;
        if (patientRecordBreath != null ? !patientRecordBreath.equals(that.patientRecordBreath) : that.patientRecordBreath != null)
            return false;
        if (patientRecordBloodPUp != null ? !patientRecordBloodPUp.equals(that.patientRecordBloodPUp) : that.patientRecordBloodPUp != null)
            return false;
        if (patientRecordBloodPDown != null ? !patientRecordBloodPDown.equals(that.patientRecordBloodPDown) : that.patientRecordBloodPDown != null)
            return false;
        if (patientRecordSymptom != null ? !patientRecordSymptom.equals(that.patientRecordSymptom) : that.patientRecordSymptom != null)
            return false;
        if (patientRecordExam != null ? !patientRecordExam.equals(that.patientRecordExam) : that.patientRecordExam != null)
            return false;
        if (patientRecordDiagnosis != null ? !patientRecordDiagnosis.equals(that.patientRecordDiagnosis) : that.patientRecordDiagnosis != null)
            return false;
        if (patientRecordTime != null ? !patientRecordTime.equals(that.patientRecordTime) : that.patientRecordTime != null)
            return false;
        if (patientRecordState != null ? !patientRecordState.equals(that.patientRecordState) : that.patientRecordState != null)
            return false;
        if (patientRecordDrug != null ? !patientRecordDrug.equals(that.patientRecordDrug) : that.patientRecordDrug != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idpatientRecord;
        result = 31 * result + (clinicid != null ? clinicid.hashCode() : 0);
        result = 31 * result + (patientRecordHeight != null ? patientRecordHeight.hashCode() : 0);
        result = 31 * result + (patientRecordWeight != null ? patientRecordWeight.hashCode() : 0);
        result = 31 * result + (patientRecordWidth != null ? patientRecordWidth.hashCode() : 0);
        result = 31 * result + (patientRecordTemperature != null ? patientRecordTemperature.hashCode() : 0);
        result = 31 * result + (patientRecordPulse != null ? patientRecordPulse.hashCode() : 0);
        result = 31 * result + (patientRecordBreath != null ? patientRecordBreath.hashCode() : 0);
        result = 31 * result + (patientRecordBloodPUp != null ? patientRecordBloodPUp.hashCode() : 0);
        result = 31 * result + (patientRecordBloodPDown != null ? patientRecordBloodPDown.hashCode() : 0);
        result = 31 * result + (patientRecordSymptom != null ? patientRecordSymptom.hashCode() : 0);
        result = 31 * result + (patientRecordExam != null ? patientRecordExam.hashCode() : 0);
        result = 31 * result + (patientRecordDiagnosis != null ? patientRecordDiagnosis.hashCode() : 0);
        result = 31 * result + (patientRecordTime != null ? patientRecordTime.hashCode() : 0);
        result = 31 * result + (patientRecordState != null ? patientRecordState.hashCode() : 0);
        result = 31 * result + (patientRecordDrug != null ? patientRecordDrug.hashCode() : 0);
        return result;
    }
}
