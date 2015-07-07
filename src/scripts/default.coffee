# default cordova script in coffeeScript
class App

	# Application Constructor
	initialize: () ->
		console.log 'initialize'
		this.bindEvents()

	# Bind Event Listeners
	# Bind any events that are required on startup. Common events are:
	# 'load', 'deviceready', 'offline', and 'online'.
	bindEvents: () ->
		console.log 'bindEvents'
		document.addEventListener('deviceready', this.onDeviceReady, false)

	# deviceready Event Handler
	# The scope of 'this' is the event. In order to call the 'receivedEvent'
	# function, we must explicitly call 'app.receivedEvent(...);'
	onDeviceReady: () ->
		console.log 'onDeviceReady'
		app.receivedEvent('deviceready')

	# Update DOM on a Received Event
	receivedEvent: (id) ->
		parentElement = document.getElementById(id)
		listeningElement = parentElement.querySelector('.listening')
		receivedElement = parentElement.querySelector('.received')

		listeningElement.setAttribute('style', 'display:none;')
		receivedElement.setAttribute('style', 'display:block;')

		console.log('Received Event: ' + id);

App.initialize();
