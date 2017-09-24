import PackageDescription 

let package = Package(name: "CGLib",
	pkgConfig: "glib-2.0 gio-unix-2.0",
	providers: [
		.Brew("glib glib-networking gobject-introspection"),
		.Apt("libglib2.0-dev glib-networking gobject-introspection libgirepository1.0-dev")
	]
)
