package com.bindingdai.model;

import javax.persistence.*;

/**
 * Created by daibinding on 16/7/4.
 */
@Entity
@Table(name = "patient", schema = "ElectronicHealthRecord", catalog = "")
public class PatientEntity {
    private int idpatient;
    private String patientName;
    private String patientGender;
    private String patientBirthday;
    private String patientTelNumber;
    private String patientHeight;
    private String patientWeight;
    private String patientAddress;
    private String patientAge;
    private String patientJob;
    private String patientMarriage;
    private String patientNation;
    private String patientClinicState;
    private String patientPersonId;
    private String patientClinicId;
    private String patientPaytype;
    private String patientPaycardId;

    @Id
    @Column(name = "idpatient", nullable = false)
    public int getIdpatient() {
        return idpatient;
    }

    public void setIdpatient(int idpatient) {
        this.idpatient = idpatient;
    }

    @Basic
    @Column(name = "patientName", nullable = true, length = 45)
    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    @Basic
    @Column(name = "patientGender", nullable = true, length = 45)
    public String getPatientGender() {
        return patientGender;
    }

    public void setPatientGender(String patientGender) {
        this.patientGender = patientGender;
    }

    @Basic
    @Column(name = "patientBirthday", nullable = true, length = 45)
    public String getPatientBirthday() {
        return patientBirthday;
    }

    public void setPatientBirthday(String patientBirthday) {
        this.patientBirthday = patientBirthday;
    }

    @Basic
    @Column(name = "patientTelNumber", nullable = true, length = 45)
    public String getPatientTelNumber() {
        return patientTelNumber;
    }

    public void setPatientTelNumber(String patientTelNumber) {
        this.patientTelNumber = patientTelNumber;
    }

    @Basic
    @Column(name = "patientHeight", nullable = true, length = 45)
    public String getPatientHeight() {
        return patientHeight;
    }

    public void setPatientHeight(String patientHeight) {
        this.patientHeight = patientHeight;
    }

    @Basic
    @Column(name = "patientWeight", nullable = true, length = 45)
    public String getPatientWeight() {
        return patientWeight;
    }

    public void setPatientWeight(String patientWeight) {
        this.patientWeight = patientWeight;
    }

    @Basic
    @Column(name = "patientAddress", nullable = true, length = 45)
    public String getPatientAddress() {
        return patientAddress;
    }

    public void setPatientAddress(String patientAddress) {
        this.patientAddress = patientAddress;
    }

    @Basic
    @Column(name = "patientAge", nullable = true, length = 45)
    public String getPatientAge() {
        return patientAge;
    }

    public void setPatientAge(String patientAge) {
        this.patientAge = patientAge;
    }

    @Basic
    @Column(name = "patientJob", nullable = true, length = 45)
    public String getPatientJob() {
        return patientJob;
    }

    public void setPatientJob(String patientJob) {
        this.patientJob = patientJob;
    }

    @Basic
    @Column(name = "patientMarriage", nullable = true, length = 45)
    public String getPatientMarriage() {
        return patientMarriage;
    }

    public void setPatientMarriage(String patientMarriage) {
        this.patientMarriage = patientMarriage;
    }

    @Basic
    @Column(name = "patientNation", nullable = true, length = 45)
    public String getPatientNation() {
        return patientNation;
    }

    public void setPatientNation(String patientNation) {
        this.patientNation = patientNation;
    }

    @Basic
    @Column(name = "patientClinicState", nullable = true, length = 45)
    public String getPatientClinicState() {
        return patientClinicState;
    }

    public void setPatientClinicState(String patientClinicState) {
        this.patientClinicState = patientClinicState;
    }

    @Basic
    @Column(name = "patientPersonId", nullable = true, length = 45)
    public String getPatientPersonId() {
        return patientPersonId;
    }

    public void setPatientPersonId(String patientPersonId) {
        this.patientPersonId = patientPersonId;
    }

    @Basic
    @Column(name = "patientClinicId", nullable = true, length = 45)
    public String getPatientClinicId() {
        return patientClinicId;
    }

