package himedia.vo;

import java.util.Date;

// Table emaillist의 레코드를 저장하기 위한 DTO 객체
// 1.기본 생성자를 가지고 있다
// 2. 비즈니스 로직을 가지지 않은 순수 데이터 객체
// 3. 필드, getters/setters
// 4. toString, equals 등 객체 관련 메서를 오버라이드 
public class EmailVo {
   //필드
   private long no;
   private String lastName;
   private String firstName;
   private String email;
   private Date CreatedAt;
   
   public EmailVo(){
   }

   public EmailVo(long no, String lastName, String firstName, String email, Date createdAt) {
      super();
      this.no = no;
      this.lastName = lastName;
      this.firstName = firstName;
      this.email = email;
      CreatedAt = createdAt;
   }
   public EmailVo(String lastName,String firstName,
         String email) {
      this.lastName=lastName;
      this.email=email;
   }


   public long getNo() {
      return no;
   }

   public void setNo(long no) {
      this.no = no;
   }

   public String getLastName() {
      return lastName;
   }

   public void setLastName(String lastName) {
      this.lastName = lastName;
   }

   public String getFirstName() {
      return firstName;
   }

   public void setFirstName(String firstName) {
      this.firstName = firstName;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public Date getCreatedAt() {
      return CreatedAt;
   }

   public void setCreatedAt(Date createdAt) {
      CreatedAt = createdAt;
   }
   
   @Override
   public String toString() {
      return "EmailVo [no=" + no + ", lastName=" + lastName + ", firstName=" + firstName + ", email=" + email
            + ", CreatedAt=" + CreatedAt + "]";
   }

}
