extends Node
var saveGameClass = load("res://Szenen/GUI/SaveData.gd")
var avatarsaved = false
var conectedPlayers = 0
var saveGamesWaiting = []
var isMaybeDisconnected = false 
var network  : NetworkedMultiplayerENet
var saveGamesRec = []
var timer = 0.0
var isloading = false
var hasNotifiedConnectionLost = false



func _ready():
#		get_tree().connect("connected_to_server", self, "connectedToServer")
#		get_tree().connect("server_disconnected", self, "disconnectedFromServer")
#		get_tree().connect("connection_failed", self, "client_connected_fail")
	pass
#func _process(delta):
#	timer += delta
#	if timer >5:
#		timer -=5
#		if isMaybeDisconnected:
#			connectSaver()
#			isMaybeDisconnected = false

#
#func connectSaver():
#
#	network = NetworkedMultiplayerENet.new()
#	var err = network.create_client("fe80::1",8080)
#	print("create network client status: "+ str(err))
#	get_tree().network_peer = network
#

func save_game():
	var save_game = createSaveGame()
	
	var err = ResourceSaver.save("./testsave.tres",save_game)
	
	if !avatarsaved:
		var packed_scene = PackedScene.new()
		packed_scene.pack(GlobalScenes.House.get_node("CompositeSprites"))
		if (ResourceSaver.save("./lastAvatar.tscn", packed_scene) == 0):
			avatarsaved = true
	return err
	
	
func createSaveGame(): 
	var save_game :SaveData= saveGameClass.new()
	save_game.dirs = []
	for Chap in GlobalScenes.allChapters:
		save_game.dirs.append(Chap.save_this())
	for lvlv in GlobalScenes.allLevelViews:
		save_game.dirs.append(lvlv.save_this())
	for aufgv in GlobalScenes.allAufgabenViews:
		save_game.dirs.append(aufgv.save_this())
	save_game.book= GlobalScenes.BookScene.save_this()
#	save_game.flow = DataCollected.save_this()
	save_game.fehler= Myglobals.progressInfo.save_this()
	save_game.chaptersUnlocked =Myglobals.chaptersUnlocked
	save_game.currChaptersIndex =GlobalScenes.currentChapterIndex 
	save_game.playername = GlobalScenes.House.get_node("ProgressInfo/Name").text
	save_game.playtime = Myglobals.playtime
	save_game.progress = Myglobals.progressInfo.get_node("ProgressBar").value
	save_game.firstRoomEntered = Myglobals.firstRoomEntered
	save_game.avatar = GlobalScenes.Avatar.save_this()
#	save_game.flowused = Myglobals.game.save_this()
	save_game.versionNr = Myglobals.VERSION_NR
	save_game.house = GlobalScenes.House.save_this()
	return save_game

func sendSave():
	var save_game : SaveData = createSaveGame()
	saveGamesWaiting.append(save_game)
#	rpc_id(1, "recieveFromClient",[save_game.playername,save_game.fehler,save_game.book,save_game.dirs,save_game.chaptersUnlocked,save_game.currChaptersIndex, save_game.playtime,save_game.avatar,save_game.firstRoomEntered ],saveGamesWaiting.size()-1)
	
	saveGamesRec.append(false)
	

#func connectedToServer():
#	isMaybeDisconnected = false
#	hasNotifiedConnectionLost = false
#	print ("connected_to_server")
#	conectedPlayers += 1
#	var i = 0
#	for save_game in  saveGamesWaiting:
#		if !saveGamesRec[i] :
#			rpc_id(1, "recieveFromClient",[save_game.playername,save_game.fehler,save_game.book,save_game.dirs,save_game.chaptersUnlocked,save_game.currChaptersIndex, save_game.playtime,save_game.avatar,save_game.firstRoomEntered ],i )
##		i+=1
#
#func client_connected_fail():
#	print("client failed to connect")
#	isMaybeDisconnected = true
#	sayConnectionDown()
#
#
#func disconnectedFromServer():
#	isMaybeDisconnected = true
#
#	sayConnectionDown()
	
