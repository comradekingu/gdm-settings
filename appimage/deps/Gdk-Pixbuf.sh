#!/usr/bin/bash

echo 'Copying Gdk Pixbuf'

# Dependencies
copy /usr/lib/libjpeg.so*
copy /usr/lib/libturbojpeg.so*

# Files
copy /usr/lib/girepository-1.0/GdkPix*-2.0.typelib
copy /usr/lib/libgdk_pixbuf-2.0.so*
copy /usr/share/locale/*/LC_MESSAGES/gdk-pixbuf.mo


echo 'Copying Gdk Pixbuf Loaders'

moduledir=$(pkgconf --variable gdk_pixbuf_moduledir gdk-pixbuf-2.0)
cache_file=$(pkgconf --variable gdk_pixbuf_cache_file gdk-pixbuf-2.0)

# Files
copy "${moduledir}"
gdk-pixbuf-query-loaders | sed "s|${moduledir}/||g" > "${AppDir}/${cache_file}"