    public void setPatientClinicId(String patientClinicId) {
        this.patientClinicId = patientClinicId;
    }

    @Basic
    @Column(name = "patientPaytype", nullable = true, length = 45)
    public String getPatientPaytype() {
        return patientPaytype;
    }

    public void setPatientPaytype(String patientPaytype) {
        this.patientPaytype = patientPaytype;
    }

    @Basic
    @Column(name = "patientPaycardId", nullable = true, length = 45)
    public String getPatientPaycardId() {
        return patientPaycardId;
    }

    public void setPatientPaycardId(String patientPaycardId) {
        this.patientPaycardId = patientPaycardId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PatientEntity that = (PatientEntity) o;

        if (idpatient != that.idpatient) return false;
        if (patientName != null ? !patientName.equals(that.patientName) : that.patientName != null) return false;
        if (patientGender != null ? !patientGender.equals(that.patientGender) : that.patientGender != null)
            return false;
        if (patientBirthday != null ? !patientBirthday.equals(that.patientBirthday) : that.patientBirthday != null)
            return false;
        if (patientTelNumber != null ? !patientTelNumber.equals(that.patientTelNumber) : that.patientTelNumber != null)
            return false;
        if (patientHeight != null ? !patientHeight.equals(that.patientHeight) : that.patientHeight != null)
            return false;
        if (patientWeight != null ? !patientWeight.equals(that.patientWeight) : that.patientWeight != null)
            return false;
        if (patientAddress != null ? !patientAddress.equals(that.patientAddress) : that.patientAddress != null)
            return false;
        if (patientAge != null ? !patientAge.equals(that.patientAge) : that.patientAge != null) return false;
        if (patientJob != null ? !patientJob.equals(that.patientJob) : that.patientJob != null) return false;
        if (patientMarriage != null ? !patientMarriage.equals(that.patientMarriage) : that.patientMarriage != null)
            return false;
        if (patientNation != null ? !patientNation.equals(that.patientNation) : that.patientNation != null)
            return false;
        if (patientClinicState != null ? !patientClinicState.equals(that.patientClinicState) : that.patientClinicState != null)
            return false;
        if (patientPersonId != null ? !patientPersonId.equals(that.patientPersonId) : that.patientPersonId != null)
            return false;
        if (patientClinicId != null ? !patientClinicId.equals(that.patientClinicId) : that.patientClinicId != null)
            return false;
        if (patientPaytype != null ? !patientPaytype.equals(that.patientPaytype) : that.patientPaytype != null)
            return false;
        if (patientPaycardId != null ? !patientPaycardId.equals(that.patientPaycardId) : that.patientPaycardId != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idpatient;
        result = 31 * result + (patientName != null ? patientName.hashCode() : 0);
        result = 31 * result + (patientGender != null ? patientGender.hashCode() : 0);
        result = 31 * result + (patientBirthday != null ? patientBirthday.hashCode() : 0);
        result = 31 * result + (patientTelNumber != null ? patientTelNumber.hashCode() : 0);
        result = 31 * result + (patientHeight != null ? patientHeight.hashCode() : 0);
        result = 31 * result + (patientWeight != null ? patientWeight.hashCode() : 0);
        result = 31 * result + (patientAddress != null ? patientAddress.hashCode() : 0);
        result = 31 * result + (patientAge != null ? patientAge.hashCode() : 0);
        result = 31 * result + (patientJob != null ? patientJob.hashCode() : 0);
        result = 31 * result + (patientMarriage != null ? patientMarriage.hashCode() : 0);
        result = 31 * result + (patientNation != null ? patientNation.hashCode() : 0);
        result = 31 * result + (patientClinicState != null ? patientClinicState.hashCode() : 0);
        result = 31 * result + (patientPersonId != null ? patientPersonId.hashCode() : 0);
        result = 31 * result + (patientClinicId != null ? patientClinicId.hashCode() : 0);
        result = 31 * result + (patientPaytype != null ? patientPaytype.hashCode() : 0);
        result = 31 * result + (patientPaycardId != null ? patientPaycardId.hashCode() : 0);
        return result;
    }
}
