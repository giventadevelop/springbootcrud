package com.websystique.springboot.dto;

import static org.junit.Assert.assertNotNull;

import java.util.Objects;

import javax.annotation.Generated;

import org.junit.experimental.theories.DataPoint;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
//import org.junit.tools.configuration.base.MethodRef;

@Generated(value = "org.junit-tools-1.0.6")
public class DogDTOTest {
	
	private static DogDTO testSubject;
	private static Long id;

	@Before
	public void setUp() throws Exception {

	}

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		testSubject = createTestSubject();
		id=(long) 2;
	}

	@After
	public void tearDown() throws Exception {

	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {

	}

	private static DogDTO createTestSubject() {
		return new DogDTO();
	}

	//@MethodRef(name = "getId", signature = "()QLong;")
	@Test
	public void testGetId() throws Exception {
		
		Long expectedIdresult=(long) 2;
		testSubject.setId(expectedIdresult);
		Assert.assertEquals(expectedIdresult, testSubject.getId());
	}

	//@MethodRef(name = "setId", signature = "(QLong;)V")
	@Test
	public void testSetId() throws Exception {
		
		Long id = null;

		// default test
		testSubject = createTestSubject();
		testSubject.setId(id);
		Assert.assertNull(testSubject.getId());
	}

	//@MethodRef(name = "getDogName", signature = "()QString;")
	@Test
	public void testGetDogName() throws Exception {
		
		String result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.getDogName();
	}

	//@MethodRef(name = "setDogName", signature = "(QString;)V")
	@Test
	public void testSetDogName() throws Exception {
		
		String dogName = "";

		// default test
		testSubject = createTestSubject();
		testSubject.setDogName(dogName);
	}

	//@MethodRef(name = "getVotes", signature = "()QLong;")
	@Test
	public void testGetVotes() throws Exception {
		
		Long result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.getVotes();
	}

	//@MethodRef(name = "setVotes", signature = "(QLong;)V")
	@Test
	public void testSetVotes() throws Exception {
		
		Long votes = null;

		// default test
		testSubject = createTestSubject();
		testSubject.setVotes(votes);
	}

	//@MethodRef(name = "getDogPicture", signature = "()[B")
	@Test
	public void testGetDogPicture() throws Exception {
		
		byte[] result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.getDogPicture();
	}

	//@MethodRef(name = "setDogPicture", signature = "([B)V")
	@Test
	public void testSetDogPicture() throws Exception {
		
		byte[] dogPicture = new byte[] { ' ' };

		// default test
		testSubject = createTestSubject();
		testSubject.setDogPicture(dogPicture);
	}

	//@MethodRef(name = "getDogPictureContentType", signature = "()QString;")
	@Test
	public void testGetDogPictureContentType() throws Exception {
		
		String result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.getDogPictureContentType();
	}

	//@MethodRef(name = "setDogPictureContentType", signature = "(QString;)V")
	@Test
	public void testSetDogPictureContentType() throws Exception {
		
		String dogPictureContentType = "";

		// default test
		testSubject = createTestSubject();
		testSubject.setDogPictureContentType(dogPictureContentType);
	}

	//@MethodRef(name = "getDogbreedId", signature = "()QLong;")
	@Test
	public void testGetDogbreedId() throws Exception {
		
		Long result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.getDogbreedId();
	}

	//@MethodRef(name = "setDogbreedId", signature = "(QLong;)V")
	@Test
	public void testSetDogbreedId() throws Exception {
		
		Long dogBreedId = null;

		// default test
		testSubject = createTestSubject();
		testSubject.setDogbreedId(dogBreedId);
	}
	
	
	////@MethodRef(name = "testObjId", signature = "(QLong;)V")
	/*/
	 * */

	//@MethodRef(name = "equals", signature = "(QObject;)Z")
	@Test
	public void testEquals() throws Exception {
		
		Object o = null;
		Assert.assertTrue(o==null);
		Assert.assertNull(o);
		DogDTO dogDTO=new DogDTO();
		DogDTO dogDTOCmpr=dogDTO;
		Assert.assertEquals(dogDTO, dogDTOCmpr);
		Assert.assertTrue(o==null);
		Assert.assertNull(o);
		boolean result;

		// test 1
		testSubject = createTestSubject();
		Integer intObj=new Integer(4);
		Assert.assertFalse(dogDTO.equals(intObj));
		o = null;
		
		result = testSubject.equals(o);
		Assert.assertEquals(false, result);
		o= DogDTO.class.newInstance();
		
	}

	//@MethodRef(name = "hashCode", signature = "()I")
	@Test
	public void testHashCode() throws Exception {
		
		int result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.hashCode();
	}

	//@MethodRef(name = "toString", signature = "()QString;")
	@Test
	public void testToString() throws Exception {
		
		String result;

		// default test
		testSubject = createTestSubject();
		result = testSubject.toString();
		assertNotNull(result);
	}
}