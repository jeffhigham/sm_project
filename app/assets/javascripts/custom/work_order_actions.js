function adjust_price(){

	var removal_preferences = {
		1: "Driveway Only",
		2: "Driveway + Sidewalks",
		3: "Driveway + Sidewalks"
	};

	var snow_depths = {
		1: "6 Inches",
		2: "12 Inches",
		3: "18 Inches",
		4: "24 Inches"
	};

	// pricing structure
	var driveway_type_prices = {
		1: 20.00, // 1-car
		2: 25.00, // 2-car
		3: 30.00  // 3-car
	}

	var long_driveway_percent = .03;
	var long_sidewalk_percent = .02;
	var deice_percent = .02;
	var deep_snow_percent = .10;
	var extra_deep_snow_percent = .20;
	var driveway_under_20_feet_discount = .05;
	var driveway_only_discount_percent = .05;
	var light_snow_discount_percent = .05;


	var driveway_type_id = parseInt($('#driveway_type_id').val());
	var driveway_length = parseInt($('#driveway_length').val());
	var sidewalk_length = parseInt($('#sidewalk_length').val());
	var snow_depth_id = parseInt($('#work_order_snow_depth_id').val());
	var removal_selection_id = parseInt($('#work_order_removal_preferences_id').val()); 
	
	var base_price = driveway_type_prices[driveway_type_id];
	var price = base_price;
	
	if(snow_depth_id == 1){ // 6 Inches
		price -= (base_price * light_snow_discount_percent);
	}

	else if( snow_depth_id == 3  ){ // 18 Inches
		price += (base_price * deep_snow_percent);	
	}

	else if (snow_depth_id == 4){ // 24 Inches
		price += (base_price * extra_deep_snow_percent);
	}

	if( driveway_length >= 35 ){ // long driveway
		price += (base_price * long_driveway_percent);
	}

	if(removal_selection_id == 1 ){ // Driveway Only

		price -= (base_price * driveway_only_discount_percent);
		$('#price_table_deice_sidewalk').hide();
		$('#sidewalk_name').hide();

	}

	else if (removal_selection_id == 2 ){ // Driveway + Sidewalks

		if( sidewalk_length >= 50 ){ // long driveway
			price += (base_price * long_sidewalk_percent);
		}

		$('#price_table_deice_sidewalk').hide();
		$('#sidewalk_name').show();

	}

	else if (removal_selection_id == 3 ){ // Driveway + Sidewalks + De-ice
		
		price += (base_price * deice_percent);
		
		if( sidewalk_length >= 50 ){ // long driveway
			price += (base_price * long_sidewalk_percent);
		}
		
		$('#sidewalk_name').show();
		$('#price_table_deice_sidewalk').show();

	}

	$('#price_table_snow_depth').text('Snow Is '+ snow_depths[snow_depth_id] +' Inches');
	$('#price_table_removal_preference').text(removal_preferences[removal_selection_id]);
	$('#price_table_price').text('$'+ Math.round(price));
	$('#work_order_price').val(Math.round(price));

	return true;

}

function schedule_it(){
	adjust_price();
	$('#work_order_form').submit();
	return true;
}