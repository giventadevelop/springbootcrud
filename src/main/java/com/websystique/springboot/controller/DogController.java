package com.websystique.springboot.controller;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.PagedResourcesAssembler;
import org.springframework.hateoas.PagedResources;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
//import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

//import com.codahale.metrics.annotation.Timed;
import com.websystique.springboot.dto.DogDTO;
import com.websystique.springboot.dto.GroupByDogBreedDTO;
import com.websystique.springboot.resource.assembler.DogResourceAssembler;
import com.websystique.springboot.service.DogService;
import com.websystique.springboot.util.HeaderUtil;
import com.websystique.springboot.util.PaginationUtil;

import io.swagger.annotations.Api;

/*import io.github.jhipster.web.util.ResponseUtil;
import io.swagger.annotations.ApiParam;*/

/**
 * REST controller for managing Dog.
 */
@RestController
@RequestMapping("/api")
@Api(value="Sample Dog App", description="Operations to showcase the rest API features")
public class DogController {

	private static final Logger logger = LogManager.getLogger(DogController.class);
   // private final Logger log = LoggerFactory.getLogger(DogController.class);

    private static final String ENTITY_NAME = "dog";
    
    @Autowired
    DogService dogService;
    @Autowired
    DogResourceAssembler dogResourceAssembler;
    
    /**
     * POST  /dogs : Create a new dog.
     *
     * @param dogDTO the dogDTO to create
     * @return the ResponseEntity with status 201 (Created) and with body the new dogDTO, or with status 400 (Bad Request) if the dog has already an ID
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @PostMapping("/dogs")
    //@Timed
    public ResponseEntity<DogDTO> createDog( @PageableDefault(page = 0, size = 10) Pageable pageRequest,@RequestBody DogDTO dogDTO) throws URISyntaxException {
        logger.debug("REST request to save Dog : {}", dogDTO);
        if (dogDTO.getId() != null) {
            return ResponseEntity.badRequest().headers(HeaderUtil.createFailureAlert(ENTITY_NAME, "idexists", "A new dog cannot already have an ID")).body(null);
        }
        DogDTO result = dogService.save(dogDTO);
        return ResponseEntity.created(new URI("/api/dogs/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    /**
     * PUT  /dogs : Updates an existing dog.
     *
     * @param dogDTO the dogDTO to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated dogDTO,
     * or with status 400 (Bad Request) if the dogDTO is not valid,
     * or with status 500 (Internal Server Error) if the dogDTO couldnt be updated
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @PutMapping("/dogs")
    //@Timed
    public ResponseEntity<DogDTO> updateDog(@RequestBody DogDTO dogDTO) throws URISyntaxException {
        logger.debug("REST request to update Dog : {}", dogDTO);
        if (dogDTO.getId() == null) {
            return createDog(null, dogDTO);
        }
        DogDTO result = dogService.save(dogDTO);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(ENTITY_NAME, dogDTO.getId().toString()))
            .body(result);
    }

    /**
     * GET  /dogs : get all the dogs.
     * @param pageable the pagination information
     * @return the ResponseEntity with status 200 (OK) and the list of dogs in body
     */
    @SuppressWarnings("unchecked")
	@GetMapping("/dogs")
    //@Timed
    public PagedResources<DogDTO> getAllDogs(  @PageableDefault(page = 0, size = 10) Pageable pageable,PagedResourcesAssembler assembler) {
    	logger.debug("REST request to get a page of Dogs");
       Page<DogDTO> page = dogService.findAll(pageable);
       /* String loggedInUserName=SecurityContextHolder.getContext().getAuthentication().getName();
        Page<DogUserDogDTO> pageUserDog = dogService.getDogUserDog(pageable, loggedInUserName);*/
       HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/dogs");
      //  HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/dogs");
      // return new ResponseEntity<>(page.getContent(), headers, HttpStatus.OK);
       return assembler.toResource(page, dogResourceAssembler);
        //return new ResponseEntity<List<DogDTO>>(page.getContent(), HttpStatus.OK);
        //return new ResponseEntity<>(pageUserDog.getContent(), headers, HttpStatus.OK);
    }

    /**
     * GET  /dogs/:id : get the "id" dog.
     *
     * @param id the id of the dogDTO to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the dogDTO, or with status 404 (Not Found)
     */
    @GetMapping("/dogs/{id}")
    //@Timed
    public ResponseEntity<DogDTO> getDogById(@PathVariable Long id) {
        logger.debug("REST request to get Dog : {}", id);
        DogDTO dogDTO = dogService.findOne(id);
       
        return ResponseEntity.ok()
                .headers(HeaderUtil.createAlert(ENTITY_NAME, dogDTO.getId().toString()))
                .body(dogDTO);
       // return null;
    }
    
    
    /**
     * GET  /dogs/:id : get the "id" dog.
     *
     * @param id the id of the dogDTO to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the dogDTO, or with status 404 (Not Found)
     */
    @GetMapping("/dogs/image/{id}")
    //@Timed
    public void getDogImage(@PathVariable Long id,final HttpServletResponse response) {
    	 logger.debug("REST request to get Dog Image: {}", id);
    	DogDTO dogDTO = dogService.findOne(id);
    	ServletOutputStream outStream;
		try {
			outStream = response.getOutputStream();
			byte[] bufferImage = dogDTO.getDogPicture();
	    	response.setContentType("image/jpeg");
	    	outStream.write(bufferImage);
	    	outStream.flush();     
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   
       }

    /**
     * DELETE  /dogs/:id : delete the "id" dog.
     * @param id the id of the dogDTO to delete
     * @return the ResponseEntity with status 200 (OK)
     */
    @DeleteMapping("/dogs/{id}")
   // @RequestMapping(value="/dogs/{id}",method=RequestMethod.DELETE)
    //@Timed
   // (@RequestBody DogDTO dogDTO) throws URISyntaxException {
   // public ResponseEntity<DogDTO> deleteDog(@RequestBody DogDTO dogDTO) throws URISyntaxException {
  //  public ResponseEntity<DogDTO> deleteDog() throws URISyntaxException {
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteDog(@PathVariable Long id) throws URISyntaxException {
    //public ResponseEntity<Void> deleteDog(@PathVariable Long id) {
    	/*Long id=dogDTO.getId();
        log.debug("REST request to delete Dog : {}", id);
        dogService.delete(id);
       // return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert(ENTITY_NAME, id.toString())).build();
        return ResponseEntity.ok()
                .headers(HeaderUtil.createEntityUpdateAlert(ENTITY_NAME, dogDTO.getId().toString()))
                .body(dogDTO);*/
    	 logger.debug("Delete Dog called." );
    	  logger.debug("REST request to delete Dog : {}", id);
    	  dogService.delete(id);
    	 
    }
    
    // --  Dogs GROUP BY breed ---
    /**
     * GET  /dogs/breed/groupby : get all the Dogs GROUP BY breed.
     *
     * @param pageable the pagination information
     * @return the ResponseEntity with status 200 (OK) and the list of dogs in body
     */
    @GetMapping("/dogs/breed/groupby")
    //@Timed
    public ResponseEntity<List<GroupByDogBreedDTO>> getAllDogsBreedsGroupBy(  @PageableDefault(page = 0, size = 10) Pageable pageable) {
        logger.debug("REST request to get a page of dog breeds GROUP BY");
        Page<GroupByDogBreedDTO> page = dogService.getAllDogsBreedsGroupBy(pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/dogs/breed/groupby");
        return new ResponseEntity<>(page.getContent(), headers, HttpStatus.OK);
    }

}
