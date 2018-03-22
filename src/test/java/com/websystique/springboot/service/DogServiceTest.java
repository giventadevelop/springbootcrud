package com.websystique.springboot.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyLong;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Generated;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.junit4.SpringRunner;

import com.websystique.springboot.dto.DogDTO;
import com.websystique.springboot.dto.GroupByDogBreedDTO;
import com.websystique.springboot.mapper.DogMapper;
import com.websystique.springboot.model.Dog;
import com.websystique.springboot.repositories.DogRepository;

@Generated(value = "org.junit-tools-1.0.6")
@RunWith(SpringRunner.class)
@SpringBootTest
public class DogServiceTest {

	@Autowired
	private DogService dogService;

	@Autowired
	DogMapper dogMapper;

	@MockBean
	private DogRepository dogRepositoryMock;

	@MockBean
	DogMapper dogMapperMock;

	private DogDTO dogDTO;
	private Dog dog;
	@MockBean
	private Pageable pageableMock;

	@Before
	public void init() {
		dogDTO = createTestDogDTO();
		dog = dogMapper.dogDTOToDog(dogDTO);
	}

	private DogServiceImpl createTestSubject() {
		return new DogServiceImpl();
	}

	@Test
	public void testDelete() throws Exception {
		dogService.delete((long) 2);
		verify(dogRepositoryMock, times(1)).delete(anyLong());
		verifyNoMoreInteractions(dogRepositoryMock);
	}

	@Test
	public void testFindAll() throws Exception {

		DogServiceImpl testSubject;
		List<Dog> dogList = null;
		Page<DogDTO> pageDogDTO;
		when(dogRepositoryMock.findAll((Sort) any(Pageable.class))).thenReturn(dogList);
		pageDogDTO = dogService.findAll(pageableMock);
		assertEquals(pageDogDTO, null);
	}

	@Test
	public void testFindOne() throws Exception {
		when(dogRepositoryMock.findOne(anyLong())).thenReturn(dog);
		DogDTO findDogDTO = dogService.findOne((long) 2);
		assertEquals(findDogDTO, null);
	}

	@Test
	public void testGetAllDogsBreedsGroupBy() throws Exception {
		List<GroupByDogBreedDTO> groupByDogBreedResult =new ArrayList<GroupByDogBreedDTO>();
		when(dogRepositoryMock.getGroupByDogBreed()).thenReturn(groupByDogBreedResult);
		when(pageableMock.getOffset()).thenReturn(10);
		when(pageableMock.getPageSize()).thenReturn(10);
		Page<GroupByDogBreedDTO> pageGroupByDogBreedDTO= dogService.getAllDogsBreedsGroupBy(pageableMock);
		assertNotNull(pageGroupByDogBreedDTO);
	}

	@Test
	public void testGetDogUserDog() throws Exception {
		DogServiceImpl testSubject;
	}

	@Test
	public void testSaveDog() throws Exception {

		Dog dog = dogMapper.dogDTOToDog(dogDTO);
		when(dogRepositoryMock.save(dog)).thenReturn(dog);
		when(dogMapperMock.dogDTOToDog(any(DogDTO.class))).thenReturn(dog);
		DogDTO saveddogDTO = dogService.save(dogDTO);
		assertEquals(saveddogDTO, null);
	}

	private DogDTO createTestDogDTO() {
		DogDTO dogDTO = new DogDTO();
		dogDTO.setId((long) 2);
		dogDTO.setDogName("Unit Test Dog Name");
		dogDTO.setDogbreedId((long) 3);
		return dogDTO;
	}
}