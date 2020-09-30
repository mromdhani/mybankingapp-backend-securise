package be.bt.security.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import be.bt.security.model.User;


public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
