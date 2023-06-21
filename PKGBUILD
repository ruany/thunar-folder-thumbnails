# Maintainer: j-james <jj@j-james.me>
pkgname=tumbler-folder-thumbnailer
pkgver=2
pkgrel=1
pkgdesc="Custom folder thumbnails for Tumbler"
arch=('any')
url="https://docs.xfce.org/xfce/tumbler/available_plugins"
license=('BSD')
depends=('tumbler' 'imagemagick')
optdepends=('inkscape: for SVG support')
source=('folder.thumbnailer'
		'folder-thumbnailer.sh'
        'thumbnailify.sh')
sha256sums=('4079476266971a1d6e48360fa3e1ee038ed9e91eb85bc089569ea0dbde3d24d4'
			'5985c98b00ce5ff93b9d324f478448e4c7682977acff1a009e9c33d3df0b9f56'
            '2e08bd5ec5755f2ccd4d4c0d8157711ff821b9fcae89285e692bd3997661055f')

package() {
	install -Dvm644 "folder.thumbnailer" "$pkgdir/usr/share/thumbnailers/folder.thumbnailer"
	install -Dvm755 "folder-thumbnailer.sh" "$pkgdir/usr/bin/folder-thumbnailer"
 	install -Dvm755 "thumbnailify.sh" "$pkgdir/usr/bin/thumbnailify"
}
