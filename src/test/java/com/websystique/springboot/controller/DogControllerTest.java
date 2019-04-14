/**
 * 
 */
package com.websystique.springboot.controller;

import static org.hamcrest.CoreMatchers.is;
import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyLong;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.HateoasPageableHandlerMethodArgumentResolver;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.data.web.PagedResourcesAssembler;
import org.springframework.data.web.config.HateoasAwareSpringDataWebConfiguration;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.util.UriComponentsBuilder;

import com.websystique.springboot.dto.DogDTO;
/*import com.websystique.springboot.resource.assembler.DogResourceAssembler;
import com.websystique.springboot.service.DogService;
import com.websystique.springboot.test.util.TestUtil; */
import com.websystique.springboot.util.PaginationUtil;


@Import(HateoasAwareSpringDataWebConfiguration.class)

@RunWith(SpringRunner.class)
//@RunWith(PowerMockRunner.class)
//@SpringBootTest(classes = SpringBootCRUDApp.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
//@WebMvcTest(controllers = DogController.class)
@AutoConfigureMockMvc(secure=false)
//@EnableSpringDataWebSupport
@PrepareForTest(PaginationUtil.class)

public class DogControllerTest   {/*
	
	private static final String ENTITY_NAME = "dog";

	@LocalServerPort
	private int port=8080;
	
	@Autowired
	private TestRestTemplate restTemplate= new TestRestTemplate();
	
	 @Autowired
	 private MockMvc mockMvc;
 
    @MockBean
  //  DogService dogServiceMock;
    
    @MockBean
    Page pageMock;

    @InjectMocks
    PaginationUtil paginationUtil;

    
    @Autowired
	private DogResourceAssembler dogResourceAssembler;

     @MockBean
    DogResourceAssembler dogResourceAssembler;
    
    @MockBean
    PagedResourcesAssembler pagedResourcesAssembler;
    
    @Autowired
    PagedResourcesAssembler<DogResourceAssembler> pagedResourcesAssembler;
    
    @MockBean
    DogResourceAssembler dogResourceAssembler;
    
    @Autowired
    private WebApplicationContext webApplicationContext;
    
    @InjectMocks
    private DogController dogController;
    
    HateoasPageableHandlerMethodArgumentResolver resolver = new HateoasPageableHandlerMethodArgumentResolver();
   // PagedResourcesAssembler accountPageAssembler = new PagedResourcesAssembler(resolver, null);
   // private PageableHandlerMethodArgumentResolver pageableArgumentResolver=new PageableHandlerMethodArgumentResolver() ;
    private PageableHandlerMethodArgumentResolver pageableArgumentResolver=new HateoasPageableHandlerMethodArgumentResolver() ;

    @Before
    public  void  init(){
    	
        MockitoAnnotations.initMocks(this);
      //  pageableArgumentResolver.
        mockMvc = MockMvcBuilders
                .standaloneSetup(dogController).setCustomArgumentResolvers(pageableArgumentResolver)
                .build();
        mockMvc = MockMvcBuilders
                .standaloneSetup(dogController).setCustomArgumentResolvers(resolver)
                .build();
        mockMvc =  MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
     
    }
    
    
    @Test
    public void testGetDogMockMvc() throws Exception {
    	
       PaginationUtil paginationUtilMock = PowerMockito.mock(PaginationUtil.class);
    	
    	//PaginationUtil paginationUtilMock = PowerMockito.mock(PaginationUtil.class);
    	//PowerMockito.mockStatic(PaginationUtil.class);
    	DogDTO result =new DogDTO();
    	result.setId((long) 2);
    	PaginationUtil paginationUtilspy = PowerMockito.spy(new PaginationUtil());
    	String uriString=UriComponentsBuilder.fromUriString("/api/dogs").queryParam("page", 1).queryParam("size", 10).toUriString();
    	//PowerMockito.doReturn(uriString).when(paginationUtilspy, "generateUri", anyString(), anyInt(), anyInt());
    	//PowerMockito.doReturn(uriString).when(paginationUtilspy, "generateUri", anyString(), anyInt(), anyInt());
    	 //
    	// when(paginationUtilspy, "generateUri", anyString(), anyInt(), anyInt()).;
    //	when(paginationUtilMock.generateUri(anyString(), 0, 0)).thenReturn(null);
    	//when(spy, method(PaginationUtil.class, "getGreetingFormat")).
    	
    //	PowerMockito.expectPrivate(paginationUtilspy, "generateUri", anyString(), anyInt(), anyInt()).andReturn(true);
    	 DogDTO dogDTO1=new DogDTO();
    	 DogDTO dogDTO2=new DogDTO();
    	

    	 List<DogDTO> list =  Arrays.asList(dogDTO1,dogDTO2);
    	 
    	Page<DogDTO> page= new PageImpl(list);
    	when(pageMock.getTotalElements()).thenReturn((long)3);
    	//when(paginationUtilMock.generatePaginationHttpHeaders(any(Page.class),anyString())).thenReturn(null);
    	
    	//when(PaginationUtil.generatePaginationHttpHeaders(new PageImpl(new ArrayList()),anyString())).thenReturn(null);
    	
    	
    //	when(paginationUtilMock.generatePaginationHttpHeaders(any(org.springframework.data.domain.Page.class),anyString())).thenReturn(null);
    	when(dogServiceMock.findAll(any(Pageable.class))).thenReturn(page);
    	 mockMvc.perform(get("/api/dogs"))
         .andExpect(status().isOk());
       
    	HttpHeaders headers = new HttpHeaders();

     		HttpEntity<String> entity = new HttpEntity<String>(null, headers);
    		ResponseEntity<String> response = restTemplate.exchange(
    				createURLWithPort("/SpringBootCRUDApp/api/dogs"),
    				HttpMethod.GET, entity, String.class);
    		response.getBody();
    }
    
    @Test
    public void testGetDogById() throws Exception {
    	DogDTO dogDTOReturn =createTestDogDTO();
    	dogDTOReturn.setId((long) 2);
    	 when(dogServiceMock.findOne(anyLong())).thenReturn(dogDTOReturn);
        mockMvc.perform(get("/api/dogs/{id}", 1))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
                .andExpect(jsonPath("$.id", is(2)));
        verify(dogServiceMock, times(1)).findOne(anyLong());
        verifyNoMoreInteractions(dogServiceMock);
    }
    
    
    @Test
    public void testPostDog() throws Exception {
    	DogDTO dogDTO =createTestDogDTO();
    	DogDTO dogDTOReturn =createTestDogDTO();
    	dogDTOReturn.setId((long) 2);
    	
    	 when(dogServiceMock.save(any(DogDTO.class))).thenReturn(dogDTOReturn);
    	 
         mockMvc.perform(post("/api/dogs").contentType(TestUtil.APPLICATION_JSON_UTF8)
         .content(TestUtil.convertObjectToJsonBytes(dogDTO))
 )
                 .andExpect(status().isCreated());
  
         ArgumentCaptor<TodoDTO> dtoCaptor = ArgumentCaptor.forClass(TodoDTO.class);
         verify(todoServiceMock, times(1)).add(dtoCaptor.capture());
         verifyNoMoreInteractions(todoServiceMock);
    	
    	
    }
    
    
    @Test
    public void testUpdateDog() throws Exception {
    	
    	DogDTO dogDTOReturn =createTestDogDTO();
    	dogDTOReturn.setId((long) 2);
       // doNothing().when(dogServiceMock).save(dogDTOReturn);
    	 when(dogServiceMock.save(any(DogDTO.class))).thenReturn(dogDTOReturn);
        mockMvc.perform(
                put("/api/dogs")
                .contentType(TestUtil.APPLICATION_JSON_UTF8)
                .content(TestUtil.convertObjectToJsonBytes(dogDTOReturn)))
                .andExpect(status().isOk());
        verify(dogServiceMock, times(1)).save(dogDTOReturn);
        verifyNoMoreInteractions(dogServiceMock);
     
    }
  
   
   @Test
   public void testDeleteDogByID() throws Exception {
		DogDTO dogDTOReturn =createTestDogDTO();
    	dogDTOReturn.setId((long) 2);
    
       doNothing().when(dogServiceMock).delete(dogDTOReturn.getId());
       mockMvc.perform(
               delete("/api/dogs/{id}", dogDTOReturn.getId()))
               .andExpect(status().isNoContent());
    
       verify(dogServiceMock, times(1)).delete(dogDTOReturn.getId());
       verifyNoMoreInteractions(dogServiceMock);
   }
   
   private DogDTO createTestDogDTO() {
	   DogDTO dogDTO =new DogDTO();
	   dogDTO.setDogName("Unit Test Dog Name");
	   dogDTO.setDogbreedId((long)3);
		return dogDTO;
	}

// @Test
    public void testCreateDog() throws Exception {
    	
    	DogDTO result =new DogDTO();
    	result.setId((long) 2);
       
    	HttpHeaders headers = new HttpHeaders();
        HttpEntity<String> entity = new HttpEntity<String>(null, headers);

    		ResponseEntity<String> response = restTemplate.exchange(
    				createURLWithPort("/SpringBootCRUDApp/api/dogs"),
    				HttpMethod.GET, entity, String.class);

    		response.getBody();

    		String expected = "{id:Course1,name:Spring,description:10 Steps}";
    		JSONAssert.assertEquals(expected, response.getBody(), false);
    	
    	

    	
    	ResponseEntity<DogDTO> responseEntityDogDTO=ResponseEntity.created(new URI("/api/dogs/" + result.getId()))
                .headers(HeaderUtil.createEntityCreationAlert(ENTITY_NAME, result.getId().toString()))
                .body(result); 
     when(dogService.save(result)).thenReturn(result);
    
     //.body(result)
     mockMvc.perform(post("/api/dogs"))
     .andExpect(status().isOk());
        List<User> users = Arrays.asList(
                new User(1, "Daenerys Targaryen"),
                new User(2, "John Snow"));

        when(userService.getAll()).thenReturn(users);

        mockMvc.perform(get("/users"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$[0].id", is(1)))
                .andExpect(jsonPath("$[0].username", is("Daenerys Targaryen")))
                .andExpect(jsonPath("$[1].id", is(2)))
                .andExpect(jsonPath("$[1].username", is("John Snow")));

        verify(userService, times(1)).getAll();
        verifyNoMoreInteractions(userService);
    }
    
   
    
    private String createURLWithPort(String uri) {
		return uri;
		//return "http://localhost:" + port + uri;
	}*/

}
