package com.btk.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.btk.domain.Compte;

public interface IComptesRepository  extends JpaRepository<Compte, String>{
	
//	List<Compte> findBySoldeIsLessThanEqual(BigDecimal valeur);
//	List<Compte> findByProprietaireIsLike(String pattern);
//	
//	@Query("select  c from Compte c where c.solde <= ?1")
//	List<Compte> findBySoldeInferieurA(BigDecimal valeur);
//	
//	@Query("select  c from Compte c where c.proprietaire Like %?1%")
//	List<Compte> findByProprietaireComme(String pattern);
	
//	@Override
//	default Page<Compte> findAll(Pageable pageable) {
//
//		return findAll(PageRequest.of(1,2));
//	}
	

}