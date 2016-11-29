package de.fhbingen.bin.hungrig.controller;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.jboss.logging.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import de.fhbingen.bin.hungrig.statistics.data.PathTuple;
import de.fhbingen.bin.hungrig.statistics.data.StatisticsRequestRepository;
import de.fhbingen.bin.hungrig.statistics.data.StatusTuple;
import de.fhbingen.bin.hungrig.statistics.data.TimeTuple;
import de.fhbingen.bin.hungrig.statistics.data.UserAgentTuple;
@RestController
@RequestMapping("/statistic")
public class StatisticsController {
	
	@Autowired
	StatisticsRequestRepository repo;
	
	@RequestMapping(path="/graph")
	public ResponseEntity<Object> graph(@RequestParam("min") Timestamp min,
			@RequestParam("max") Timestamp max,
			@RequestParam("minutes") int minutes){
		
		List<TimeTuple> list= repo.timeStampGreaterThanAndTimestampLessThanGroupByMinutes(min, max, minutes);
		
		// "Order By" seems not to be working correctly with timestamps :O
		// at least I cant get it to work now 
		Collections.sort(list, new Comparator<TimeTuple>(){
		    public int compare(TimeTuple o1, TimeTuple o2){
		    	return (int) (o1.timestamp-o2.timestamp);
		    }
		});
		
		HashMap<String, Object> response = new HashMap();
		response.put("response", list);
		return new ResponseEntity(response, HttpStatus.OK);
		
	}
	
	@RequestMapping(path="/pieChart")
	public ResponseEntity<Object> pieChart(){
		HashMap<String, Object> response = new HashMap();
		long now = System.currentTimeMillis();
		List<Object> responseList = new LinkedList();
		responseList.add(getData(now-3600000, now, "Last Hour"));
		responseList.add(getData(now-5*3600000, now, "Last 5 Hours"));
		responseList.add(getData(now-24*3600000, now, "Last 24 Hours"));
		responseList.add(getData(now-7*24*3600000, now, "Last 7 Days"));
		responseList.add(getData(now-30*24*3600000, now, "Last 30 Days"));
		responseList.add(getData(now-180*24*3600000, now, "Last 180 Days"));
		response.put("response", responseList);
		return new ResponseEntity(response, HttpStatus.OK);
	}
 
	private HashMap<String,Object> getData(long min, long max, String description){
		HashMap<String, Object> h = new HashMap<>();
		Timestamp m = new Timestamp(min);
		Timestamp x = new Timestamp(max);
		
		List<StatusTuple> sts = repo.timeStampGreaterThanAndTimestampLessThanGroupByStatus(m, x);
		List<UserAgentTuple> uts = repo.timeStampGreaterThanAndTimestampLessThanGroupByUserAgent(m, x);
		List<PathTuple> pts = repo.timeStampGreaterThanAndTimestampLessThanGroupByPath(m, x);
		
		h.put("description", description);
		h.put("byStatus", sts);
		h.put("byUserAgent", uts);
		h.put("byPath", pts);
		
		return h;
		

	}
	
	

}
