package de.fhbingen.bin.hungrig.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import de.fhbingen.bin.hungrig.data.Dish;
import de.fhbingen.bin.hungrig.data.Rating;
import de.fhbingen.bin.hungrig.data.repo.BuildingRepository;
import de.fhbingen.bin.hungrig.data.repo.DateRepository;
import de.fhbingen.bin.hungrig.data.repo.DishRepository;

@RestController
@RequestMapping("/api")
public class WebAppControler {

	@Autowired
	BuildingRepository buildings;
	@Autowired
	DishRepository dishes;
	@Autowired
	DateRepository dates;
	
	
	@RequestMapping("/getBuildings")
	public ResponseEntity<Object> buildings(){
		return new ResponseEntity<Object> (buildings.findAll(),HttpStatus.OK);
	}

	@RequestMapping("/getDishes")
	public ResponseEntity<Object> dishes(@RequestParam("buildingId") int buildingId, @RequestParam("date") Date date){
		de.fhbingen.bin.hungrig.data.Date dateObj = dates.findByDate(date);
		if(dateObj == null){
			return new ResponseEntity(new LinkedList<>(), HttpStatus.OK);
		}
		List<Dish> dishList = dateObj
				.getOfferedDishes()
				.stream().filter(dish -> {
			return dish.getBuildingId() == buildingId;
		}).collect(Collectors.toList());
		
		List<Object> results = new LinkedList<>();
		for(Dish dish : dishList){
			HashMap<String, Object> dishResult = new HashMap();
			dishResult.put("dish", dish);
			dishResult.put("rateings", dish.getRatings());
			int sum = 0;
			for(Rating r : dish.getRatings()){
				sum += r.getValue();
			}
			if(sum > 0)
				sum /= dish.getRatings().size();
			dishResult.put("ratingsAverage", sum);
			dishResult.put("thumbnail", "photo");
			results.add(dishResult);
		}
		
		return new ResponseEntity<>(results, HttpStatus.OK);
	}

}
