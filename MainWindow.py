#!/usr/bin/python

from PyQt5.QtGui		import	QFont
from PyQt5 				import   QtWidgets, QtCore
from Ui_MainWindow	import Ui_MainWindow
# Tables definition imports
from T_Marques		import 	T_Marques
from T_Concurrents	import 	T_Concurrents
from T_Pays			import 	T_Pays
from T_Ville				import 	T_Ville

import	Globals

racer = []

_categorie = [
	["MX1", ["Top", "Pro", "Carton"]],
	["MX2", ["Top", "Pro", "Carton"]],
	["Mini", ["Mini"]],
	["MX125", ["Top", "Pro", "Carton"]],
	["MX3", ["MX3", "Carton"]]
]
UserRole	 = 0x0100

class MainWindow(QtWidgets.QMainWindow, Ui_MainWindow):
	__RacerEdited = None

	def getRacer(self):
		return self.__RacerEdited

	def setRacer(self, theRacer):
		self.__RacerEdited = theRacer

	def __init__(self, parent=None):
		super(MainWindow, self).__init__(parent)
		self.setupUi(self)

	def connectActions(self):
		self.actionQuitter.triggered.connect(QtWidgets.qApp.quit)
		self.L_racerlist.itemDoubleClicked.connect(self.editRacer)
		self.findNumber.returnPressed.connect(self.findNumRacer)
		self.R_Npa.returnPressed.connect(self.findNpa)
		self.R_City.returnPressed.connect(self.findVille)

	def findNpa(self):
		try:
			fn = self.R_Npa.text()
			if self.t_ville.getRecord( "npa LIKE '" + fn +"'"):
				c = dict( self.t_ville._data )
				self.R_City.setText( c['nom'] )
				self.R_Npa.setText( c['npa']  )
		except Exception as e:
			print(e)
			return

	def findVille(self):
		try:
			fn = self.R_City.text()
			if self.t_ville.getRecord( "nom LIKE '" + fn +"'"):
				c = dict( self.t_ville._data )
				self.R_Npa.setText( c['npa']  )
				self.R_City.setText( c['nom'] )
		except Exception as e:
			print(e)
			return

	def findNumRacer(self):
		try:
			fn = int( self.findNumber.text() )
			item = self.L_racerlist.findItems( "%4.0d"%fn,  QtCore.Qt.MatchStartsWith)
		except:
			return
		if len( item )>0:
			self.L_racerlist.setCurrentItem( item[0])
			self.editRacer( item[0] )

	def editRacer(self, item):
		racer = item.data(UserRole)
		print (racer)
		oldracerItem = self.__RacerEdited
		if oldracerItem is not None:
			rl 	= self.R_lastname.text()
			rf	= self.R_firstname.text()
			try:
				rn	= int( self.R_number.text() )
			except:
				rn = 0
			try:
				rt 	= int( self.R_transponder.text() )
			except:
				rt 	= 0
			rm = self.R_brandMenu.itemData( self.R_brandMenu.currentIndex() )
			rp	= self.R_Npa.text()
			rc	= self.R_City.text()
			oldracer			= oldracerItem.data( UserRole )
			if oldracer is None:
				oldracer = [ 0,  "", "",  "", "",  0]

			oldracer['numero']			= rn
			oldracer['nom']					= rl
			oldracer['prenom']			= rf
			oldracer['transponder'] 		= rt
			oldracer['moto']				= rm
			oldracer['ville']				= rc
			oldracer['npa']					= rp
			oldracerItem.setText( Globals.C_concurrents_item_fmt %  ( oldracer['numero'],   oldracer['nom'],  oldracer['prenom'] ) )
			oldracerItem.setData( UserRole,  oldracer )

		if racer is None :
			self.R_lastname.setText(		"" )
			self.R_firstname.setText(		"" )
			self.R_number.setText(		"" )
			self.R_transponder.setText(	"")
		else:
			self.R_lastname.setText(		racer['nom'] )
			self.R_firstname.setText(		racer['prenom'] )
			self.R_number.setText(		"%d"%racer['numero'] )
#			if len( racer ) > 5:
			self.R_transponder.setText(	"%d"%racer['transponder'])
#			else:
#				self.R_transponder.setText(	"")
			self.R_brandMenu.setCurrentIndex( self.R_brandMenu.findData(racer['moto']))
			self.__RacerEdited = item
			self.R_Npa.setText(			racer['npa'])
			self.R_City.setText(				racer['ville'])
			if racer['npa'] == None:
				self.findVille()
			if racer['ville'] == None:
				self.findNpa()

	def initGuiPays(self):
		self.pays = T_Pays()
		self.R_Pays.clear()
		i = 0
		while self.pays.getRecord("display = TRUE", i):
			c = dict( self.pays._data )
			self.R_Pays.addItem(c['nom'], c['id'])
			i += 1

	def initGuiMarques(self):
		self.marques = T_Marques()
		self.R_brandMenu.clear()
		while self.marques.getNextRecord():
			c = dict( self.marques._data )
			self.R_brandMenu.addItem(c['nom'], c['id'])

	def initListConcurrents(self):
		self.L_racerlist.setSortingEnabled(True)
		self.concurrents = T_Concurrents()
		while self.concurrents.getNextRecord():
			c = dict( self.concurrents._data )
			c['transponder'] = 0
			racer.append( c )

	def initGuiConcurrents(self):
		font = QFont()
		font.setFamily("Courier New")
		font.setPointSize(8)
		font.setBold(False)
		font.setItalic(False)
		font.setWeight(50)
		font.setKerning(False)
		for i in racer:
			item = QtWidgets.QListWidgetItem()
			item.setText( Globals.C_concurrents_item_fmt %  ( i['numero'],   i['nom'],  i['prenom'] ) )
			item.setData( UserRole, i )
			item.setFont( font )
			self.L_racerlist.addItem(item)

	def initGui(self):
		self.t_ville = T_Ville()
		self.initGuiPays()
		self.initGuiMarques()
		self.initListConcurrents()
		self.initGuiConcurrents()

	def main(self):
		self.connectActions()
		self.initGui()
		self.show()
