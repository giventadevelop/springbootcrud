package com.websystique.cuccumber.integration.test;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

@RunWith(SpringRunner.class)
public class CucumberScenarioTest {

	private static final Logger logger = LogManager.getLogger(CucumberScenarioTest.class);
	
	
	@Test
	public void theDummyTest()  {
		// Write code here that turns the phrase above into concrete actions
		logger.debug("@Test the Dummy Test called in CucumberScenarioTest.class");

	}

	@When("^the client calls /version$")
	public void the_client_calls_version() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		logger.debug("@When called in CucumberScenarioTest.class");

	}

	@Then("^the client receives status code of (\\d+)$")
	public void the_client_receives_status_code_of(int arg1) throws Throwable {
		logger.debug("@Then called in CucumberScenarioTest.class");

	}

	@Then("^the client receives server version (\\d+)\\.(\\d+)$")
	public void the_client_receives_server_version(int arg1, int arg2) throws Throwable {
		logger.debug("@Then #2 the client receives called in CucumberScenarioTest.class");

	}

}
