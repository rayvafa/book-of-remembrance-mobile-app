'use strict'
module.exports = (grunt) ->

	# Load grunt tasks automatically
	require('load-grunt-tasks')(grunt)

	# Time how long tasks take. Can help when optimizing build times
	require('time-grunt')(grunt)

	grunt.initConfig

		config:
			src: 'src'
			dist: 'book-of-remembrance/www/'
			tmp: '.tmp'

	# Compiles Sass to CSS and generates necessary files if requested
		sass:
			dist:
				options:
#					style: 'compressed'
					style: 'expanded'
					lineNumbers: true
				files: [
					expand: true
					cwd: '<%= config.src %>/styles'
					src: ['styles.scss']
					dest: '<%= config.dist %>/styles'
					ext: '.min.css'
				]

	# Copies remaining files to dist
		copy:
			dist:
				files: [
					expand: true
					dot: true
					cwd: '<%= config.src %>'
					dest: '<%= config.dist %>'
					src: [
						'*.{ico,png,txt}'
						'images/**/*.*'
						'{,*/}*.html'
					]
				]

	# Compiles CoffeeScript to JavaScript
		coffee:
			dist:
				files: [
					expand: true
					cwd: '<%= config.src %>/scripts/'
					src: '{,*/}*.{coffee,litcoffee,coffee.md}'
					dest: '<%= config.tmp %>/scripts/'
					ext: '.js'
				]

		uglify:
			build:
				src: [
					'<%= config.tmp %>/scripts/**/*.js'
				]
				dest: '<%= config.dist %>/scripts/scripts.min.js'

		watch:
			styles:
				files: ['<%= config.src %>/styles/**/*.scss']
				tasks: ['sass']
				options:
					spawn: false
					debounceDelay: 1000,
			scripts:
				files: ['<%= config.src %>/scripts/**/*.coffee']
				tasks: ['coffee', 'uglify']
				options:
					spawn: false
					debounceDelay: 1000,
			files:
				files: ['<%= config.src %>/*.html','images/**/*.*']
				tasks: ['copy']
				options:
					spawn: false
					debounceDelay: 1000,

	# Empties folders to start fresh
		clean:
			dist: '<%= config.dist %>'
			tmp: '<%= config.tmp %>'

	grunt.registerTask "build", [
		"clean"
		"sass"
		"coffee"
		"uglify"
		"copy"
	]

	grunt.registerTask "default", ["build"]
