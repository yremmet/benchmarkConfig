package de.fhbingen.bin.hungrig.data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "offeredAt")
public class OfferedAt {
	
	public OfferedAt(){};
	
	public OfferedAt(final long dishId, final long dateId){
		this.dishId = dishId;
		this.dateId = dateId;
	}
	
	@Column(name = "fk_dishId")
	private long dishId;
	
	@Column(name = "fk_dateId")
	private long dateId;
	
	@OneToOne
	@JoinColumn(name = "fk_dishId", insertable = false, updatable = false)
	private Dish dish;
	
	//Workaround. In DB seq is not PK but compound pk produces
	//Exceptions in JPA Custom Query findByBuildingIdsAndSeq
	@Id
	private long seq;

	public long getDishId() {
		return dishId;
	}

	public long getDateId() {
		return dateId;
	}

	public long getSeq() {
		return seq;
	}
	
}
