extends Node

class_name ElectricSolver
var allEdgesBase
var allKnodesBase

var allEdgesNodes
var allKnodesNodes

# Graph G in int
var G = []
var root


var N =[]				# holds all neighbors for each knode
var depth = []			# stores the depth to a node
var visited = []			# bfs function flags
var parent = []			# stores parent to a node
var aliases = []			# indicates aliases and stores corresonding original
var Gvisiteds = []
var connected =0
var cycles
var deleted =[]

var Gvisited2 = []

signal closedCircuit(isClosed)
signal closedGraphPart(G,root,cycles)

func _ready():
	var error = self.connect("closedGraphPart",self,"fixShortcut",[], CONNECT_DEFERRED)
	if error != OK:
		print("Failed to connect signal: ", error)

func updateBase():
	allEdgesBase =  get_parent().get_node("Edges")
	allKnodesBase = get_parent().get_node("Knodes")
	allEdgesNodes = allEdgesBase.get_children()
	allKnodesNodes = allKnodesBase.get_children()

	G = []
	N = []
	depth = []
	visited = []
	parent = []

	for e in allEdgesBase.get_children():
		e.power = 0
		e.resetFire()

	#initialize graph mit indexen (alle knodes rein)
	Gvisited2 = []
	for k in allKnodesNodes:
		G.append(k.get_position_in_parent())
		#array an neighbors fuer den aktuellen knoten (indexe)
		var ns =[]
		for n in k.neighbors:
			ns.append(n.get_position_in_parent())
		# N haelt alle neighbors an knoten
		N.append(ns)
		# fuer jeden knoten im graph depth, visited und parent um 1 verlaengern und initialisieren mit -1
		depth.append( -1)
		visited.append(false)
		parent.append(-1)
	if G.size() ==0:
		return
	
	# init root 
	root = G[0]
	findG(root)
	BFS(G, root)

	for k in G:
		if k!=root:
			if Gvisited2.find(k)== -1:
				findG(k)
				# init root 
				root =k
				BFS(G, root)
				
	for x in allEdgesBase.get_children():
		if abs(x.power )> 0:
			emit_signal("closedCircuit",true)
			return
	
func findG(rootK):
	Gvisiteds = []
	var Gq = []
	# begin of bfs 
	Gq.append(rootK)
	Gvisiteds.append(rootK)
	Gvisited2.append(rootK)
	connected = 1
	while(Gq.size()>0):
		var v = Gq[0]
		for n in N[v]:
			if Gvisiteds.find(n) == -1:
				connected += 1
				Gq.append(n)
				Gvisiteds.append(n)
				Gvisited2.append(n)
				
		for n in allKnodesBase.get_children():
			if n.get_position_in_parent() != v:
				for rn in n.neighbors:
					if rn.get_position_in_parent() == v:
						if Gvisiteds.find(n.get_position_in_parent()) == -1:
							connected += 1
							Gq.append(n.get_position_in_parent())
							Gvisiteds.append(n.get_position_in_parent())
							Gvisited2.append(n.get_position_in_parent())
							allKnodesBase.get_child(v).neighbors.append(n)
							n.neighbors.remove(n.neighbors.find(allKnodesBase.get_child(v)))

		Gq.remove(0)
#	print("connected " + str(connected))
#	print(Gvisiteds)
#	print(N)
	N = []
	for k in allKnodesNodes:
		
		var ns =[]
		for n in k.neighbors:
			ns.append(n.get_position_in_parent())
		# N haelt alle neighbors an knoten
		N.append(ns)
		
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func BFS(G, root):
	aliases = []
	depth= []
	parent= []
	visited = []
	for k in allKnodesBase.get_children():
		depth.append( -1)
		visited.append(false)
		parent.append(-1)
		var empty = []
		empty.append( -1)
		aliases.append(empty)
		
	var Q = []
	Q.append(root)
	depth[root] = 0
	parent[root] = 0
	visited[root] = true
	var d = 0
	
	while Q.size() != 0:
		var u = Q[0]
		Q.remove(0)
		d += 1
		
		for v in N[u]:
			if !visited[v]:
				visited[v]=true
				Q.append(v)
				parent[v] = u
				depth[v] = d 
			else: 
				aliases[u].append(v)

	cycles = 0
	for  a in aliases:
		for  aa in a:
			if aa != -1:
				cycles += 1
				
	if cycles == 0:
		return
	
	var allE = []
	for e in allEdgesNodes:
		allE.append([e.connectedKnodes[0].get_position_in_parent(), e.connectedKnodes[1].get_position_in_parent()])

	# part 1 nodes
	var matrixY = []
	var matrixX = []
	var arrE = []

	for _y in range( (G.size())+cycles ):
		matrixX = []
		arrE.append(0.0)
		for _x in range(allE.size()):
			matrixX.append( 0.0)
		
		matrixY.append(matrixX)

	var offset = 0
	for i in range(G.size()):
		var v = G[i]

		for e in allE:
			
			var otherV = -1
			
			if v == e[0]:
				otherV = e[1]
			elif v == e[1]:
				otherV = e[0]
	
			if otherV != -1  :
				var X = matrixY[i]
				var xi = findE(otherV,v,allE)
				
				if allEdgesBase.get_child(xi).isLockedDirection:
					if v == e[0]:
						X[findE(otherV, v, allE) ] = -1.0
					else:
						X[findE(otherV, v, allE) ] = 1.0
						
				else:
					if otherV> v:
						#-1
						X[findE(otherV, v, allE) ] = -1.0
						
					elif otherV < v:
						X[findE(otherV, v, allE) ] = 1.0
					
				matrixY[i] = X
	offset = G.size()
	## part 2 cycle
	var completeCycle = []
	for i in range(aliases.size()):
		for ii in range(aliases[i].size()):
			if aliases[i][ii] == -1:
				continue
			
			var parentOfAlias = i
			var original = aliases[i][ii]
			
			var cyclesCycles =[]
			var cyclesCyclesSecHalf = []

			cyclesCycles.append([original,parentOfAlias])

			var y = matrixY[offset]
			
			y = fillXinMatr(y,original,parentOfAlias,allE,arrE,offset)[0]
			
			while parentOfAlias != original:
				
				if depth[parentOfAlias] > depth[original]:		    # i.e rechts alias weg
					
					cyclesCycles.append([ parentOfAlias,parent[parentOfAlias]])
					y = fillXinMatr(y, parentOfAlias,parent[parentOfAlias],allE,arrE,offset)[0]
					parentOfAlias = parent[parentOfAlias]
					
					
				elif depth[parentOfAlias] < depth[original]:        # original weg
					
					cyclesCyclesSecHalf.push_front([ parent[original],original])
					y = fillXinMatr(y,parent[original],original,allE,arrE,offset)[0]
					original = parent[original]
					
					
				else:                                               # both
					cyclesCycles.append([parentOfAlias,parent[parentOfAlias] ])
					y = fillXinMatr(y, parentOfAlias,parent[parentOfAlias],allE,arrE,offset)[0]
					parentOfAlias = parent[parentOfAlias]
					
					cyclesCyclesSecHalf.push_front([parent[original],original])
					y = fillXinMatr(y,parent[original],original,allE,arrE,offset)[0]
					original = parent[original]
					
	
			for c in cyclesCyclesSecHalf:
				cyclesCycles.append(c)
			completeCycle.append( cyclesCycles)
			

			offset += 1
	
	
	electricGauss( matrixY, arrE)
	emit_signal("closedGraphPart",G,root,completeCycle)
	
	
