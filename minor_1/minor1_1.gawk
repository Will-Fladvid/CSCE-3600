#WJF0053 William Fladvid

NR == 1 {next}

NF == 0 {next}


{

	coterminal = (($1 % 360) + 360) % 360

	printf "%10d %10d\n", $1, coterminal

}