func load_game():
	isloading = true

	var save_game : SaveData = load("./testsave.tres")
	 
	if(save_game.versionNr != Myglobals.VERSION_NR) :
		GlobalScenes.MainMenu.showWarning("Die Version des Spiels: "+ Myglobals.VERSION_NR +" stimmt nicht mit dem Speicherstand: "+ save_game.versionNr + " ueberein.")
		return






	GlobalScenes.allChapters[0].load_this(save_game.dirs[0])
	GlobalScenes.allChapters[1].load_this(save_game.dirs[1])
	GlobalScenes.allChapters[2].load_this(save_game.dirs[2])
	GlobalScenes.allChapters[3].load_this(save_game.dirs[3])

	GlobalScenes.allLevelViews[0].load_this(save_game.dirs[4])
	GlobalScenes.allLevelViews[1].load_this(save_game.dirs[5])
	GlobalScenes.allLevelViews[2].load_this(save_game.dirs[6])
	GlobalScenes.allLevelViews[3].load_this(save_game.dirs[7])

	GlobalScenes.allAufgabenViews[0].load_this(save_game.dirs[8])
	GlobalScenes.allAufgabenViews[1].load_this(save_game.dirs[9])
	GlobalScenes.allAufgabenViews[2].load_this(save_game.dirs[10])
	GlobalScenes.allAufgabenViews[3].load_this(save_game.dirs[11])
	
	GlobalScenes.BookScene.load_this(save_game.book)
#	DataCollected.load_this(save_game.flow)
	Myglobals.progressInfo.load_this(save_game.fehler)

	Myglobals.chaptersUnlocked=save_game.chaptersUnlocked
	GlobalScenes.House.load_this(save_game.house)
	Myglobals.gameInNewState = false
	var packed_scene = load("./lastAvatar.tscn")

	var my_scene = packed_scene.instance()
	
	if GlobalScenes.House.has_node("CompositeSprites"):
		GlobalScenes.House.remove_child(GlobalScenes.House.get_node("CompositeSprites"))
	GlobalScenes.House.add_child(my_scene)
	Myglobals.avatarNode = my_scene
	Myglobals.avatarNode.position.x = 1160
	Myglobals.avatarNode.position.y = 270
	GlobalScenes.House.get_node("ProgressInfo/Name").text = save_game.playername
	Myglobals.avatarNode.scale.x = -1
	Myglobals.avatarNode.scale.y = 1
	Myglobals.avatarNode.load_this(save_game.avatar)
	avatarsaved = true
	GlobalScenes.outroScene.get_node("roof_out/cutsceneAvatar").own_init()
	
	Myglobals.playtime = save_game.playtime
	
	GlobalScenes.currentChapterIndex =  save_game.currChaptersIndex
	GlobalScenes.House.get_node("KapitelInfo/Arrows").loadUnlockedLvl()
	GlobalScenes.House.changeLvl(save_game.currChaptersIndex)
	Myglobals.progressInfo.get_node("ProgressBar").value = save_game.progress
	Myglobals.firstRoomEntered = save_game.firstRoomEntered 
	
	Myglobals.gotoScene(GlobalScenes.House)
	
#	Myglobals.game.load_this(save_game.flowused)
	isloading = false
	
func sMsg(msg):
	if str(msg).length() >0:
		rpc("rMsg", str(msg),GlobalScenes.House.get_node("ProgressInfo/Name").text )
	

remotesync func rMsg(msg,code):
	var chat = GlobalScenes.House.get_node("Chat/Sprite/ItemList/VBoxContainer")
	
	var chatmsg = load("res://Szenen/chatmsg.tscn").instance()
	
	if get_tree().get_rpc_sender_id() != get_tree().get_network_unique_id():
		chatmsg.add_color_override("font_color", Color("#ff7679"))
	else:
		chatmsg.add_color_override("font_color", Color("#272c68"))
	chatmsg.text = code+ ": "+str( msg)
	
	chat.add_child(chatmsg)

func sayConnectionDown():
	if hasNotifiedConnectionLost:
		return
	hasNotifiedConnectionLost = true
	GlobalScenes.House.sayConnectedPlayers(true)
	var chat = GlobalScenes.House.get_node("Chat/Sprite/ItemList/VBoxContainer")
	
	var chatmsg = load("res://Szenen/chatmsg.tscn").instance()
	
	chatmsg.add_color_override("font_color", Color("#272c68"))
	chatmsg.text = "Keine Verbindung :("
	
	chat.add_child(chatmsg)
	
remotesync func pConnected(p):
	conectedPlayers = p
	if get_tree().get_rpc_sender_id() != get_tree().get_network_unique_id():
		GlobalScenes.House.sayConnectedPlayers(false)
	else:
		GlobalScenes.House.sayConnectedPlayers(true)

remotesync func serverReveivedSave(savegameId):
	saveGamesRec[savegameId] = true
