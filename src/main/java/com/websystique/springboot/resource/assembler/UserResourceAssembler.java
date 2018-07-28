package com.websystique.springboot.resource.assembler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.hateoas.Resource;
import org.springframework.hateoas.mvc.ControllerLinkBuilder;
import org.springframework.hateoas.mvc.ResourceAssemblerSupport;
import org.springframework.stereotype.Component;

import com.websystique.springboot.controller.RestApiController;
import com.websystique.springboot.dto.UserDTO;
@Component 
public class UserResourceAssembler extends ResourceAssemblerSupport<UserDTO, Resource> {

    public UserResourceAssembler() {
        super(RestApiController.class, Resource.class);
    }

    @Override
    public List<Resource> toResources(Iterable<? extends UserDTO> users) {
        List<Resource> resources = new ArrayList<Resource>();
        for(UserDTO user : users) {
            resources.add(new Resource<UserDTO>(user, ControllerLinkBuilder.linkTo(RestApiController.class).slash(user.getId()).withSelfRel()));
        	//  resources.add(new Resource<UserDTO>(user));
        }
        return resources;
    }

    @Override
    public Resource toResource(UserDTO user) {
        //return new Resource<UserDTO>(user, ControllerLinkBuilder.linkTo(RestApiController.class).slash(user.getId()).withSelfRel());
        return new Resource<UserDTO>(user);
    }
}