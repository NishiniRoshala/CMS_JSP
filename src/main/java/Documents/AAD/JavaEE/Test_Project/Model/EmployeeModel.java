package Documents.AAD.JavaEE.Test_Project.Model;

public class EmployeeModel {
    private int complaint_id;
    private String title;
    private String description;
    private int user_id;
    private String status;
    private String created_at;
    private String updated_at;
    private String remark;

    public EmployeeModel() {
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getComplaint_id() {
        return complaint_id;
    }
    public void setComplaint_id(int complaint_id) {
        this.complaint_id = complaint_id;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public int getUser_id() {
        return user_id;

    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreated_at() {
        return created_at;
    }
    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }
    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }
}