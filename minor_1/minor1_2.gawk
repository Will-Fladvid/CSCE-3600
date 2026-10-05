#WJF0053 William Fladvid

BEGIN {FS = "\t"}

NR > 2 {
score1 = ($3 == "") ? "--" : $3
score2 = ($4 == "") ? "--" : $4
score3 = ($5 == "") ? "--" : $5

if (score1 == "--" || score2 == "--" || score3 == "--"){
grade = "F"
note = " (missing scores)"
} else {
avg = ($3 + $4 + $5) / 3.0

	if (avg >= 89.5){
		grade = "A"
	} else if (avg >= 79.5) {
		grade = "B"
	} else if (avg >= 69.5) {
            grade = "C"
        } else if (avg >= 59.5) {
            grade = "D"
        } else {
            grade = "F"
        }
        note = ""
    }


printf "%-11s %-9s %-5s %-5s %-4s => %s%s\n", $1, $2, score1, score2, score3, grade, note
}
