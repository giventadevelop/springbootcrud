package com.websystique.springboot.repositories;
import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.test.context.junit4.SpringRunner;

import com.websystique.springboot.SpringBootCRUDApp;
import com.websystique.springboot.dto.DogDTO;
import com.websystique.springboot.mapper.DogMapper;
import com.websystique.springboot.model.Dog;
import com.websystique.springboot.model.DogBreed;


@RunWith(SpringRunner.class)
//@SpringBootTest(classes = SpringBootCRUDApp.class)
@DataJpaTest
//@OverrideAutoConfiguration(enabled = true)
//@AutoConfigureTestDatabase(connection = EmbeddedDatabaseConnection.H2)
//@AutoConfigureTestDatabase()
//@org.springframework.test.context.ContextConfiguration(classes = SpringBootCRUDApp.class)
/*@ActiveProfiles("test")
@TestPropertySource(
		  locations = "classpath:application-test.properties")*/
public class DogRepositoryTest {

	 @Configuration
	 @ComponentScan(basePackages = "com.websystique.springboot")
	 @EnableJpaRepositories(basePackages = "com.websystique.springboot")
	    static class ContextConfiguration {
	      /*  @Bean
	        @Primary //may omit this if this is the only SomeBean defined/visible
	        public SomeBean someBean () {
	            return new SomeBean();
	        }*/
	    }
	DogBreed dogBreed;

	@Autowired
	private TestEntityManager entityManager;
	
	@Autowired
	private DogRepository dogRepository;
	
	@Autowired
	private DogBreedRepository dogBreedRepository;
	
	@Autowired
	private DogMapper dogMapper;
	
	private DogDTO dogDTO;
	private Dog dog;
	
	@Before
	public void init() {
		dogBreed=new DogBreed();
		dogDTO = createTestDogDTO();
		dog=createTestDogEntity();
		//dogBreed.setId((long) 3);
		//entityManager.persistAndFlush(dogBreed);
		
	}
	
	@Test
	//@org.junit.Ignore
	public void testSaveDog(){
		//entityManager.merge(dogBreed);
		
		dogBreed=	dogBreedRepository.saveAndFlush(dogBreed);
		
		//Dog savedDogDTO=  entityManager.persist(dog);
		//Dog savedDogDTO=  entityManager.merge(dog);
		dog.setDogbreed(dogBreed);
		dog.setDogName("Updated Dog Name");
		Dog savedDog=   dogRepository.saveAndFlush(dog);
		dog = dogRepository.findOne(savedDog.getId());
		assertEquals("Updated Dog Name",dog.getDogName());
	}
	
	@Test
	//@org.junit.Ignore
	public void testUpdateDog(){
		//entityManager.merge(dogBreed);
		dogBreed=	dogBreedRepository.saveAndFlush(dogBreed);
		//Dog savedDogDTO=  entityManager.persist(dog);
		//Dog savedDogDTO=  entityManager.merge(dog);
		dog.setDogbreed(dogBreed);
		Dog savedDogDTO=   dogRepository.saveAndFlush(dog);
		dog = dogRepository.findOne(savedDogDTO.getId());
		DogDTO getDogDTO=dogMapper.dogToDogDTO(dog);
		assertThat(dog).isEqualTo(savedDogDTO);
	}
	
	private DogDTO createTestDogDTO() {
		DogDTO dogDTO = new DogDTO();
	//	dogDTO.setId((long) 2);
		dogDTO.setDogName("Unit Test Dog Name");
		dogDTO.setDogbreedId((long) 3);
		return dogDTO;
	}
	
	private Dog createTestDogEntity() {
		Dog dog = new Dog();
	//	dogDTO.setId((long) 2);
		dog.setDogName("Unit Test Dog Name");
		dog.setDogbreed(dogBreed);
		//dog.setDogbreedId((long) 3);
		return dog;
	}
}