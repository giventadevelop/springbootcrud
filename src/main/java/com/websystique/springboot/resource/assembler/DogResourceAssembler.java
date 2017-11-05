package com.websystique.springboot.resource.assembler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.hateoas.Resource;
import org.springframework.hateoas.mvc.ControllerLinkBuilder;
import org.springframework.hateoas.mvc.ResourceAssemblerSupport;
import org.springframework.stereotype.Component;

import com.websystique.springboot.controller.DogController;
import com.websystique.springboot.dto.DogDTO;
@Component 
public class DogResourceAssembler extends ResourceAssemblerSupport<DogDTO, Resource> {

    public DogResourceAssembler() {
        super(DogController.class, Resource.class);
    }

    @Override
    public List<Resource> toResources(Iterable<? extends DogDTO> dogs) {
        List<Resource> resources = new ArrayList<Resource>();
        for(DogDTO dog : dogs) {
            resources.add(new Resource<DogDTO>(dog, ControllerLinkBuilder.linkTo(DogController.class).slash(dog.getId()).withSelfRel()));
        	//  resources.add(new Resource<DogDTO>(dog));
        }
        return resources;
    }

    @Override
    public Resource toResource(DogDTO dog) {
        //return new Resource<DogDTO>(dog, ControllerLinkBuilder.linkTo(DogController.class).slash(dog.getId()).withSelfRel());
        return new Resource<DogDTO>(dog);
    }
}