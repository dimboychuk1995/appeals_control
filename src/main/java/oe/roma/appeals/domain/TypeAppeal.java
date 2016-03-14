package oe.roma.appeals.domain;

public class TypeAppeal {
    private Integer id;
    private String name;
    private Integer term_to_answer;
    private Integer reminder_term;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTerm_to_answer() {
        return term_to_answer;
    }

    public void setTerm_to_answer(Integer term_to_answer) {
        this.term_to_answer = term_to_answer;
    }

    public Integer getReminder_term() {
        return reminder_term;
    }

    public void setReminder_term(Integer reminder_term) {
        this.reminder_term = reminder_term;
    }
}
