import org.apache.spark.sql.functions

val dataBall = spark.read
	.option("header","true")
	.csv("Z:/IPL/Ball_by_Ball.csv")

val noofWicket = dataBall.filter( col("Dissimal_Type")
	.equalTo("caught") || col("Dissimal_Type")
	.equalTo("bowled") || col("Dissimal_Type")
	.equalTo("caught and bowled") || col("Dissimal_Type")
	.equalTo("stumped") || col("Dissimal_Type")
	.equalTo("lbw") || col("Dissimal_Type").equalTo("hit wicket"))

val grpWicket = noofWicket.groupBy("Bowler_Id").count

val dataBat = dataBall.withColumn("Batsman_Scored", col("Batsman_Scored").cast("Integer"))
val runsScored = dataBat.groupBy("Striker_Id")
	.sum("Batsman_Scored")

val dataWicket = grpWicket.withColumnRenamed("wicket", "count")
val dataRuns = runsScored.withColumnRenamed("runs", "sum(Batsman_Scored)")

val dataJoin = dataWicket.join(dataRuns, dataWicket.col("Bowler_Id") ===
dataRuns.col("Striker_Id"), "outer")
val RunsnWicket = dataJoin.na.fill("0", Seq("Bowler_Id"))
	.na.fill("0", Seq("Striker_Id"))
	.na.fill(0, Seq("wicket"))
	.na.fill(0, Seq("runs"))
	
val getPlayerId = dataJoin.map(r=>
	(if (r.getString(0)==null)
		{ r.getString(2)} 
	else if (r.getString(2)==null) 
		{r.getString(0)} 
	else 
		{r.getString(2)}
	)
)

val temp1 = getPlayerId.withColumn("index", monotonicallyIncreasingId)
val temp2 = RunsnWicket.withColumn("index", monotonicallyIncreasingId)

val temp0 = temp1.join(temp2, Seq("index"))

val playerSet = temp0.select("value","wicket","runs").
	withColumnRenamed("value", "Player_Id")

val playerData = spark.read
	.option("header","true")
	.csv("Z:/IPL/Player.csv")

val finalset = playerSet.join(playerData, Seq("Player_Id"), "left")
val iplSet = finalset.drop("Is_Umpire")

iplSet.coalesce(1).write.option("header","true").csv("Z:/IPL/ipl_data")

val iplMatch = spark.read
	.option("header","true")
	.csv("Z:/IPL/IPLB.csv")

val iplMatches = iplMatch.withColumn("Mat", col("Mat").cast("Integer"))
val iplMatchCount = iplMatches.groupBy("Player").sum("Mat")
	
val matchCount = iplSet.join(iplMatchCount, iplSet.col("Player_Name") === iplMatchCount.col("Player"), "left")
val iplPlayerData = matchCount.drop("Player")

iplPlayerData.coalesce(1).write.option("header","true").csv("Z:/IPL/finalset")

val datatempo=matchCount.withColumn("wicket", col("wicket").cast("Double")).withColumn("runs", col("runs").cast("Double"))
val avgnWicket = datatempo.map(r=>
	(r.getString(3)
	,r.getDouble(1)
	,r.getDouble(2)
	,r.getString(4)
	,r.getString(5)
	,r.getString(6)
	,r.getString(7)
	,r.getLong(9)
	,r.getDouble(2)/r.getLong(9)
	,r.getDouble(1)/r.getLong(9)))
.toDF("Player","wicket","runs","DOB","Batting_Hand","Bowling_Skill","Country","Match","Avg","Wicket_per")
avgnWicket.coalesce(1).write
	.option("header","true")
	.csv("Z:/IPL/AVG_WICKET")


B. Union of the IPL Rating and International Rating
___________________________________________________________________

val internationalBat = spark.read
	.option("header","true")
	.csv("Z:/IPL/InternationalBatsmenTable.csv")

val internationalWicket = spark.read
	.option("header","true")
	.csv("Z:/IPL/InternationalBowlersTable.csv")

val iplRating = spark.read
	.option("header","true")
	.csv("Z:/IPL/IPLFinal.csv")

val selectBowler = iplRating.select("Player","BowlersRating")
val selectBat = iplRating.select("Player","BatsmenRating")

val bowlerRating = selectBowler.union(internationalWicket)
val batRating = selectBat.union(internationalBat)

bowlerRating.coalesce(1).write
	.option("header","true")
	.csv("Z:/IPL/mapreducebowler")
batRating.coalesce(1).write
	.option("header","true")
	.csv("Z:/IPL/mapreducebatsman")
