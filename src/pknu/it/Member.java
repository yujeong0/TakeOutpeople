package pknu.it;


public class Member {
      private String mem_name;

      public Member() {
         mem_name = null;
      }

      public String getName() {
         return (mem_name);
      }
      
      public void setName(String name) {
         this.mem_name = name;
      }
}