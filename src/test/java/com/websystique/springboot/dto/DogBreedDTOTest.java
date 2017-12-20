package com.websystique.springboot.dto;

import org.junit.Assert;
import org.junit.Test;
//import org.junit.tools.configuration.base.MethodRef;


public class DogBreedDTOTest {

	private DogBreedDTO createTestSubject() {
		return new DogBreedDTO();
	}

	//@MethodRef(name = "getId", signature = "()QLong;")
	@Test
	public void testGetId() throws Exception {
		DogBreedDTO testSubject;
		Long result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.getId();

		//Assert.fail();
	}

	//@MethodRef(name = "setId", signature = "(QLong;)V")
	@Test
	public void testSetId() throws Exception {
		DogBreedDTO testSubject;
		Long id = null;

		// default test
		testSubject = createTestSubject();
		testSubject.setId(id);

		//Assert.fail();
	}

	//@MethodRef(name = "getBreedName", signature = "()QString;")
	@Test
	public void testGetBreedName() throws Exception {
		DogBreedDTO testSubject;
		String result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.getBreedName();

		//Assert.fail();
	}

	//@MethodRef(name = "setBreedName", signature = "(QString;)V")
	@Test
	public void testSetBreedName() throws Exception {
		DogBreedDTO testSubject;
		String breedName = "";

		// default test
		testSubject = createTestSubject();
		testSubject.setBreedName(breedName);

		//Assert.fail();
	}

	//@MethodRef(name = "equals", signature = "(QObject;)Z")
	@Test
	public void testEquals() throws Exception {
		DogBreedDTO testSubject;
		Object o = null;
		boolean result;

		// test 1
		testSubject = createTestSubject();
		o = null;
		result = testSubject.equals(o);
		Assert.assertEquals(false, result);

		//Assert.fail();
	}

	//@MethodRef(name = "hashCode", signature = "()I")
	@Test
	public void testHashCode() throws Exception {
		DogBreedDTO testSubject;
		int result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.hashCode();

		//Assert.fail();
	}

	//@MethodRef(name = "toString", signature = "()QString;")
	@Test
	public void testToString() throws Exception {
		DogBreedDTO testSubject;
		String result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.toString();

		//Assert.fail();
	}
}