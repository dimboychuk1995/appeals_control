package oe.roma.appeals.domain;

import java.util.Date;

public class Appeal {

        private Integer id;
        private String in_number;
        private Date in_date;
        private String customer;
        private String text_appeal;
        private TypeAppeal type_appeal = new TypeAppeal();
        private String executor;
        private String note;
        private String out_number;
        private Date out_date;
        private Signature signature = new Signature();
        private String text_answer;
        private Integer term_answer;
        private Date deadline_term;
        private Integer response_term;
        private String employee;
        private Date reminder_telephone;
        private Date reminder_email;
        private Boolean telephone_check;
        private Boolean email_check;
        private String email;
        private Date reminder_sc;
        private Boolean sc_check;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIn_number() {
        return in_number;
    }

    public void setIn_number(String in_number) {
        this.in_number = in_number;
    }

    public Date getIn_date() {
        return in_date;
    }

    public void setIn_date(Date in_date) {
        this.in_date = in_date;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getText_appeal() {
        return text_appeal;
    }

    public void setText_appeal(String text_appeal) {
        this.text_appeal = text_appeal;
    }

    public TypeAppeal getType_appeal() {
        return type_appeal;
    }

    public void setType_appeal(TypeAppeal type_appeal) {
        this.type_appeal = type_appeal;
    }

    public String getExecutor() {
        return executor;
    }

    public void setExecutor(String executor) {
        this.executor = executor;
    }

    public String getOut_number() {
        return out_number;
    }

    public void setOut_number(String out_number) {
        this.out_number = out_number;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getOut_date() {
        return out_date;
    }

    public void setOut_date(Date out_date) {
        this.out_date = out_date;
    }

    public Signature getSignature() {
        return signature;
    }

    public void setSignature(Signature signature) {
        this.signature = signature;
    }

    public String getText_answer() {
        return text_answer;
    }

    public void setText_answer(String text_answer) {
        this.text_answer = text_answer;
    }

    public Integer getTerm_answer() {
        return term_answer;
    }

    public void setTerm_answer(Integer term_answer) {
        this.term_answer = term_answer;
    }

    public Date getDeadline_term() {
        return deadline_term;
    }

    public void setDeadline_term(Date deadline_term) {
        this.deadline_term = deadline_term;
    }

    public Integer getResponse_term() {
        return response_term;
    }

    public void setResponse_term(Integer response_term) {
        this.response_term = response_term;
    }

    public String getEmployee() {
        return employee;
    }

    public void setEmployee(String employee) {
        this.employee = employee;
    }

    public Date getReminder_telephone() {
        return reminder_telephone;
    }

    public void setReminder_telephone(Date reminder_telephone) {
        this.reminder_telephone = reminder_telephone;
    }

    public Date getReminder_email() {
        return reminder_email;
    }

    public void setReminder_email(Date reminder_email) {
        this.reminder_email = reminder_email;
    }

    public Boolean getTelephone_check() {
        return telephone_check;
    }

    public void setTelephone_check(Boolean telephone_check) {
        this.telephone_check = telephone_check;
    }

    public Boolean getEmail_check() {
        return email_check;
    }

    public void setEmail_check(Boolean email_check) {
        this.email_check = email_check;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getReminder_sc() {
        return reminder_sc;
    }

    public void setReminder_sc(Date reminder_sc) {
        this.reminder_sc = reminder_sc;
    }

    public Boolean getSc_check() {
        return sc_check;
    }

    public void setSc_check(Boolean sc_check) {
        this.sc_check = sc_check;
    }

    @Override
    public String toString() {
        return "Appeal{" +
                "id=" + id +
                ", in_number='" + in_number + '\'' +
                ", in_date=" + in_date +
                ", customer='" + customer + '\'' +
                ", text_appeal='" + text_appeal + '\'' +
                ", type_appeal=" + type_appeal +
                ", executor='" + executor + '\'' +
                ", out_number='" + out_number + '\'' +
                ", out_date=" + out_date +
                ", signature=" + signature +
                ", text_answer='" + text_answer + '\'' +
                ", term_answer=" + term_answer +
                ", deadline_term=" + deadline_term +
                ", response_term=" + response_term +
                ", employee='" + employee + '\'' +
                ", reminder_telephone=" + reminder_telephone +
                ", reminder_email=" + reminder_email +
                ", telephone_check=" + telephone_check +
                ", email_check=" + email_check +
                ", email='" + email + '\'' +
                ", reminder_sc=" + reminder_sc +
                ", sc_check=" + sc_check +
                '}';
    }
}

