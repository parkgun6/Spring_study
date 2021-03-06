package org.zerock.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Todo {

	private Integer tno;
	private String title;
	private Boolean complete;
	private Date regdate;
	
}
