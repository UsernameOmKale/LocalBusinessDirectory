package com.example.Local_Buisness_Directory.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class AdminUserMappingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int mappingId;

    // Foreign key to AdminEntity
    @ManyToOne
    @JoinColumn(name = "aid", referencedColumnName = "aid")
    private AdminEntity admin;

    // Foreign key to UserEntity
    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "id")
    private UserEntity user;

	public int getMappingId() {
		return mappingId;
	}

	public void setMappingId(int mappingId) {
		this.mappingId = mappingId;
	}

	public AdminEntity getAdmin() {
		return admin;
	}

	public void setAdmin(AdminEntity admin) {
		this.admin = admin;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "AdminUserMappingEntity [mappingId=" + mappingId + ", admin=" + admin + ", user=" + user + "]";
	}

	public AdminUserMappingEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

    // Additional fields can be added here as needed
    // Getters and Setters
    
    
}
