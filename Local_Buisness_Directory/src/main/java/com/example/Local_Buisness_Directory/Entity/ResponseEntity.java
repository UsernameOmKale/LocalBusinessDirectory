package com.example.Local_Buisness_Directory.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class ResponseEntity {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int responseId;

	    // Foreign key to AdminEntity
	    @ManyToOne
	    @JoinColumn(name = "aid", referencedColumnName = "aid")
	    private AdminEntity admin;

	    
	    // Foreign key to UserEntity
	    @ManyToOne
	    @JoinColumn(name = "userId", referencedColumnName = "id")
	    private UserEntity user;
	    
	    
		public UserEntity getUser() {
			return user;
		}

		public void setUser(UserEntity user) {
			this.user = user;
		}

		public int getResponseId() {
			return responseId;
		}

		public void setResponseId(int responseId) {
			this.responseId = responseId;
		}

		public AdminEntity getAdmin() {
			return admin;
		}

		public void setAdmin(AdminEntity admin) {
			this.admin = admin;
		}

		@Override
		public String toString() {
			return "ResponseEntity [responseId=" + responseId + ", admin=" + admin + ", user=" + user + ", getUser()="
					+ getUser() + ", getResponseId()=" + getResponseId() + ", getAdmin()=" + getAdmin()
					+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
					+ "]";
		}

		public ResponseEntity() {
			super();
			// TODO Auto-generated constructor stub
		}


	    
	    
}
