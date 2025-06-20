----------------------------- Complaint Management System (CMS)-----------------------------------------

A web-based Complaint Management System developed for the IJSE GDSE program using JSP and Jakarta EE. The system allows employees to report complaints and administrators to manage and resolve them.

------------------------------ Project Overview-----------------------------------------

This is a full-stack web application that handles user authentication and complaint lifecycle management using only synchronous HTTP form submissions (GET and POST), without AJAX. Built using the MVC architecture.

------------------------------ Features--------------------------------------------------

------------------------------Employee---------------------------------------------------
- Sign up / Sign in
- Submit new complaints
- View, edit, or delete personal complaints (only if unresolved)

-------------------------------Admin-----------------------------------------------------
- View all complaints
- Update complaint status and add remarks
- Delete any complaint
- Filter by status

------------------------------Technology Stack-------------------------------------------

- *Frontend*: JSP, HTML, CSS, JavaScript (form validation only)
- *Backend*: Jakarta EE (Servlets)
- *Database*: MySQL using Apache Commons DBCP
- *Server*: Apache Tomcat (local)



-------------------------------Project Structure-----------------------------------------

<pre>
   src/main/
├── java/lk/ijse/gdse/
│ ├── Controller/
│ │ ├── AdminServlet.java
│ │ ├── EmployeeServlet.java
│ │ ├── LogoutServlet.java
│ │ ├── SignInServlet.java
│ │ └── SignUpServlet.java
│ ├── Dao/
│ │ ├── AdminDao.java
│ │ ├── EmployeeDao.java
│ │ └── UserDao.java
│ ├── Model/
│ │ ├── EmployeeAndAdminModel.java
│ │ └── UserModel.java
│ ├── db/
│ │ └── schema.sql
│
├── web/
│ ├── META-INF/
│ │ └── context.xml
│ ├── WEB-INF/
│ │ └── web.xml
│ └── View/
│ ├── signIn.jsp
│ ├── signUp.jsp
│ ├── userDashboard.jsp
│ └── adminDashboard.jsp
</pre>



----------------------------Key Files--------------------------------------------

- schema.sql: SQL dump to create and initialize database tables.
- web.xml: Servlet configuration.
- context.xml: DBCP database connection setup.
- pom.xml: Maven dependencies (if used).
- .gitignore: Files/folders excluded from version control.

---

-------------------------Usage Instructions------------------------------------------

1. **Import schema.sql** into MySQL.
2. *Configure* database connection in context.xml.
3. *Deploy* the project on Apache Tomcat.
4. *Access the app* via the browser:
   - Sign in as employee or admin
   - Submit and manage complaints

---

-------------------------------Request Methods---------------------------------------

- GET: Fetch complaint lists and views
- POST: Submit, update, or delete complaints
- ❗ No AJAX/fetch: all data interactions are via synchronous form submissions only

-------------------------Submission Details-----------------------------------------

- *GitHub*: Public repository with commit history
- *SQL*: Schema file included
- *YouTube Demo*: Covers functionality and architecture

---


-----------------------------CREATED BY-----------------------------------------
       NISHINI ROSHALA
       GDSE 71 BATCH 
       PANADURA