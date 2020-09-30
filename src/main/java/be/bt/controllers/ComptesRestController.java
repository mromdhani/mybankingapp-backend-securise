package be.bt.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import be.bt.domain.Compte;
import be.bt.repository.IComptesRepository;

@RestController
@RequestMapping("/comptes")
@CrossOrigin(origins = "*")
public class ComptesRestController {

	private IComptesRepository repo;

	public ComptesRestController(IComptesRepository repo) { // @Autowired n'est pas nécessaire depuis v4.3
		this.repo = repo;
	}

	@GetMapping
	@PreAuthorize("hasRole('ADMIN')")
	public List<Compte> getAllComptes() {
		return repo.findAll();
	}

	@GetMapping(path = "/{id}")
	 @PreAuthorize("hasRole('ADMIN') or hasRole('USER')")
	public ResponseEntity<Compte> getCompteById(@PathVariable(value = "id") String myId) {

		Optional<Compte> compte = repo.findById(myId);
		if (!compte.isPresent()) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok().body(compte.get());
	}

	@PostMapping
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Compte> addCompte(@RequestBody Compte c) {
		repo.save(c);
		return new ResponseEntity<Compte>(c, HttpStatus.CREATED);
	}

	@PutMapping
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Compte> updateCompte(@RequestBody Compte c) {
		repo.save(c);
		return new ResponseEntity<Compte>(c, HttpStatus.ACCEPTED);
	}

	@DeleteMapping(path = "/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Compte> deleteCompteById(@PathVariable(value = "id") String myId) {

		Optional<Compte> compte = repo.findById(myId);
		if (!compte.isPresent()) {
			return ResponseEntity.notFound().build();
		} else {
			repo.deleteById(myId);
			return new ResponseEntity<Compte>(HttpStatus.ACCEPTED);
		}

	}

}