func fixShortcut(_Gr,_roott,completeCyclee):
	var _hasShot = false
	for e in Myglobals.allEdgesBase.get_children():
		for c in completeCyclee:
				for cc in c:
					if e.connectedKnodes[0].get_position_in_parent() == cc[0] or  e.connectedKnodes[0].get_position_in_parent() == cc[1] or e.connectedKnodes[1].get_position_in_parent() == cc[0] or  e.connectedKnodes[1].get_position_in_parent() == cc[1]:		
						if abs( e.power) > 1000:
							_hasShot = true
							e.fire()

func fillXinMatr(matrX, v_ch,v_p, allE ,arrE, off ):
	var x = findE(v_ch,v_p,allE)
	var R = allEdgesBase.get_child(x).resistance
	var U = allEdgesBase.get_child(x).voltage
	var valR = 0.0
	var valU = 0.0
	if allEdgesBase.get_child(x).isLockedDirection:
		if v_ch == allEdgesBase.get_child(x).connectedKnodes[0] .get_position_in_parent():
			valR = R
			valU = U
		else:
			valR = -R
			valU = -U
	else:	
		if v_ch < v_p:
			valR = R
			valU = U
		elif v_ch > v_p :
			valR = -R
			valU = -U
	
	matrX[x] = float(valR)
	arrE[off] += float(valU)
	return [matrX , arrE]
	

func findE(v1,v2,alle):
	
	for i in range(alle.size()):
		var e = alle[i]
		
		if ( v1 == e[0] &&  v2 == e[1] )   || ( v2 == e[0] &&  v1 == e[1] ):
			return i


func electricGauss( matrixY, arE):
		
		var  en = matrixY.size()
		var newMY = []

#		print("new M: ")
		for y in range( en ):
			var curX = matrixY[y]
			curX.append(arE[y])
			newMY.append(curX)
			

		makeSquare(matrixY.size(),matrixY)
		solverSol(matrixY.size(),matrixY)
		return


func makeSquare(_l,matrixY):
	var buf = []
	deleted =[]
	# knodes
	for k in range(G.size()-1, -1,-1):
		if Gvisiteds.find(k) == -1:
			buf.append(k)
	
	buf.sort()
	for i in range(buf.size()-1,-1,-1):
		matrixY.remove(buf[i])
		
	#edges	
	for e in range(allEdgesBase.get_child_count()-1,-1,-1):
		if Gvisiteds.find(allEdgesBase.get_child(e).connectedKnodes[0].get_position_in_parent()) == -1:
			for m in matrixY:
				deleted.append(e)
				m.remove(e)
				
	matrixY.remove(matrixY.size()-1-cycles)

func solverSol(n, M):
	
	var _i = 0
	for k in range(n):
		for i in range(k,n):
			if abs(M[i][k]) > abs(M[k][k]):
				var buff = M[k]
				M[k] = M[i]
				M[i] = buff
			else:
				pass
	
		for j in range(k+1,n):
			var q = float(M[j][k]) / float(M[k][k])
			for m in range(k, n+1):
				M[j][m] -=  q * float(M[k][m])
	
	var x = []
	for _m in range(n):
		x.append(0.0)
	
	if M[n-1][n-1] == 0:
		x[n-1] ="?"
		
		print("Error solving matrices" + str(M))
	else:
		x[n-1] =float(M[n-1][n])/float(M[n-1][n-1])
		for i in range (n-1,-1,-1):
			var z = 0
			for j in range(i+1,n):
				z = z  + float(M[i][j])* float(x[j])
			x[i] = float(M[i][n] - z)/float(M[i][i])		

	var found =0
	for e in range(allEdgesBase.get_child_count()):
		if deleted.find(e)==-1:
			allEdgesBase.get_child(e).power= x[found]
			found+=1
			
