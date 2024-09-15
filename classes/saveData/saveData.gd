class_name SaveData extends Resource

var saveVersion := "v1.5.2"

var worldsUnlocked := 0

var worlds := {
	"Flower City" : WorldData.new(0, 10, 0, "Flower City"),
	"Gears And Leafs" : WorldData.new(0, 5, 1, "Gears And Leafs")
}

var config := {
	"volume" : {
		"music" : db2linear(-7.5),
		"sfx" : db2linear(-3.9)
	}
}
